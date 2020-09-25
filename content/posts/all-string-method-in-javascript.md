---
title: 'All String Method in Javascript'
date: 2020-04-07T12:49:38-07:00
Categories: ['Overview']
tags: ['javascript', 'nodejs', 'string']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

> Show all function: Try `String.prototype` & `String` in browser console.

## fromCharCode

```js
console.log(String.fromCharCode(189, 43, 190, 61));
// expected output: "½+¾="
```

## fromCodePoint

```js
console.log(String.fromCodePoint(9731, 9733, 9842, 0x2f804));
// expected output: "☃★♲你"
```

## raw

```js
// Create a variable that uses a Windows
// path without escaping the backslashes:
const filePath = String.raw`C:\Development\profile\aboutme.html`;

console.log(`The file was uploaded from: ${filePath}`);
// expected output: "The file was uploaded from: C:\Development\profile\aboutme.html"
```

## charAt

```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

const index = 4;

console.log(`The character at index ${index} is ${sentence.charAt(index)}`);
// expected output: "The character at index 4 is q"
```

## charCodeAt

```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

const index = 4;

console.log(
    `The character code ${sentence.charCodeAt(
        index
    )} is equal to ${sentence.charAt(index)}`
);
// expected output: "The character code 113 is equal to q"
```

## codePointAt

```js
const icons = '☃★♲';

console.log(icons.codePointAt(1));
// expected output: "9733"
```

## concat

```js
const str1 = 'Hello';
const str2 = 'World';

console.log(str1.concat(' ', str2));
// expected output: "Hello World"

console.log(str2.concat(', ', str1));
// expected output: "World, Hello"
```

## startsWith

```js
const str1 = 'Saturday night plans';

console.log(str1.startsWith('Sat'));
// expected output: true

console.log(str1.startsWith('Sat', 3));
// expected output: false

console.log(str1.startsWith('ur', 3));
// true
```

## endsWith

```js
const str1 = 'Cats are the best!'; // len == 18

console.log(str1.endsWith('best', 17));
// expected output: true

const str2 = 'Is this a question';

console.log(str2.endsWith('?'));
// expected output: false
```

## includes

```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

const word = 'fox';

console.log(
    `The word "${word}" ${
        sentence.includes(word) ? 'is' : 'is not'
    } in the sentence`
);
// expected output: "The word "fox" is in the sentence"
```

## indexOf

```js
const paragraph =
    'The quick brown fox jumps over the lazy dog. If the dog barked, was it really lazy?';

const searchTerm = 'dog';
const indexOfFirst = paragraph.indexOf(searchTerm);

console.log(
    `The index of the first "${searchTerm}" from the beginning is ${indexOfFirst}`
);
// expected output: "The index of the first "dog" from the beginning is 40"

console.log(
    `The index of the 2nd "${searchTerm}" is ${paragraph.indexOf(
        searchTerm,
        indexOfFirst + 1
    )}`
);
// expected output: "The index of the 2nd "dog" is 52"
```

## lastIndexOf

```js
const paragraph =
    'The quick brown fox jumps over the lazy dog. If the dog barked, was it really lazy?';

const searchTerm = 'dog';

console.log(
    `The index of the first "${searchTerm}" from the end is ${paragraph.lastIndexOf(
        searchTerm
    )}`
);
// expected output: "The index of the first "dog" from the end is 52"
```

## localeCompare

```js
const a = 'réservé'; // with accents, lowercase
const b = 'RESERVE'; // no accents, uppercase

console.log(a.localeCompare(b));
// expected output: 1
console.log(a.localeCompare(b, 'en', { sensitivity: 'base' }));
// expected output: 0
```

## match

```js
const paragraph = 'The quick brown fox jumps over the lazy dog. It barked.';
const regex = /[A-Z]/g;
const found = paragraph.match(regex);

console.log(found);
// expected output: Array ["T", "I"]
```

## matchAll

The matchAll() method returns an iterator of all results matching a string against a regular expression, including **capturing groups**.

```js
const regexp = /t(e)(st(\d?))/g;
const str = 'test1test2';

const array = [...str.matchAll(regexp)];

console.log(array);
// [["test1", "e", "st1", "1"] ["test2", "e", "st2", "2"]]
```

## normalize

```js
const name1 = '\u0041\u006d\u00e9\u006c\u0069\u0065';
const name2 = '\u0041\u006d\u0065\u0301\u006c\u0069\u0065';

console.log(`${name1}, ${name2}`);
// expected output: "Amélie, Amélie"
console.log(name1 === name2);
// expected output: false
console.log(name1.length === name2.length);
// expected output: false

const name1NFC = name1.normalize('NFC');
const name2NFC = name2.normalize('NFC');

console.log(`${name1NFC}, ${name2NFC}`);
// expected output: "Amélie, Amélie"
console.log(name1NFC === name2NFC);
// expected output: true
console.log(name1NFC.length === name2NFC.length);
// expected output: true
```

