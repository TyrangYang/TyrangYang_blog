# Review java - javadoc


## JavaDocs

JavaDocs is able to easily generate a code "maintenance manual"

A doc comment is made up of two parts -- a description and two or more tag.

```java
/**
* Here is description
*
* @tag Comment for tag
*/
```

### Tags

-   @author (classes and interfaces only, required)
-   @version (classes and interfaces only, required)
-   @param (methods and constructors only)
-   @return (methods only)
-   @exception
-   @see
-   @since
-   @serial (or @serialField or @serialData)
-   @deprecated

## JDK Docs

External documentation can be created with javadoc

```
javadoc -d docs file.java
```

`-d docs` create a directory store all javadoc html file.

