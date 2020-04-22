# Review java - Array


## Declaring an array

Both are allow

```java
string argc[];
string[] argc;
```

### Int array

```java
int[] nums = new int[7];
nums[0] = 10;
```

```java
Rabbit[] racers = new Rabbit[10];//10 empty rabbit array;
racers[0] = new Rabbit("B","F");
```

## arraycopy()

```java
System.arraycopy(nums, 0, nums, 0, nums.length);
```

## Array vs ArrayList

1. An array needs to know its size at the time of creation, arrayList does not.
2. To assign an object in array you must assign it to a specific index.
3. Array use array syntax ([]).
4. ArrayList is parameterized. `ArrayList<string>`

## ArrayList

```java
ArrayList<Flower> flowerList = new ArrayList<Flower>();// <- ArrayList constructor
Flower f = new Flower();
Flower m = new Flower();

flowerList.add(f);
flowerList.add(m);
```

