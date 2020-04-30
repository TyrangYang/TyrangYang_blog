---
title: 'Python Overview'
date: 2020-04-28T16:43:12-04:00
Categories: ['Overview']
tags: ['python']
toc:
    enable: true
    auto: true
hiddenFromSearch: false
---

This posts only use as a remainder

## Variable

### Multiple assignment

```python
x, y, name, is_cool = (1, 2.5, 'a name', True)
```

### Casting

```python
x = str(x)
# x will be string
y = int(y)
# y will be an integer
```

## String

```python
name = 'Brad'
age = 37

print('name is' + name + ' and age is ' + str(age))
print('name is {name} and age is {age}'.format(name = name, age = age))
print(f'name is {name} and age is {age}')
```

### Methods

```python
# Capitalize string
print(s.capitalize())

# Make all uppercase
print(s.upper())

# Make all lower
print(s.lower())

# Swap case
print(s.swapcase())

# Get length
print(len(s))

# Replace
print(s.replace('world', 'everyone'))

# Count
sub = 'h'
print(s.count(sub))

# Starts with
print(s.startswith('hello'))

# Ends with
print(s.endswith('d'))

# Split into a list
print(s.split())

# Find position
print(s.find('r'))

# Is all alphanumeric
print(s.isalnum())

# Is all alphabetic
print(s.isalpha())

# Is all numeric
print(s.isnumeric())

```

## List

A List is a collection which is ordered and changeable. Allows duplicate members.

## Tuple

A Tuple is a collection which is ordered and unchangeable. Allows duplicate members.

```python
# Create tuple
fruits = ('Apples', 'Oranges', 'Grapes')

# Using a constructor
# fruits2 = tuple(('Apples', 'Oranges', 'Grapes'))

# Single value needs trailing comma
fruits2 = ('Apples',)

# Get value
print(fruits[1])

# Can't change value
# fruits[0] = 'Pears'

# Delete tuple
del fruits2

# Get length
print(len(fruits))
```

## set

A Set is a collection which is unordered and unindexed. No duplicate members.

```py
# Create set
fruits_set = {'Apples', 'Oranges', 'Mango'}

# Check if in set
print('Apples' in fruits_set)

# Add to set
fruits_set.add('Grape')

# Remove from set
fruits_set.remove('Grape')

# Add duplicate
fruits_set.add('Apples')

# Clear set
fruits_set.clear()

# Delete not work
# del fruits_set

print(fruits_set)
```

## Dictionary

```py
# Create dict
person = {
    'first_name': 'John',
    'last_name': 'Doe',
    'age': 30
}

# Use constructor
# person2 = dict(first_name='Sara', last_name='Williams')

# Get value
print(person['first_name'])
print(person.get('last_name'))

# Add key/value
person['phone'] = '555-555-5555'

# Get dict keys
print(person.keys())

# Get dict items
print(person.items())

# Copy dict
person2 = person.copy()
person2['city'] = 'Boston'

# Remove item
del(person['age'])
person.pop('phone')

# Clear
person.clear()

# Get length
print(len(person2))

# List of dict
people = [
    {'name': 'Martha', 'age': 30},
    {'name': 'Kevin', 'age': 25}
]

print(people[1]['name'])

```

## Functions

A function is a block of code which only runs when it is called. In Python, we do not use curly brackets, we use indentation with tabs or spaces

```py
def sayHello(name='Sam'):
    print(f'Hello {name}')


# Return values
def getSum(num1, num2):
    total = num1 + num2
    return total
```

### lambda function

A lambda function is a small anonymous function.
A lambda function can take any number of arguments, but can only have one expression. Very similar to JS arrow functions

```py
getSum2 = lambda num1, num2: num1 + num2

print(getSum(10, 3))
```

## conditionals

`if` `elif` `else`

Comparison Operators (==, !=, >, <, >=, <=) - Used to compare values

Logical operators (and, or, not) - Used to combine conditional statements

Membership Operators (not, not in) - Membership operators are used to test if a sequence is presented in an object

Identity Operators (is, is not) - Compare the objects, not if they are equal, but if they are actually the same object, with the same memory location:

## Loop

```py
people = ['John', 'Paul', 'Sara', 'Susan']

# Simple for loop
for person in people:
  print(f'Current Person: {person}')

# Break
for person in people:
  if person == 'Sara':
    break
  print(f'Current Person: {person}')

# Continue
for person in people:
  if person == 'Sara':
    continue
  print(f'Current Person: {person}')

# range
for i in range(len(people)):
  print(people[i])

for i in range(0, 11):
  print(f'Number: {i}')

# While loops execute a set of statements as long as a condition is true.

count = 0
while count < 10:
  print(f'Count: {count}')
  count += 1
```

## Modules

```py
# Core modules
import datetime
from datetime import date
import time
from time import time

# Pip module
# pip3 install camelcase
from camelcase import CamelCase

# Import custom module
import validator
from validator import validate_email

# today = datetime.date.today()
today = date.today()
# timestamp = time.time()
timestamp = time()

c = CamelCase()
# print(c.hump('hello there world'))

email = 'test#test.com'
if validate_email(email):
  print('Email is valid')
else:
  print('Email is bad')
```

validator.py

```py
import re
def validate_email(email):
    if len(email) > 7:
        return bool(re.match("^.+@(\[?)[a-zA-Z0-9-.]+.([a-zA-Z]{2,3}|[0-9]{1,3})(]?)$", email))
```

## Classes

```py
# Create class
class User:
  # Constructor
  def __init__(self, name, email, age):
    self.name = name
    self.email = email
    self.age = age

  def greeting(self):
    return f'My name is {self.name} and I am {self.age}'

  def has_birthday(self):
    self.age += 1

# Extend class
class Customer(User):
  # Constructor
  def __init__(self, name, email, age):
    self.name = name
    self.email = email
    self.age = age
    self.balance = 0

  def set_balance(self, balance):
    self.balance = balance

  def greeting(self):
    return f'My name is {self.name} and I am {self.age} and my balance is {self.balance}'

#  Init user object
brad = User('Brad Traversy', 'brad@gmail.com', 37)
# Init customer object
janet = Customer('Janet Johnson', 'janet@yahoo.com', 25)
janet.has_birthday()
janet.set_balance(500)
print(janet.greeting())

brad.has_birthday()
print(brad.greeting())
```

## File

```py
# Open a file
myFile = open('myfile.txt', 'w')

# Get some info
print('Name: ', myFile.name)
print('Is Closed : ', myFile.closed)
print('Opening Mode: ', myFile.mode)

# Write to file
myFile.write('I love Python')
myFile.write(' and JavaScript')
myFile.close()

## with as will automatic run close()
with open('myfile.txt', 'w') as myFile:
    pass

# Append to file
myFile = open('myfile.txt', 'a')
myFile.write(' I also like PHP')
myFile.close()

# Read from file
myFile = open('myfile.txt', 'r+')
text = myFile.read(100)
print(text)
myFile.close()
## Read one line and read all line

myFile = open('myfile.txt', 'r+')
print(myFile.readline())
print(myFile.readlines())
myFile.close()
```

## Python & Json

JSON is commonly used with data APIS. Here how we can parse JSON into a Python dictionary

```py
import json

#  Sample JSON
userJSON = '{"first_name": "John", "last_name": "Doe", "age": 30}'

# Parse to dict
user = json.loads(userJSON)

# print(user)
# print(user['first_name'])

car = {'make': 'Ford', 'model': 'Mustang', 'year': 1970}

carJSON = json.dumps(car)

print(carJSON)
```
