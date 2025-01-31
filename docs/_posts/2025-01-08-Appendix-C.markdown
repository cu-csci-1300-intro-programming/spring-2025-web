---
layout: post
title: "Appendix C: Syntax Guide"
date: 2025-01-08 09:00:00 -0700
categories: jekyll update
---

This syntax guide was designed with heavy inspiration from the [Coding with Harry](https://www.codewithharry.com/tutorial/basic-structure-and-syntax-cpp/) C++ syntax guide.

&nbsp;&nbsp;&nbsp;&nbsp;
## Basics

The basic start for a C++ program is:
{% highlight c++ %}
#include <iostream>
using namespace std;

int main() {
    return 0;
}
{% endhighlight %}

Declaring variables:
{% highlight c++ %}
bool my_bool;
bool my_bool_initialized = false;
char my_char;
char my_char_initialized = 'A';
int my_int;
int my_int_initialized = 1;
double my_double;
double my_double_initialized = 3.5;
float my_float;
float my_float_initialized = -2.1;
string my_string;
string my_string_initialized = "Hello!";
{% endhighlight %}

Terminal output:
{% highlight c++ %}
cout << [statement to print];
cout << variable_contents;
cout << "Hello!";
{% endhighlight %}

Terminal input:
{% highlight c++ %}
cin >> variable_input;
getline(cin, string_input);
{% endhighlight %}

Comments:
{% highlight c++ %}
// It's a single line comment

/* It's a multi-linecomment*/
{% endhighlight %}

Compiling:
{% highlight bash %}
g++ -Wall -Werror -Wpedantic -std=c++17 file1.cpp file2.cpp ...
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Decisions
Decisions are decided based off of boolean values. In this guide, any time `< condition >` appears, it should be replaced fully (including the angle brackets) with something that expresses to a boolean value. 

If statements:
{% highlight c++ %}
if ( < condition > )
{
    //code
}
{% endhighlight %}

If-Else statements:
{% highlight c++ %}
if ( < condition > )
{
    //code
}
else
{
    //more code
}
{% endhighlight %}

If-Else-If statements:
{% highlight c++ %}
if ( < condition > )
{
    //code
}
else if ( < condition2 > )
{
    //more code
}
{% endhighlight %}

Integer switch statements. The case values can vary:
{% highlight c++ %}
switch(integer_variable){
    case 1:
        //commands
        break;
    case 2:
        //commands
        break;
    //any further cases
    default:
        //commands
}
{% endhighlight %}

Character switch statements. The case values can vary:
{% highlight c++ %}
switch(character_variable){
    case 'A':
        //commands
        break;
    case 'B':
        //commands
        break;
    // ...
    // any further cases
    // ...
    default:
        //commands
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Functions
Functions are small packages of code that can be called multiple times. The general format of a function requires a return type (which is a data type), a function name, and a list of parameter inputs, like so:

{% highlight c++ %}
<return type> FunctionName(<parameter 1>, <parameter 2>, ...);
{% endhighlight %}

There can only be one return type and it must be a data type. It can be any data type you have seen so far, or it can also be "void" which means the function returns nothing. There can be as many parameters as you like, and they must be written as `<parameter i> = <data type of parameter i> <name of parameter i>`. 

Function prototypes are just the function declaration followed by a semicolon.Here are a few function prototype examples:

{% highlight c++ %}
int AddNumbers(int numOne, int numTwo);
void PrintMenu(string menu);
double calcCircum(double radius);
{% endhighlight %}

When implementing the function, it is instead written with brackets:

{% highlight c++ %}
<return type> FunctionName(<parameter list>){
    /* code for function */
    return <something of return type>;
}
{% endhighlight %}

When calling the function, you provide the list of arguments:

{% highlight c++ %}
int sum = AddNumbers(firstVal, secondVal);
sum = (4, 5);
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Strings

Declaring strings:

{% highlight c++ %}
string my_string = "Hello World";
{% endhighlight %}

Getting the length of strings:

{% highlight c++ %}
int string_length = myString.length();
{% endhighlight %}

Appending two strings:

{% highlight c++ %}
string first_name = "Harry ";
string last_name = "Potter";
string full_name = first_name.append(last_name);
{% endhighlight %}

Accessing or changing characters:
{% highlight c++ %}
char first_character = my_string[0];
my_string[1] = 'a'; //my_string now stores "Hallo World"
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Loops
While loops repeat code as long as a condition is true:

{% highlight c++ %}
while (< condition >)
{
    /* code block to be executed */
}
{% endhighlight %}

Do-While loops will execute the block of code, and then execute it again as long as a condition is true:

{% highlight c++ %}
do
{
    /* code block to be executed */
} while (< condition >);
{% endhighlight %}

For loops will execute a block of code a given number of times. This is done by creating a variable, modifying that variable and go until a particular condition is false. 

{% highlight c++ %}
for (<create and initialize variable>; <condition>; <modify variable>){
    /* code block to be executed */
}
{% endhighlight %}

For example, to count from 0 to 9:

{% highlight c++ %}
for (int i = 0; i < 10; i++){
    /* code block to be executed */
}
{% endhighlight %}

The keyword break terminates a loop:

{% highlight c++ %}
break;
{% endhighlight %}

The keyword continue skips the rest of the current iteration of the loop:

{% highlight c++ %}
continue;
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Objects

To define a class:

{% highlight c++ %}
class Class_Name {
    public: // Access specifier
        // member functions

    private:
        //data members
};
{% endhighlight %}

To create an object of that class:

{% highlight c++ %}
Class_Name object_name;
{% endhighlight %}

Constructors describe how a new object's data members should be initialized. It does not have a return type. It must match the class name.
{% highlight c++ %}
class Class_Name {
    public: // Access specifier
        Class_Name(); //default constructor
        Class_Name(<parameter list>); //parameterized constructor

    private:
        //data members
};
{% endhighlight %}

To call a member function on a particular object:

{% highlight c++ %}
Class_Name object_name;
object_name.functionName();
{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Libraries
To use a library you need to know the library name and include it.

{% highlight c++ %}
#include<LibraryName>
#include "libraryFileYouWrote.h"
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Math
The library is called `<cmath>`.

The square root function:

{% highlight c++ %}
double square_root = sqrt(169);
{% endhighlight %}

The power function (returns the value of x raised to the power y):

{% highlight c++ %}
double power = pow(x, y);
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### File I/O
The library is called `<fstream>`.

Creating and writing to a text file:

{% highlight c++ %}
#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    // Create and open a text file
    ofstream my_file("filename.txt");

    // Write to the file
    my_file << "File Handling in C++";

    // Close the file
    my_file.close();
}
{% endhighlight %}

Opening a file and reading one line:

{% highlight c++ %}
#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    // Open a file to read from
    ifstream my_file("filename.txt");

    string file_line; 

    getline(my_file, file_line); //stores the first line in the file in file_line

    // Close the file
    my_file.close();
}
{% endhighlight %}

