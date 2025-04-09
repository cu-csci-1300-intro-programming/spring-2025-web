---
layout: post
title: "Week 12: Objects Continued"
date: 2025-03-12 09:00:00 -0700
categories: jekyll update
---

Be advised, week 11 was Spring Break.

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
This week you will:
    <ol>
        <li>Learn the differences between header and source files</li>
        <li>Compile multiple files and organizing code across multiple files</li>
        <li>Learn how to nest objects</li>
        <li>Learn how to work with arrays of objects</li>
    </ol>
</div>

**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 9.9, 9.11
1. Wednesday: review chapters 6 (arrays) and 9 (classes) as needed
1. Friday: review chapters 6 (arrays) and 9 (classes) as needed


&nbsp;&nbsp;&nbsp;&nbsp;
## Background
If you have not already, please read <a href="https://cu-csci-1300-intro-programming.github.io/spring-2025-web/jekyll/update/2025/02/13/Week-9-Struct.html#classes">Week 9's background section</a>

&nbsp;&nbsp;&nbsp;
### Header and Source Files
Creating our own classes with various data members and functions increases the complexity of our program. Putting all of the code for our classes as well as the main functionality of our program into one `.cpp` file can become confusing for you as a programmer, and we need ways of reducing the visual clutter that this creates. This is why, as we increase the complexity of a program, we might need to create multiple files: header and source files, which capture the *definition* and *implementation* of the class, respectively.

&nbsp;&nbsp;
#### Header Files

Header files have `.h` as their filename extensions. In a header file, we declare one or more of the complex structures (classes) we want to develop. In a class, we define member functions and member attributes. These functions and attributes are the building blocks of the class.


{% highlight c++ %}
// Example File 0: ClassName.h
#include <iostream> 
using namespace std; 
class ClassName 
{ 
    public: 
    . 
    . 
    . 
    private: 
    . 
    . 
    . 
};
{% endhighlight %}

{% highlight c++ %}
// Example File 1: IntelligenceAgency.h
#include <iostream> 
using namespace std; 
class IntelligenceAgency
{
    public:
        IntelligenceAgency();         // Default constructor
        IntelligenceAgency(string classifiedIntelligenceInput); // Parameterized const
        string organization_name;
        string getClassifiedIntelligence(){return classifiedIntelligence};
        void setClassifiedIntelligence(string classifiedIntelligenceInput)
        {classifiedIntelligence=classifiedIntelligenceInput};

    private:
        string classified_intelligence;
};
{% endhighlight %}



&nbsp;&nbsp;
#### Source File

Source files are recognizable by the `.cpp` extension. In a source file, we implement the class defined in the header file. Since we are splitting the development of actual code for the class into a definition (header file) and an implementation (source file), we need to link the two somehow.

{% highlight c++ %}
//IntelligenceAgency Example
#include "IntelligenceAgency.h"
{% endhighlight %}

Or, more generally,

{% highlight c++ %}
//General Example
#include "ClassName.h"
{% endhighlight %}

In the source file, we will include the header file that defines the class so that the source file is “aware” of where we can retrieve the definition of the class. We must define the class definition in every source that wants to use our user defined data type (our class). When implementing each member function, our source files must tell the compiler that these functions are actually the methods defined in our class definition using the syntax that we showed earlier.


&nbsp;&nbsp;
#### How To Compile Multiple Files

Once you create a project with one or more separate classes, it will be necessary to write multiple files (`.h` and `.cpp`) and test them before submitting them. You need to compile and execute your code using the command line. Make sure that you start by changing directories so that you are in the folder where your solution’s files are stored. In this example, our folder will be called **project2**. To change to this directory, use:

{% highlight bash %}
cd project2/
{% endhighlight %}


When compiling from the command line, you need to specify every `.cpp` file in your project. This means that when you call the g++ compiler, you need to explicitly name the files you’re compiling:

{% highlight bash %}
# short
g++ -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}


The compiling command results in the creation of an executable file. Note that header files (.h) are NOT included in compilation commands. If you did not specify a name for this executable, it will be named `a.out` by default. To execute this file, use the command:

{% highlight bash %}
./a.out
{% endhighlight %}


You can add the \mintinline{bash}{-o} flag to your compiling command to give the output file a name:

{% highlight bash %}
g++ -o myName.out -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}


And then run it with:

{% highlight bash %}
./myName.out
{% endhighlight %}


At this stage, you may also find it helpful to begin compiling with flags that tell you more information about possible errors in your code. These flags include:

{% highlight bash %}
-Wall
{% endhighlight %}


Wall is short for "Warn All", which will turn on most of the warnings in C++. This will help identify various possible ways your code might go wrong, including array bounds errors and other helpful messages.

{% highlight bash %}
-Werror
{% endhighlight %}


Werror will treat all warnings as errors. This will prevent you from skipping past the possible sources of error in your code, and you will need to make sure all warnings are resolved prior to compiling.

