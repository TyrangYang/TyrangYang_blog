# Operator overwrite in c++


## Example

increment and decrement operator

```cpp
#include <iostream>
using namespace std;

class INT
{
private:
    int m_i;
public:
    INT(int i):m_i(i){};

    friend bool operator==(INT& test1, INT& test2){
        return test1.m_i == test2.m_i;
    }

    friend bool operator!=(INT& test1, INT& test2){
        return test1.m_i != test2.m_i;
    }

    friend INT operator+(INT& test1, INT& test2){
        int temp = test1.m_i + test2.m_i;
        INT res(temp);
        return res;
    }

    INT& operator=(INT& test){
        this->m_i = test.m_i;
        return *this;
    }

    int& operator*() const{
        return (int&)this->m_i;
    }
    // int a() const {}; This means a() cannot change any member in class.

    INT& operator++(){ //prefix. ++test;
        this->m_i += 1;
        return *this;
    }
    // Why prefix is not const. Because it always return original class and actually it support ++++test.

    const INT operator++(int){ //postfix. test++;
        INT temp = *this;
        // ++(*this);
        this->m_i += 1;
        return temp;
    }
    // Postfix must be const. Because it return a temporary variable and it not support test++++.
    // You can try int i = 1; i++++;
    // This is invalid.

    friend ostream& operator<<(ostream& s, const INT& i){
        s << '[' << i.m_i << ']';
        return s;
    }

};

int main(int argc, char const *argv[])
{
    INT test(1);
    INT test1(10);
    INT test2(3);
    cout << ++test << endl; //[2]
    cout << test++ << endl; //[2]
    cout << test << endl; //[3]
    cout << *test << endl; //3
    cout << (test + test2) << endl; //[6]
    cout << boolalpha << (test == test2) << endl; //true
    test = test1;
    cout << test << endl; //[10]
    return 0;
}
```

## Second Example

convert operator

```cpp
class Rational
{
    int _n;
    int _d;

public:
    Rational(int numerator = 0, int denominator = 1) : _n(numerator), _d(denominator){};
    Rational(const Rational &rhs) // copy constructor
    {
        _n = rhs._n;
        _d = rhs._d;
    }
    ~Rational(){};

    Rational operator+(const Rational &rhs) const
    {
        return Rational((_n * rhs._d) + (_d * rhs._n), _d * rhs._d);
    }

    Rational operator-(const Rational &rhs) const
    {
        return Rational((_n * rhs._d) - (_d * rhs._n), _d * rhs._d);
    }

    Rational operator*(const Rational &rhs) const
    {
        return Rational(_n * rhs._n, _d * rhs._d);
    }

    Rational operator/(const Rational &rhs) const
    {
        return Rational(_n * rhs._d, _d * rhs._n);
    }

    Rational &operator=(const Rational &rhs)
    {
        if (this != &rhs)
        {
            _n = rhs._n;
            _d = rhs._d;
        }
        return *this;
    }
    operator std::string() const
    { // convert operator
        if (_d == 1)
            return std::to_string(_n);
        else
            return std::to_string(_n) + "/" + std::to_string(_d);
    }

    int getNomernator() const { return _n; };
    int getDenomerator() const { return _d; };
};

ostream &operator<<(ostream &o, const Rational &rhs)

{
    return o << (string)rhs;
}

int main(int argc, char const *argv[])
{
    Rational t1; // default constructor
    cout << t1 << endl;

    Rational t2(5, 3); // constructor
    cout << t2 << endl;

    Rational t3 = t2; // copy constructor
    cout << t3 << endl;

    t1 = t3 + 2;
    cout << t1 << endl;

    cout << t1 * t2 << endl;

    string b = "Rational t3 = ";

    b += t3;

    cout << b << endl;

    Rational *t = new (nothrow) Rational[5]; // new operator
    // nothrow is not throw error when allocate memory fail.
    if (t == nullptr)
        return 1; // error
    delete[] t; // delete operator
    return 0;
}
```

