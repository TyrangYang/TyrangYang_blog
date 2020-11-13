# Jest Overview


> Jest is a JavaScript Testing Framework

Document: https://jestjs.io/docs/en/getting-started

## How to use Jest

function.js

```js
const axios = require('axios');

const functions = {
    add: (num1, num2) => num1 + num2,
    isNull: () => null,
    checkValue: (x) => x,
    createUser: () => {
        const user = { firstName: 'Brad' };
        user['lastName'] = 'Traversy';
        return user;
    },
    fetchUser: () =>
        axios
            .get('https://jsonplaceholder.typicode.com/users/1')
            .then((res) => res.data)
            .catch((err) => 'error'),
};

module.exports = functions;
```

function.test.js

```js
const functions = require('./functions');

// beforeEach(() => initDatabase());
// afterEach(() => closeDatabase());

// beforeAll(() => initDatabase());
// afterAll(() => closeDatabase());

// const initDatabase = () => console.log('Database Initialized...');
// const closeDatabase = () => console.log('Database Closed...');
const nameCheck = () => console.log('Checking Name....');

describe('Checking Names', () => {
    beforeEach(() => nameCheck());

    test('User is Jeff', () => {
        const user = 'Jeff';
        expect(user).toBe('Jeff');
    });

    test('User is Karen', () => {
        const user = 'Karen';
        expect(user).toBe('Karen');
    });
});

// toBe
test('Adds 2 + 2 to equal 4', () => {
    expect(functions.add(2, 2)).toBe(4);
});

// not
test('Adds 2 + 2 to NOT equal 5', () => {
    expect(functions.add(2, 2)).not.toBe(5);
});

// CHECK FOR TRUTHY & FALSY VALUES
// toBeNull matches only null
// toBeUndefined matches only undefined
// toBeDefined is the opposite of toBeUndefined
// toBeTruthy matches anything that an if statement treats as true
// toBeFalsy matches anything that an if statement treats as false

// toBeNull
test('Should be null', () => {
    expect(functions.isNull()).toBeNull();
});

// toBeFalsy
test('Should be falsy', () => {
    expect(functions.checkValue(undefined)).toBeFalsy();
});

// toEqual
test('User should be Brad Traversy object', () => {
    expect(functions.createUser()).toEqual({
        firstName: 'Brad',
        lastName: 'Traversy',
    });
});

// Less than and greater than
test('Should be under 1600', () => {
    const load1 = 800;
    const load2 = 800;
    expect(load1 + load2).toBeLessThanOrEqual(1600);
});

// Regex
test('There is no I in team', () => {
    expect('team').not.toMatch(/I/i);
});

// Arrays
test('Admin should be in usernames', () => {
    usernames = ['john', 'karen', 'admin'];
    expect(usernames).toContain('admin');
});

// Working with async data

// Promise
// test('User fetched name should be Leanne Graham', () => {
//   expect.assertions(1);
//   return functions.fetchUser().then(data => {
//     expect(data.name).toEqual('Leanne Graham');
//   });
// });

// Async Await
test('User fetched name should be Leanne Graham', async () => {
    expect.assertions(1);
    const data = await functions.fetchUser();
    expect(data.name).toEqual('Leanne Graham');
});
```

### Matchers

> Doc: https://jestjs.io/docs/en/using-matchers and https://jestjs.io/docs/en/expect

## Jest with react

> Doc: https://reactjs.org/docs/testing.html

### @testing-library/react

This library provide better test workflow for react. It is imported by `Create-react-app` in default

> Doc: https://testing-library.com/docs/react-testing-library/intro

> Tutorial Post: https://www.robinwieruch.de/react-testing-library

#### Search element

-   **getByText**
-   **getByRole**
-   **getByLabelText**: getByLabelText: <label for="search" />
-   **getByPlaceholderText**: getByPlaceholderText: <input placeholder="Search" />
-   **getByAltText**: getByAltText: <img alt="profile" />
-   **getByDisplayValue**: getByDisplayValue: <input value="JavaScript" />

#### getBy vs. queryBy vs. findBy

`getBy` returns an element or an error.

`queryBy` returns an element or null.

The `findBy` search variant is used for asynchronous elements which will be there eventually.

### @testing-library/react with Material UI

#### Query a Multi-select

> Reference: https://stackoverflow.com/a/61491607/12104603

```js
import React from "react";
import { render, within, screen } from "react-testing-library";
import userEvent from '@testing-library/user-event';
import Select from "@material-ui/core/Select";
import MenuItem from "@material-ui/core/MenuItem";

it('selects the correct option', () => {
   render(
     <>
       <Select fullWidth value={selectedTab} onChange={onTabChange}>
         <MenuItem value="privacy">Privacy</MenuItem>
         <MenuItem value="my-account">My Account</MenuItem>
       </Select>
       <Typography variant="h1">{/* value set in state */}</Typography>
     </>
  );

  userEvent.click(screen.getByRole('button'));

  const listbox = within(screen.getByRole('listbox'));

  userEvent.click(listbox.getByText(/my account/i));

  expect(screen.getByRole('heading').toHaveTextContent(/my account/i);
});
```

#### Common mistakes with React Testing Library

https://kentcdodds.com/blog/common-mistakes-with-react-testing-library