{% highlight bash %}
-Wpedantic
{% endhighlight %}


This flag enables warnings that alert you about language constructs that are not ISO C or ISO C++ standard compliant. This is particularly helpful to identify constructs that may not be uniform in other compilers, which could cause problems with your code on other machines. This will help prevent instances where your code works on your personal computer, but does not work on CodeRunner or on the grader's computer. All together, your command line prompt will look something like this:

{% highlight bash %}
-Wsign-compare
{% endhighlight %}

This flag ensures that you don't have issues across machines and their behavior on looping over a string.

{% highlight bash %}
g++ -Wall -Werror -Wpedantic -Wsign-compare -o myName.out -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}

{% comment %}
%maybe add a section on header guards? 
%add a section on arrays in objects?
{% endcomment %}

## PreQuiz  (due Monday March 31 at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="https://canvas.colorado.edu/courses/117869/quizzes/462060">Recitation 12 Pre-quiz</a>
</div>

&nbsp;&nbsp;&nbsp;&nbsp;

## Recitation
&nbsp;&nbsp;&nbsp;

### Recitation Discussion
**Structures and classes can both be used to achieve similar functionalities. When would you use over the other. Why?**

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 1
The following code defines a class to track a temperature reading. Identify and fix the error.

```cpp
#include <iostream>
using namespace std;

class Temperature {
public:
    Temperature(double t) { 
        temp = t; 
    }

    double getTemp() { 
        return temp; 
    }

private:
    double temp;
};

int main() {
    const Temperature todayTemp(98.6);
    cout << "Today's temperature is: " << todayTemp.getTemp() << " degrees." << endl;
    return 0;
}
```


### Recitation Spot The Error - Problem 2
The following code is supposed to define a class with a constructor to initialize a private data member representing an account balance. Identify and fix the error.

```cpp
#include <iostream>
using namespace std;

class Account {
public:
    Account(double bal) {
        amount = bal;
    }

    double getBalance() const {
        return balance;
    }

private:
    double balance;
};

int main() {
    Account myAcc(1000.0);
    cout << "Current balance: " << myAcc.getBalance() << endl;
    return 0;
}
```


### Recitation Spot The Error - Problem 3
The following code is supposed to define a class with a private data member and a setter method that updates it. Identify and fix the error.

```cpp
#include <iostream>
using namespace std;

class Car {
    int milesDriven;

    void setMiles(int newMiles) {
        milesDriven = newMiles;
    }
};

int main() {
    Car myCar;
    myCar.setMiles(100);
    return 0;
}
```

### Recitation Pizza Shop Order System - Problem 4

This exercise focuses on using structs and basic arrays in C++ to create a simple pizza shop ordering system. You will define structs to represent pizzas and orders, as well as functions to manage and calculate the order's total.

To begin, define a struct called `Pizza`. The `Pizza` struct should have three fields: a string `name` for the pizza’s name (e.g., "Pepperoni" or "Veggie"), a string `size` for the pizza’s size ("small" "medium" or "large"), and a double `price` for the pizza’s cost. Next, create a function called `displayPizza` that takes a `Pizza` object as an argument and outputs its details in a readable format such as:

`[Size] [Name]: [Price]`

For example, a medium pepperoni pizza priced at \$8.50 should display as `Medium Pepperoni: $8.50`.

Now, create a second struct called `Order` to represent a customer’s order. The `Order` struct should contain an array of `Pizza` objects and an integer `numPizzas` that tracks the number of pizzas in the order. To keep things simple, assume a maximum of 10 pizzas per order. Define `numPizzas` with an initial value of 0.

Next, write a function called `addPizza` that takes an `Order` and a `Pizza` as arguments, adds the pizza to the order’s `pizzas` array, and increments `numPizzas`. If the order already has 10 pizzas, output an error message and prevent additional pizzas from being added.

Now create a function called `calculateTotal` that takes an `Order` as a parameter and returns the total price of all pizzas in the order by summing the `price` of each `Pizza` in the `pizzas` array. Finally, implement a function called `displayOrder` that prints out each pizza in the order using `displayPizza` and then displays the total order cost.

In the `main` function, test your structs and functions by creating a few `Pizza` structs, an `Order` struct, and adding the pizzas to the order. Finally, call `displayOrder` to print the details of the order and verify that the total is calculated correctly.

#### Recitation Pizza Shop Order System - Problem 4.a. : Examples
Write three possible assert statements to test your program. Try to pick values that will test different aspects of your program.

#### Recitation Pizza Shop Order System - Problem 4.b. : Implementation
Implement your solution in C++ using VS Code. Save, compile, and run it. Make sure you test for other boundary conditions not covered by your assert statements.


&nbsp;&nbsp;&nbsp;&nbsp;

## Recitation Submission Guidelines
 
**Important:** Follow these instructions carefully when preparing your recitation assignments. Your final submission should be in a single document, and the only action required on Canvas is uploading that document.
 
