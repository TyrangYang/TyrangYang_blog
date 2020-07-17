# Go overview


## Download

[Go to this link](https://golang.org/dl/)

## workspace

Run `go env` in terminal. The variable `GOPATH` is the default workspace path. Project should under this folder.

In this workspace, file should structured as how you route your project:

```
.
├── bin
├── pkg
└── src
    └── <The home web page of version control>
        └── <User name>
            └── <Project name>
```

Example:

```
.
├── bin
├── pkg
└── src
    └── github.com
        └── TyrangYang
            ├── project1
            └── project2
```

## Main type

-   string bool int
-   int int8 int16 int32 int64
-   uint uint8 uint16 uint32 uint64 uintptr
-   byte = uint8
-   rune = int32
-   float32 float64
-   complex64 complex128

## Print

Import `fmt` is necessary

[Document](https://golang.org/pkg/fmt/)

## Assignment

```go
var name = "yang"
var age = 23
var isTrue = true
name2, age2 := "yang2", 12
```

## Array

```go
// declare
var fruitArr [2]string
fruitArr[0] = "apple"
fruitArr[1] = "orange"

// declare and assign
fruitArr2 := [2]string{"apple", "orange"}
fmt.Println(fruitArr2)

fruitSlice := []string{"apple", "orange", "abc"}
fmt.Println(fruitSlice)
i, j := 1, 2

fmt.Println(fruitSlice[i:j])

```

