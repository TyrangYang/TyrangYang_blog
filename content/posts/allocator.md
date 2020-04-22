---
title: Allocator in c++
date: 2019-07-21
author: Haolin Yang
categories: ["STL-study-note"]
tags:
    - c++
    - STL
---

## Allocator is for memory

配置内存空间 -> 构建(constructor) -> 解构(destructor) -> 释放内存空间

## construct() and destroy()

用于建构和解构

## Memory allocate and release

双层配置器。第一级是区块大于 128 bytes 的，使用 malloc()和 free()。第二级是区块小于 128 bytes 的，使用 memory pool 和 freelist。

### 第一級配置器

第一級配置器以 malloc(), free(), realloc() 等 C 函式執行實際的記憶體配置、釋放、重配置動作，並實作出類似 C++ new-handler7 機制。是的，它不能直接運用 C++ new-handler 機制，因為它並非使用 ::operator new 來配置記 憶體。

所謂 C++ new handler 機制是，你可以要求系統在記憶體配置需求無法被滿足時， 喚起一個你所指定的函式。換句話說一旦 ::operator new 無法達成任務，在丟出 std::bad_alloc 異常狀態之前，會先呼叫由客端指定的處理常式。此處理常式 通常即被稱為 new-handler。new-handler 解決記憶體不足的作法有特定的模式。

注意，SGI 以 malloc 而非 ::operator new 來配置記憶體(我所能夠想像的一 個原因是歷史因素，另一個原因是 C++ 並未提供相應於 realloc() 的記憶體配 置動作)，因此 SGI 不能直接使用 C++ 的 set_new_handler()，必須模擬一個 類似的 set_malloc_handler()。

請注意，SGI 第一級配置器的 allocate()和 realloc() 都是在呼叫 malloc() 和 realloc() 不成功後，改呼叫 oom_malloc() 和 oom_realloc()。後兩者都 有內迴圈，不斷呼叫「記憶體不足處理常式」，期望在某次呼叫之後，獲得足夠 的記憶體而圓滿達成任務。但如果「記憶體不足處理常式」並未被客端設定， oom_malloc() 和 oom_realloc() 便老實不客氣地呼叫 \_\_THROW_BAD_ALLOC， 丟出 bad_alloc 異常訊息，或利用 exit(1) 硬生生中止程式。

記住，設計「記憶體不足處理常式」是客端的責任，設定「記憶體不足處理常式」 也是客端的責任。再一次提醒你，「記憶體不足處理常式」解決問題的作法有著 特定的模式，請參考 [Meyers98] 條款 7。

### 第二級配置器

SGI 第二級配置器的作法是，如果區塊夠大，超過 128 bytes，就移交第一級配置 器處理。當區塊小於 128 bytes，則以記憶池(memory pool)管理，此法又稱為次 層配置(sub-allocation):每次配置一大塊記憶體，並維護對應之自由串列(free- list)。下次若再有相同大小的記憶體需求，就直接從 free-lists 中撥出。如果客端 釋還小額區塊，就由配置器回收到 free-lists 中 — 是的，別忘了，配置器除了負 責配置，也負責回收。為了方便管理，SGI 第二級配置器會主動將任何小額區塊 的記憶體需求量上調至 8 的倍數(例如客端要求 30 bytes，就自動調整為 32 bytes)，並維護 16 個 free-lists，各自管理大小分別為 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128 bytes 的小額區塊。

```cpp
union obj {
    union obj * free_list_link;
    char client_data[1]; /* The client sees this. */
};
```

> **union** 是说明 free_list_link 这个指针和用户数据共用一段内存空间。
> 这样当在 list 中时，其中储存的是下一个的地址。如果不在 list 中被释放出来给用户使用，
> 那么存储的用户数据就会把 list 指针覆盖掉。<br>
> 总之这是一个非常有意思的技巧。专门适合这种在两种类型之间切换同时可以节省空间不用同时维护两种信息。这个只能用于 c++。对于像是 java 这种强类型的语言，这种技巧不存在。

當它發現 free list 中沒有可用區塊了，就呼叫 refill()準備為 free list 重新填充空間。新的空間將取自記憶池(經由 chunk_alloc() 完成)。預設取得 20 個新節點(新區塊)，但萬一記憶池空間 不足，獲得的節點數(區塊數)可能小於 20

從記憶池中取空間給 free list 使用，是 chunk_alloc() 的工作

上述的 chunk_alloc() 函式以 end_free - start_free 來判斷記憶池的水量。 如果水量充足，就直接撥出 20 個區塊傳回給 free list。如果水量不足以提供 20 個 區塊，但還足夠供應一個以上的區塊，就撥出這不足 20 個區塊的空間出去。這時 候其 pass by reference 的 nobjs 參數將被修改為實際能夠供應的區塊數。如果記 憶池連一個區塊空間都無法供應，對客端顯然無法交待，此時便需利用 malloc() 從 heap 中配置記憶體，為記憶池注入活水源頭以應付需求。新水量的大小為需求 量的兩倍，再加上一個隨著配置次數增加而愈來愈大的附加量。

萬一山窮水盡，整個 system heap 空間都不夠了(以至無法為記憶池注入活水源 頭)，malloc() 行動失敗，chunk_alloc() 就四處尋找有無「尚有未用區塊， 且區塊夠大」之 free lists。找到的話就挖一塊交出，找不到的話就呼叫第一級配 置器。第一級配置器其實也是使用 malloc() 來配置記憶體，但它有 out-of-memory 處理機制(類似 new-handler 機制)，或許有機會釋放其他的記憶體拿來此處使用。 如果可以，就成功，否則發出 bad_alloc 異常。

## Memory basic processing function

STL 定义了五个全域式函数，用作于内存未被初始化的空间上。construct(), destroy(),uninitialized_copy(),uninitialized_fill(),uninitialized_fill_n().

construct(), destroy()是用来构造和解构对象的。

uninitialized_copy(),uninitialized_fill(),uninitialized_fill_n()是对三个 non-POD 类型(non-Plain Old Data).内存算法。对于 POD(像是基本类型)会调用高级函数(copy(),fill(),fill_n())

### uninitialized_copy(begin,end,begin2)

将迭代器 begin1\~end(尾后迭代器)所代表的输入范围 copy 到 begin2 开始的内存,begin2 所指向的内存必须大于 begin\~end 所需的；

### uninitialized_fill(begin,end,t)

在迭代器 begin~end 范围内构建 t 的拷贝；

### uninitialized_fill_n(begin,n,t)

从 begin 开始的内存构建 n 个 t 的拷贝；

## Summary

allocator 是用来开辟空间的。 construct 和 destroy 是用来构建对象。剩下的三个函数是算法。对一段空间的拷贝。对一个对象的重复拷贝。
