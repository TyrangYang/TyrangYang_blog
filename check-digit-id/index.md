# How to check the Chinese ID is correct


This check method will help you find out whether one digit is wrong or 2 adjacent digit are in reverse order.

## Sample code

```js
checkChineseId = (id) => {
    const ID_LENGTH = 18;
    // check type
    if (typeof id !== 'string') {
        console.error('type error');
        return;
    }

    //check length
    if (id.length !== ID_LENGTH) {
        console.error('length error');
        return;
    }

    // check each digit
    for (let i = 0; i < id.length - 1; i++) {
        const e = id[i];
        if (e < '0' || e > '9') {
            console.error('digit error');
            return;
        }
    }

    if (
        id[ID_LENGTH - 1] !== 'x' &&
        id[ID_LENGTH - 1] != 'X' &&
        id[ID_LENGTH - 1] < '0' &&
        id[ID_LENGTH - 1] > '9'
    ) {
        console.error('digit error');
        return;
    }
    //   num: 01 01 00 01 00 05 01 09 04 09 01 02 03 01 00 00 02 10
    //serial: 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
    //weight = 2^serial % 11
    //weight: 07 09 10 05 08 04 02 01 06 03 07 09 10 05 08 04 02 01 (fix)
    // calculate code
    let weight_sum = 0;
    for (let i = 0; i < id.length - 1; i++) {
        let weight = Math.pow(2, ID_LENGTH - 1 - i) % 11;
        weight_sum += id[i] * weight;
    }
    // checkCode = (12 - weight_sum % 11) % 11
    let checkCode = (12 - (weight_sum % 11)) % 11;
    // compare
    let res = false;
    if (checkCode == 10) {
        res =
            id[ID_LENGTH - 1] === 'x' || id[ID_LENGTH - 1] === 'X'
                ? true
                : false;
    } else {
        res = id[ID_LENGTH - 1] == checkCode ? true : false;
    }

    console.log(`${id} is ${res}`);
    return res;
};

module.exports = {
    checkChineseId,
};
```