## padEnd

```js
const str1 = 'Breaded Mushrooms';

console.log(str1.padEnd(25, '.'));
// expected output: "Breaded Mushrooms........" // new str len == 25

const str2 = '200';

console.log(str2.padEnd(5));
// expected output: "200  "
```

## padStart

```js
const str1 = '5';

console.log(str1.padStart(2, '0'));
// expected output: "05"

const fullNumber = '2034399002125581';
const last4Digits = fullNumber.slice(-4);
const maskedNumber = last4Digits.padStart(fullNumber.length, '*');

console.log(maskedNumber);
// expected output: "************5581"
```

## repeat

```js
const chorus = "Because I'm happy. ";

console.log(`Chorus lyrics for "Happy": ${chorus.repeat(3)}`);
//"Chorus lyrics for "Happy": Because I'm happy. Because I'm happy. Because I'm happy. "
```

## replace

only replace the first match. If wanna match all use global flag (g)

```js
const p =
    'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

const regex = /dog/gi;

console.log(p.replace(regex, 'ferret'));
// expected output: "The quick brown fox jumps over the lazy ferret. If the ferret reacted, was it really lazy?"

console.log(p.replace('dog', 'monkey'));
// expected output: "The quick brown fox jumps over the lazy monkey. If the dog reacted, was it really lazy?"
```

## replaceAll

using a `regexp` you **must** have to set the global ("g") flag;

```js
const p =
    'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

const regex = /dog/gi;

console.log(p.replaceAll(regex, 'ferret'));
// expected output: "The quick brown fox jumps over the lazy ferret. If the ferret reacted, was it really lazy?"

console.log(p.replaceAll('dog', 'monkey'));
// expected output: "The quick brown fox jumps over the lazy monkey. If the monkey reacted, was it really lazy?"
```

## search

```js
const paragraph =
    'The quick brown fox jumps over the lazy dog. If the dog barked, was it really lazy?';

// any character that is not a word character or whitespace
const regex = /[^\w\s]/g;

console.log(paragraph.search(regex));
// expected output: 43

console.log(paragraph[paragraph.search(regex)]);
// expected output: "."
```

## slice

```js
const str = 'The quick brown fox jumps over the lazy dog.';

console.log(str.slice(31));
// expected output: "the lazy dog."

console.log(str.slice(4, 19));
// expected output: "quick brown fox"

console.log(str.slice(-4));
// expected output: "dog."

console.log(str.slice(-9, -5));
// expected output: "lazy"
```

## split

```js
const str = 'The quick brown fox jumps over the lazy dog.';

const words = str.split(' ');
console.log(words[3]);
// expected output: "fox"

const chars = str.split('');
console.log(chars[8]);
// expected output: "k"

const strCopy = str.split();
console.log(strCopy);
// expected output: Array ["The quick brown fox jumps over the lazy dog."]
```

## substring

```js
const str = 'Mozilla';

console.log(str.substring(1, 3));
// expected output: "oz"

console.log(str.substring(2));
// expected output: "zilla"
```

## toLocaleLowerCase

```js
const dotted = 'İstanbul';

console.log(`EN-US: ${dotted.toLocaleLowerCase('en-US')}`);
// expected output: "i̇stanbul"

console.log(`TR: ${dotted.toLocaleLowerCase('tr')}`);
// expected output: "istanbul"
```

## toLocaleUpperCase

```js
const city = 'istanbul';

console.log(city.toLocaleUpperCase('en-US'));
// expected output: "ISTANBUL"

console.log(city.toLocaleUpperCase('TR'));
// expected output: "İSTANBUL"
```

## toLowerCase

```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

console.log(sentence.toLowerCase());
// expected output: "the quick brown fox jumps over the lazy dog."
```

## toUpperCase

```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

console.log(sentence.toUpperCase());
// expected output: "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
```

## toString

```js
const stringObj = new String('foo');

console.log(stringObj);
// expected output: String { "foo" }

console.log(stringObj.toString());
// expected output: "foo"
```

## trim

```js
const greeting = '   Hello world!   ';

console.log(greeting);
// expected output: "   Hello world!   ";

console.log(greeting.trim());
// expected output: "Hello world!";
```

## trimEnd

```js
const greeting = '   Hello world!   ';

console.log(greeting);
// expected output: "   Hello world!   ";

console.log(greeting.trimEnd());
// expected output: "   Hello world!";
```

## trimStart

```js
const greeting = '   Hello world!   ';

console.log(greeting);
// expected output: "   Hello world!   ";

console.log(greeting.trimStart());
// expected output: "Hello world!   ";
```

## trimLeft

alias of trimStart()

## trimRight

alias of trimEnd()

## valueOf

```js
const stringObj = new String('foo');

console.log(stringObj);
// expected output: String { "foo" }

console.log(stringObj.valueOf());
// expected output: "foo"
```
