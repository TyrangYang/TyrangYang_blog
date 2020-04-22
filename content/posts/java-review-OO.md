---
title: Review java - OO
date: 2019-07-05
author: Haolin Yang
categories: ["Java"]
tags:
    - review
    - java
---

## Class & Object

A **class** only exists at _compile time_;

An **object** only exists at _runtime_.

## Data Encapsulation

Data Encapsulation/information hiding: where the internal state and operation are hidden from others.

The more information Class A knows about Class B, the greater the possibility that changing Class A will adversely affect Class B. In an ideal world, making internal changes to Class A should have no, or very little, effect on other classes.

_**Access control** allows for encapsulation_

## Access modifiers

| Qualifier |  class  | package | subclass | outside the package |
| :-------: | :-----: | :-----: | :------: | :-----------------: |
|  public   | &radic; | &radic; | &radic;  |       &radic;       |
| protected | &radic; | &radic; | &radic;  |          X          |
|  default  | &radic; | &radic; |    X     |          X          |
|  private  | &radic; |    X    |    X     |          X          |

## Instance variable & Local variable

**Instance variable** is declared inside a class but not inside a method.

**Local variable** is declared within a method.

## Getter & Setter

If a instance variable is private, constructor should use the setter of that variable.

Wrong code

```java
public class Flower {
    private String color;
    private int height;

    public Flower(){
    }

    public Flower(String c, int h){
        this.color = c;
        this.height = h;
    }

    public void setColor(String c){
        this.color = c;
    }

    public String getColor(){
        return this.color;
    }

    public void setHeight(int h){
        if(h < 0 || h > 10){
            System.out.println("ERROR");
        }
        else{
            this.height = h;
        }
    }

    public int getColor(){
        return this.color;
    }
}
```

Test code:

```java
public class FlowerTest(){
    public static void main(String[] args) {
        Flower f1 = new Flower();
        f1.setColor = "red";
        f1.setHeight = 11; // wrong
        f1.setHeight = 10; // OK

        Flower f2 = new Flower("red",11) // Should print error. BUT it pass.
    }
}
```

Change constructor into:

```java
...
    public Flower(String c, int h){
        this.setColor(c);
        this.setHeight(h);
    }
...
```

## Method overloading

Whenever two or more methods have the same name but different input parameters.

## Write a java class

1. Instance variable
2. Constructors
3. Accessors(getter)
4. Mutator(setter)
5. Service Methods
6. _toString()_ method

    With the toString() method, the object can be printed with a user-defined format.

    ```java
    public string toString(){
        return "< user-defined format";
    }
    ```

7. A test class
