---
title: Container comparison - c++ & java
date: 2019-07-11
author: Haolin Yang
categories: ["Language-comparison"]
tags:
    - c++
    - java
    - container
---

## Container comparison

C++ version is c++11. Java version is java se8.

|        C++         |     JAVA      | Description                                         |
| :----------------: | :-----------: | :-------------------------------------------------- |
|    array / [ ]     |      [ ]      | 固定大小的数组                                      |
|       vector       |   ArrayList   | 可变长度的数组                                      |
|                    |    Vector     | 可变长度的数组，支持同步操作，效率比 ArrayList 略差 |
|        list        |  LinkedList   | 双链表，便于增删                                    |
|    forward_list    |               | 单链表，c++没有给他提供 size()的方法                |
|       deque        |  ArrayDeque   | 双向队列                                            |
|       stack        |     Stack     | 栈，先进后出                                        |
|       queue        |     Queue     | 队，先进先出                                        |
|   priority_queue   | PriorityQueue | 支持优先级的队列                                    |
|        set         |    TreeSet    | 集合，数据有序，红黑树                              |
|   unordered_set    |    HashSet    | 集合，数据无序，hash                                |
|        map         |    TreeMap    | key-value 映射，key 有序，红黑树                    |
|   unordered_map    |    HashMap    | map, 无序，hash                                     |
|      multiset      |               | 集合，允许重复元素                                  |
|      multimap      |               | map，允许重复的 key                                 |
| unordered_multiset |               | 无序允许重复元素集合                                |
| unordered_multimap |               | 无序允许重复 key 的 map                             |
|                    | LinkedHashSet | 按照插入顺序，支持 hash 查找                        |
|                    | LinkedHashMap | 按照插入顺序，支持 hash 查找                        |
|                    |   HashTable   | 类似 HashMap，效率略低                              |
|       bitset       |    BitSet     | 位操作                                              |

### HashTable & HashMap

The HashMap class is roughly equivalent to Hashtable, except that it is asynchronized and permits nulls.

有两个不同：

1.  HashTable 是 synchronized 的
2.  HashTable 不支持 key 或 value 为 null。

同时由于 HashTable 是 synchronized 的，效率自然降低