1. **Documentation:**
   - **Create a pdf** that includes your submission for all recitation questions. This is the pdf you will upload to your canvas assignment. Feel free to use Word/Google doc to create the pdf.
   - Clearly label each question with its corresponding number and include content as applicable (see #2).
 
2. **Content to Include:**
   - **Screenshots of Your Code:**
     - For each question, include a screenshot of your code.(corrected code in case of spot the errors)
   - **Screenshots of Code Output (if applicable):**
     - For some longer questions, it might be required to take a screenshot of the code’s output. Include these screenshots as part of your submission.
   - **Longer Recitation Questions (Multiple Parts):**
     - **Option A:**  
       - Comment your answers directly within your code file.(Spot the errors)
       - Take screenshots of the commented code and paste them into your document.
     - **Option B:**  
       - Take screenshots of the unmodified code.
       - Write your answers (Free Response/Pseudocode/Edge case identifictation) to the subquestions in the pdf document next to the corresponding screenshots.
 
3. **Submission:**
   - **Upload the final pdf document** to Canvas. This is the only action required on Canvas for your submission.

&nbsp;&nbsp;&nbsp;&nbsp;
## Homework 8
{% comment %}
%all object content is fair game here. Make sure to have 1 question with an array of objects
{% endcomment %}

**Warning: You are not allowed to use global variables for this assignment.**

All function names, return types, and parameters must precisely match those shown. You may not use pass by reference or otherwise modify the function prototypes. You are welcome to create additional functions that may help streamline your code. 

**Note:** Questions 1 through 3 are grouped together as Part I, and Questions 4 through 6 are grouped together as Part II.

In Part I, you'll develop a basic Library System by creating a Library class to manage a collection of books. In Part II, you'll develop a Quest Style Game.

&nbsp;&nbsp;&nbsp;
### QUESTION 1: Library Class 


Create a class Library by splitting the code into the following files:

<ol>
    <li>A header file `Library.h` to declare the definition of the class</li>
    <li>An implementation file `Library.cpp` to implement the class defined in the header</li>
    <li>A driver file `LibraryDriver.cpp` that contains the main function</li>
</ol>


**For Question 1, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner and paste `Library.h` and `Library.cpp` files into the answer box. (Note: You are not expected to complete the implementation of `getAveragePageCount()` function for Q1, but do include the function declaration within the header file).** DO NOT include any #include <> lines.


&nbsp;&nbsp;
The Library class comprises the following attributes:
**Data members (private)**

| **Member Type** | **Member Name** | **Description** |
| --- | --- | --- |
| `string` | `_name` | The name of the Library |
| `const static int` | `_MAX_BOOKS` | The maximum number of books the library can hold; will be 10 for this question |
| `int[]` | `_page_counts` | Array containing the page counts of books in the library. The size of this array is `_MAX_BOOKS` |
| `int` | `_current_books` | The current number of books in the Library.<br />**NOTE** `_current_books` serves as the insertion index for the `_page_counts` array. |

&nbsp;&nbsp;


**Member Functions (public)**

| **Function** | **Description** |
| --- | --- |
| <tt>Default constructor</tt> | Creates a new instance of `Library` by setting `_name` to an empty string, `_current_books` to 0, and each entry in `_page_counts` to 0. |
| `Library(string)` | Creates a new instance of `Library` with `_name` as the string parameter. The `_current_books` is set to 0, and each entry in the `_page_counts` array is set to 0. |
| `Library(string, int[], int)` | Creates a new instance of `Library` with `_name` as the string parameter, `_current_books` as the integer parameter, and fills the `_page_counts` array. See Function Specification table below for more details. |
| `string getName()` | Returns the `_name` of the `Library`. |
| `int getCurrentBooks()` | Returns the `_current_books` of the `Library`. |
| `void setName(string)` | Sets the `_name` to the value of the provided string parameter. |
| `int getPageCount(int)` | Returns the page count at a specified index in `_page_counts`, or -1 if the index is out of bounds. |
| `bool addPageCount(int)` | Returns `true` if the new page count can be added to the `_page_counts` array. If `_current_books` is already equal to `_MAX_BOOKS`, returns `false`. See Function Specification table below for more details. |
| `double getAveragePageCount()` | Calculates and returns the average page count of the books in the `Library`. See Question 2 for more details. |



&nbsp;&nbsp;
**Function Specifications:**

| **Function:** | `Library(string, int[], int)` <br /> `Library(string name, int page_counts[], int arr_size)` |
| **Purpose:** | This parameterized constructor creates a new instance of the `Library` class. <br /> - Sets `_name` to `name`. <br />- Sets `_current_books` to `arr_size` if `arr_size` doesn't exceed `_MAX_BOOKS`; otherwise, `_current_books` is set to `_MAX_BOOKS`. <br /> - Copies elements from `page_counts[]` into the `_page_counts[]` array, up to the size indicated by `_current_books`. |
| **Parameters:** | `string` `name` - The name of the Library. <br />
`int` `page_counts[]` - Array containing page counts of books in the library. <br /> `int` `arr_size` - The size of the `page_counts[]` array. |
| **Return Value:** | N/A |
| **Error Handling:** | If `arr_size` exceeds `_MAX_BOOKS`, only the first `_MAX_BOOKS` elements are stored in the `_page_counts[]` array. Do NOT print any other statements to handle this scenario. |

&nbsp;&nbsp;
**Example:**
{% highlight c++ %}

// Assume the proper libraries are included
// Assume the proper implementation of the class is included

int main() {
    string name = "City Library";
    const int arr_size = 5;
    int page_counts[arr_size] = {250, 300, 150, 500, 400};
    Library new_library = Library(name, page_counts, arr_size);
}

// Expected Contents of `new_library` Object:
// _name = "City Library"
// _MAX_BOOKS = 10
// _current_books = 5
// _page_counts[] = { 250, 300, 150, 500, 400, 0, 0, 0, 0, 0 }
{% endhighlight %}



&nbsp;&nbsp;

| **Function:** | `addPageCount(int)`<br />`bool addPageCount(int pages)` |
| **Purpose:** | Adds the provided page count to the `_page_counts` array. |
| **Parameters:** | `int` `pages` - The number of pages to be added. |
| **Return Value:** | `bool` : Returns a boolean indicating whether the new page count was successfully added to the `_page_counts` array. |
| **Error Handling:** | - If `_current_books` is already equal to `_MAX_BOOKS`, do not add or modify any contents, and return `false`. <br />- If the `pages` count is non-positive, do not add or modify any contents, and return `false`. <br />- Return `true` if the new entry is successfully added. |

**Example:**
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the Library class is included

int main() {
    string name = "City Library";
    int arr_size = 5;
    int page_counts[arr_size] = {250, 300, 150, 500, 400};
    Library new_library = Library(name, page_counts, arr_size);
    cout << new_library.addPageCount(90) << endl;
}

// Expected Return Value:
// true

// Expected Contents of `new_library` Object after Function Call:
// `_name` = ``City Library" 
// `_MAX_BOOKS` = 10
// `_current_books` = 6 
// `_page_counts[]` = {250, 300, 150, 500, 400, 90, 0, 0, 0, 0 }
{% endhighlight %}



&nbsp;&nbsp;&nbsp;
### QUESION 2: Find Average Page Count of Books in a Library

Write a member function `getAveragePageCount()` in the Library class to find the average page count of the books in `_pageCounts`.

**For Question 2, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas paste code from `Library.h` and `Library.cpp` into the answer box.** 


| **Function:** | `getAveragePageCount()` <br />`double getAveragePageCount()` |
| **Purpose:** | Calculates and returns the average page count of the books in the `Library`. |
| **Parameters:** | This member function takes no parameters. |
| **Return Value:** | `double` : The average page count of all books in the library. <br />The function should not print anything. |
| **Error Handling:** | Return `0` if the `_current_books` is zero. |

**Example:** 

Note: This is only an example usage of the function; you need to develop your own main function to fulfill the requirement for this problem.

{% highlight c++ %}

// Assume the proper libraries are included
// Assume the proper implementation of the library class is included

int main()
{
    string name = "City Library";
    int arr_size = 5;
    int page_counts[arr_size] = {250, 300, 150, 500, 400};
    Library new_library = Library(name, page_counts, arr_size);
    cout << fixed<< setprecision(2) << new_library.getAveragePageCount() << endl;
}

// The expected output after the function call:
// 320.00
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
### QUESTION 3: Library with the Largest Average Page Count

Write a function `findLibraryWithLargestAveragePageCount()` to find the `Library` in the array with the largest average page count.

&nbsp;&nbsp;
**For Question 3, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste code from `Library.h`, `Library.cpp`, and the function `findLibraryWithLargestAveragePageCount` into the answer box.** 


{% highlight c++ %}
string findLibraryWithLargestAveragePageCount( 
        Library libraries[], 
        const int ARR_SIZE
        )
{
    // ...
}
{% endhighlight %}

| **Function:** | `findLibraryWithLargestAveragePageCount(Library[], const int)` |
| **Purpose:** | Finds the name of the library in the `libraries` array with the largest average page count of the libraries. |
| **Parameters:** | `Library` `libraries[]` - Array of Library objects. <br />`const int` `ARR_SIZE` - The size of the `libraries` array. |
| **Return Value:** | `string` : The name of the library with the largest average page count. The function should not print anything. |
| **Error Handling:** | - If multiple libraries have the same largest average page count, return the name of the first library with the largest average page count found in the array. <br />- All libraries[] array will be non-empty. |

**Example:** 
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the Library class is included

int main() 
{
    const int ARR_SIZE = 2;
    int page_counts1[3] = {250, 300, 350};
    int page_counts2[4] = {200, 300, 250, 400};
    Library library1 = Library("Downtown Library", page_counts1, 3);
    Library library2 = Library("Uptown Library", page_counts2, 4);
    Library libraries[ARR_SIZE] = {library1, library2};
    cout << findLibraryWithLargestAveragePageCount(libraries, ARR_SIZE) << endl;
}

// Expected Output:
// Downtown Library

// Explanation:
// Average page count of `library1` = 300.00
// Average page count of `library2` = 287.50
// `library1` has the largest average page count, 
//     so we return the name of `library1`, 
//     i.e., `Downtown Library`.

{% endhighlight %}


&nbsp;&nbsp;&nbsp;
### QUESTION 4: Character Class 

Develop a class called Character that will represent either a player or a creature. This class will be split into:

<ol>
    <li>A header file `Character.h` to declare the definition of the class</li>
    <li>An implementation file `Character.cpp` to implement the class defined in the header</li>
    <li>A driver file `CharacterDriver.cpp` that contains the main function</li>
</ol>


**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste `Character.h` and `Character.cpp` into the answer box.** DO NOT include any #include <> lines.

&nbsp;&nbsp;
**Data members (private)**

| **Member Type** | **Member Name** | **Description** |
| --- | --- | --- |
| `string` | `_name` | The characters name |
| `double` | `_health` | The characters health points |
| `int` | `_mana` | The amount of magical energy that the character has `_mana` |
| `char` | `_status` | Current status: <br />- `'A'` for Active<br />- `'C'` for Cursed<br />- `'F'` for Frozen |
| `bool` | `_isCreature` | Specifies if the character is a mystical creature |


&nbsp;&nbsp;
**Member Functions (public)**


{% comment %}
not sure why, but these tables won't join for me. so changed titles and made two separate tables
{% endcomment %}

| **Function** | **Description** |
| --- | --- |
| `string getName()` | Returns the `_name` of the `character`. |
| `double getHealth()` | Returns the `_health` of the character. |
| `int getMana()` | Returns the `_mana` of the character. |
| `char getStatus()` | Returns the current status of the character. |
| `bool getIsCreature()` | Returns if the character is a creature. |
| `void setName(string name)` | Sets the `_name` to the value of the provided string parameter. |
| `void setHealth(double health)` | Sets the amount of `_health` the character possesses to the given value health only if it is a non-negative value, else it is not changed |
| `void setStatus(char status)` | Sets the status to one of the allowed characters (A, C, or F) to the given value status only if it is one among A, C or F, else it is not changed |
| `void setMana(int mana)` | Sets the amount of `_mana` the character possesses to the given value mana only if it is a non-negative value, else it is not changed |
| `void setIsCreature(bool isCreature)` | Sets if the character is a creature |
| `void printStats()` | Prints out the character's stats See Function Specification table below for more details |

| **Constructor** | **Description** |
| --- | --- |
| <tt>Default constructor</tt> | Initializes `_mana` and `_health` to 0, `_name` to an empty string, `_status` to 'A', and `_isCreature` to false |
| `Character(string, `<br />`double,`<br />`int, `<br />`char,`<br />` bool)` | Initializes the data members with the provided values. *See Function Specification in table below for more details.* |


&nbsp;&nbsp;
**Function Specifications:**

{% highlight c++ %}
// Character(string, double, int, char, bool)
Character( string name, 
           double health, 
           int mana, 
           char status, 
           bool isCreature )
{
    // ...
}
{% endhighlight %}

| **Purpose:** | This parameterized constructor creates a new instance of the `Character` class and sets the data members as provided. |
| **Parameters:** | `string name` - The name of the character. <br />`double health` - Health points of the character. <br />`int mana` - Amount of magical energy the character has. <br />`char status` - The current status of the character ('A' for Active, 'C' for Cursed, 'F' for Frozen).<br />`bool isCreature` - Specifies if the character is a mystical creature. |
| **Return Value:** | N/A |
| **Error Handling:** | `_health` is set to the value of `health` only if it is non-negative; otherwise, it is set to 0. <br />`_mana` is set to `mana` only if it is non-negative; otherwise, it is set to 0. <br />`_status` is set to `status` if it is 'A', 'C', or 'F'; otherwise, it is set to 'A'. |

**Example:**
Note: This is only an example usage of the function; you need to develop your own main function to fulfill the requirement for this problem.

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the Character class is included

int main() {
    Character character1("Elara", 8.2, 12, 'F', true);
}

// Expected Contents of `character1` Object:
// _name = "Elara"
// _health = 8.2
// _mana = 12
// _status = 'F'
// _isCreature = true
{% endhighlight %}



| **Function:** | `printStats()` <br />`void printStats()` |
| **Purpose:** | This member function prints the stats of the character. All `double` values are printed up to 2 decimal places. |
| **Parameters:** | This function takes no parameters. |
| **Return Value:** | `void` : The function does not return any value. |


**Example:**


{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the Character class is included

int main() {
    Character character1("Elara", 8.2, 12, 'F', true);
    character1.printStats();
}


// Expected Output:
// Elara's stats:
// Health: 8.20
// Status: F
// Mana: 12
// Is Creature: Yes
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
### QUESTION 5: Game Class 

Create a class Game by splitting the code into the following files:
<ol>
    <li>A header file `Game.h` to declare the definition of the class</li>
    <li>An implementation file `Game.cpp` to implement the class defined in the header</li>
    <li>A driver file `GameDriver.cpp` that contains the main function to test the class</li>
</ol>


**For Question 5, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste `Game.h`, `Game.cpp`, `Character.h`, and `Character.cpp` into the answer box.** 

&nbsp;&nbsp;
**Data members (private)**

| **Member Type** | **Member Name** | **Description** |
| --- | --- | --- |
| `Character[]` | `_players[2]` | Array storing player objects<br />That is our user defined `Character` type and not the standard C++ `char` datatype. |
| `Character[]` | `_creatures[2]` | Array storing mystical creature characters<br />That is our user defined `Character` type and not the standard C++ `char` datatype. |
| `int` | `_num_players` | Current number of players in the game |
| `int` | `_num_creatures` | Current number of creatures in the game |

&nbsp;&nbsp;

**Member Functions (public)**


| **Function** | **Description** |
| --- | --- |
| <tt>Default constructor</tt> | Creates a new instance of <tt>Game</tt> with empty `_players` and `_creatures` arrays and sets `_num_players` and `_num_creatures` to 0. |
| `Game(Character[],Character[], int, int)` |Creates a new instance of <tt>Game</tt> with the provided parameters. See Function Specification table below for more details. |
| `int getNumPlayers()` | Returns the current number of players `_num_players`. |
| `int getNumCreatures()` | Returns the current number of creatures `_num_creatures`. |
| `void setPlayersList`<br />`(Character[], int)` | Sets the `_players` array with the provided array of <tt>Character</tt> objects. If the number of objects exceeds 2, only the first two objects are considered. Updates `_num_players` accordingly. |
| `void setCreaturesList`<br />`(Character[], int)` | Sets the `_creatures` array with the provided array of <tt>Character</tt> objects. If the number of objects exceeds 2, only the first two objects are considered. Updates `_num_creatures` accordingly. |
| `bool setPlayer(int, Character)` | Replaces a player object at the specified index in the `_players` array. See Function Specification table below for more details. |
| `Character getPlayer(string)` | Returns an object from the `_players` array based on the provided name. If no object matches the name, returns a new blank <tt>Character</tt> object. |
| `bool setCreature`<br />`(int, Character)` | Replaces a creature object at the specified index in the `_creatures` array. See Function Specification table below for more details. |
| `Character getCreature(string)` | Returns an object from the `_creatures` array based on the provided name. If no object matches the name, returns a new blank <tt>Character</tt> object. |
| `int findPlayer(string)` | Returns the index of the player object in the `_players` array based on the provided name. See Function Specification table below for more details. |
| `int findCreature(string)` | Returns the index of the creature object in the `_creatures` array based on the provided name. See Function Specification table below for more details. |
| `void printAllStats()` | Prints stats of all the players and creatures. See Function Specification table below for more details. |

&nbsp;&nbsp;
#### **Function Specifications:**

{% highlight c++ %}
// Game(Character[], Character[], int, int)
Game( Character players[], 
      Character creatures[], 
      int num_players,
      int num_creatures )
{
    // ...
}
{% endhighlight %}

| **Purpose:** | This parameterized constructor creates a new instance of the `Game` class.<br />- Sets `_num_players` to `num_players`.<br />- Sets `_num_creatures` to `num_creatures`. <br />- Assigns elements from the `players[]` array to the `_players[]` array. <br />- Assigns elements from the `creatures[]` array to the `_creatures[]` array. |
| **Parameters:** | `Character players[]` - Array of player objects. <br />`Character creatures[]` - Array of creature objects. <br />`int num_players` - Number of players in the array. <br />`int num_creatures` - Number of creatures in the array. |
| **Return Value:** | N/A |
| **Error Handling:** | If the size of either the `players[]` or `creatures[]` array is greater than 2, only the first two elements are stored in the respective arrays. |


**Example:** 

Note: This is only an example usage; you need to develop your own function to fulfill the requirement.

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the 
//        Character and Game classes is included

int main() {
    Character player1("Rhonda", 100.0, 50, 'A', false);
    Character player2("Spencer", 80.0, 30, 'A', false);
    Character creature1("Goblin", 60.0, 20, 'C', true);
    Character creature2("Dragon", 150.0, 100, 'F', true);

    Character players[2] = {player1, player2};
    Character creatures[2] = {creature1, creature2};

    Game new_game(players, creatures, 2, 2);
}

// // Expected Contents of `new_game` Object:
// _num_players = 2
// _num_creatures = 2
// _players[]` = { "Rhonda", "Spencer" }
// _creatures[]` = { "Goblin", "Dragon" }

// Note: For demonstration purposes, 
//       we are only displaying the names of 
//       the `_players[]` and `_creatures[]`. 
{% endhighlight %}



&nbsp;&nbsp;
##### **setPlayer(int, Character)**

{% highlight c++ %}
bool setPlayer(int index, Character new_player)
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Replaces the player object in the `_players` array at the specified index with the new `Character` object. |
| **Parameters:** | `int index` - Index in the `_players` array. <br />`Character new_player` - New `Character` object to replace the existing one. |
| **Return Value:** | `bool` : Returns `true` if the replacement was successful; otherwise, returns `false` if the index is out of bounds. |

**Example:** 

{% highlight c++ %}
int main() {
    Character player1("Elise", 100.0, 50, 'A', false);
    Character player2("Pawin", 80.0, 30, 'A', false);
    Character new_player("Clara", 120.0, 40, 'A', false);
    Character players[2] = {player1, player2};
    Character creatures[1] = {Character("Goblin", 60.0, 20, 'C', true)};
    Game game(players, creatures, 2, 1);
    int index = game.findPlayer("Elise");
    cout << "Status of setting player at index " 
         << index 
         << ": " 
         << game.setPlayer(index, new_player) 
         << endl;
}

// // Expected Output:
// Status of setting player at index 0: 1
{% endhighlight %}

&nbsp;&nbsp;
##### **setCreature(int, Character)**
{% highlight c++ %}
bool setCreature(int index, Character new_creature)
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Replace the creature object in the `_creatures` array at the specified index with the new <tt>Character</tt> object. |
| **Parameters:** | `int index` - Index of the creature object in the `_creatures` array. <br />`Character` `new_creature` - The new `Character` object which replaces an older object in the `_creatures` array. |
| **Return Value:** | `bool` : Returns `true` if the new object replaces an older object in the `_creatures` array; returns `false` if the index is out of bounds. |
| **Error Handling:** | Returns `false` if the attribute index is not within the size of the `_creatures` array. |


**Example:** 

{% highlight c++ %}
int main() {
    Character player1("Brian", 100, 50, 'A', false);
    Character player2("Sam", 80, 100, 'A', false);
    Character creature1("Hydra", 200, 60, 'C', true);
    Character creature2("Minotaur", 150, 30, 'C', true);
    Character players[2] = {player1, player2};
    Character creatures[2] = {creature1, creature2};
    int num_players = 2;
    int num_creatures = 2;
    Game new_game = Game(players, creatures, num_players, num_creatures);

    int index = new_game.findCreature("Minotaur");
    cout << "Status of setting creature at index " 
            << index 
            << " is " 
            << new_game.setCreature(index, creature1) 
            << endl;

    index = new_game.findCreature("Phoenix");
    cout << "Status of setting creature at index " 
            << index 
            << " is " 
            << new_game.setCreature(index, creature2) 
            << endl;
}

// // Expected Output:
// Status of setting creature at index 1 is 1
// Status of setting creature at index -1 is 0
{% endhighlight %}



&nbsp;&nbsp;
##### **findPlayer(string)**

{% highlight c++ %} 
int findPlayer(string name)
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Finds the index of the player object in the `_players` array whose name matches the provided name. |
| **Parameters:** | **string** <tt>name</tt> - Name of the player |
| **Return Value:** | `int` : Returns the index of the object in the `_players` array. Returns -1 if the name doesn't match any object. |


**Example:**  

{% highlight c++ %}
int main() {
    Character player1("Brian", 100, 50, 'A', false);
    Character player2("Sam", 80, 100, 'A', false);
    Character players[2] = {player1, player2};
    int num_players = 2;
    int num_creatures = 0;
    Game new_game = Game(players, nullptr, num_players, num_creatures);

    cout << "Status of finding player with name Brian: " 
            << new_game.findPlayer("Brian") 
            << endl;
    cout << "Status of finding player with name Jenna: " 
            << new_game.findPlayer("Jenna") 
            << endl;
}

// // Expected Output:
// Status of finding player with name Brian: 0 
// Status of finding player with name Jenna: -1
{% endhighlight %}




&nbsp;&nbsp;
##### **findCreature(string)**

{% highlight c++ %}
int findCreature(string name)
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Finds the index of the creature object in the `_creatures` array whose name matches the provided name. |
| **Parameters:** | **string** <tt>name</tt> - Name of the creature |
| **Return Value:** | `int` : Returns the index of the object in the `_creatures` array. Returns -1 if the name doesn't match any object. |

**Example:**

{% highlight c++ %}
int main() {
    Character creature1("Hydra", 200, 60, 'C', true);
    Character creature2("Minotaur", 150, 30, 'C', true);
    Character creatures[2] = {creature1, creature2};
    int num_players = 0;
    int num_creatures = 2;
    Game new_game = Game(nullptr, creatures, num_players, num_creatures);

    cout << "Status of finding creature with name Hydra: " 
            << new_game.findCreature("Hydra") 
            << endl;
    cout << "Status of finding creature with name Phoenix: " 
            << new_game.findCreature("Phoenix") 
            << endl;
}

// // Expected Output:
// Status of finding creature with name Hydra: 0
// Status of finding creature with name Phoenix: -1
{% endhighlight %}


&nbsp;&nbsp;
##### **printAllStats()** 
{% highlight c++ %}
void printAllStats()
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Prints the stats of all players and creatures in the game, see sample run below for exact format. Each character's stats are separated by a dashed line. You need the exact lenght dashed line for coderunner purposes. |
| **Parameters:** | This member function takes no parameters. |
| **Return Value:** | `void` : The function does not return any value. |

**Example:** 

{% highlight c++ %}
int main() {
    Character player1("Rhonda", 100.0, 50, 'A', false);
    Character player2("Spencer", 80.0, 30, 'A', false);
    Character creature1("Goblin", 60.0, 20, 'C', true);

    Character players[2] = {player1, player2};
    Character creatures[1] = {creature1};

    Game game(players, creatures, 2, 1);
    game.printAllStats();
}

// // Expected Output:
// Rhonda's stats:
// Health: 100.00
// Status: A
// Mana: 50
// Is Creature: No
// ----------------------------------------------
// Spencer's stats:
// Health: 80.00
// Status: A
// Mana: 30
// Is Creature: No
// ----------------------------------------------
// Goblin's stats:
// Health: 60.00
// Status: C
// Mana: 20
// Is Creature: Yes
// ----------------------------------------------
{% endhighlight %}





&nbsp;&nbsp;&nbsp;
### QUESTION 6: Loading Characters

To begin the game, load characters from text files to populate the player and creature lists.

Create a `players.txt` file with the following content:

{% highlight txt %}
name|health|mana|status
Brian|100|50|A
Jenna|80|100|F
{% endhighlight %}



Create a `creatures.txt` file with the following content:

{% highlight txt %}
name|health|mana|status
Goblin|100|50|A
Frog|80|100|A
{% endhighlight %}

Note: All files used in this problem are in a zipped folder titled <a href="/spring-2025-web/assets/zips/homework_8_input_files.zip" download><tt>'homework_8_input_files.zip'</tt></a> located in Canvas under the week 11 module. 

Write a function `loadCharacters()` that reads data from a text file and fills an array of Character objects. The text file contains information about different characters, with each character's information separated by the character `|` and each character listed on a new line. The function specification is provided below. 




**For Question 6, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste `Character.h`, `Character.cpp`, `Game.h`, `Game.cpp`, and `loadCharacters` function into the answer box.** 

{% highlight c++ %}
// loadCharacters(string, Character[], const int, bool)
bool loadCharacters( string filename, 
                     Character characters[],
                     const int CHARACTERS_SIZE, 
                     bool isCreature )
{
    // ...
}
{% endhighlight %}

| **Purpose:** | Reads data from the specified text file and fills the <tt>characters</tt> array with <tt>Character</tt> objects. Sets `_isCreature` based on the <tt>is\_creature</tt> parameter. |
| **Parameters:** | **string** <tt>filename</tt> - Name of the text file to be read. <br />**Character** <tt>characters[]</tt> - Array of <tt>Character</tt> objects to be filled. <br />**const int** <tt>CHARACTERS\_SIZE</tt> - The maximum size of the <tt>characters</tt> array. <br />**bool** <tt>is\_creature</tt> - Specifies if each character read from the file is a creature. |
| **Return Value:** | <tt>bool</tt> : Returns <tt>true</tt> if characters were successfully read and stored in the array; <tt>false</tt> if the file cannot be opened. |
| **Error Handling:** | - Returns <tt>false</tt> if the file cannot be opened. <br />- Ignores any empty lines in the file. <br />- The first line of the file is ignored as it contains headers. |


**Example:** 
Note: This is only an example usage of the function; you need to develop your own function to fulfill the requirement for this problem.

{% highlight c++ %}
// // Sample text file:
// name|health|mana|status
// Brian|100|50|A
// Jenna|80|100|F 

int main() {
    string filename = "characters.txt";
    const int CHARACTERS_SIZE = 5;
    Character characters[CHARACTERS_SIZE];
    bool isCreature = false;
    cout << "Function returned value: " 
            << loadCharacters(filename, 
                    characters, 
                    CHARACTERS_SIZE, 
                    isCreature) 
            << endl
            << endl;
    // Print the contents of the characters array
    for (int i = 0; i < CHARACTERS_SIZE; i++) {
        if (characters[i].getName() != "") {
            characters[i].printStats();
            cout << endl;
        }
    }
}

// // Expected Output:
// Function returned value: 1
//
// Brian's stats:
// Health: 100.00
// Mana: 50
// Status: A
// Is Creature: No
// ----------------------------------------------
// Jenna's stats:
// Health: 80.00
// Mana: 100
// Status: F
// Is Creature: No
{% endhighlight %}

