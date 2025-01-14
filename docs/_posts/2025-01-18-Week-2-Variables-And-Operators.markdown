---
layout: post
title:  "Week 2: Variables and Operators"
date:   2025-01-11 12:58:53 -0700
categories: jekyll update
---


## Learning Goals

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Identify and understand variable types and operations on variables</li>
    <li>Implement variables and operations in a C++ program to solve a computational problem</li>
    <li>Write arithmetic expressions and assignment statements in C++</li>
    <li>Appreciate the importance of comments and good code layout</li>
    <li>Create programs that read and process input, and display the results</li>
  </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}



&nbsp;&nbsp;&nbsp;&nbsp;
## Background
### Variables and Operators
This week we learned about variables and basic arithmetic operators in computer science. 

Variables in computer science are similar to variables you have seen in other math and science courses. A **variable** is a value that can change, depending on conditions or on information passed to the program.

A computer stores variables differently depending on the type of information they are meant to contain, so we must declare the type of variable. This table will tell you the names of different types of variables in C++:


| Type of variable | Declaration in `C++` | Size | Description | `Example` |
| --- | --- | --- | --- | --- |
| Integer | `int` | 2 or 4 bytes | a number that has no decimal value | `-42` |
| Float | `float` | 4 bytes | a number that has short decimal values | `2.98` |
| Double | `double` | 8 bytes | a number that can have longer decimals | `2.98<...>` |
| Character | `char` | 1 byte | stores a single letter/character using ASCII values | `'h'` |
| Boolean | `bool` | 1 byte | stores either True or False | `true` |


{% highlight c++ %}
// Here is an example of declaring variables:
int myNumber = 0;
double myDecimal = 3.1415;
char myEmptyChar;
{% endhighlight %}

After declaring variables, you can access them without repeating their data type. You can also perform basic operations, including the ones listed in this table:

| `Operator` | Description | `Example` |
| --- | --- | --- |
| `+` | Adds together two values | `x + y` |
| `+=` | Adds to itself and stores the new value| `x += y` |
| `-` | Subtracts one value from another | `x - y` |
| `*` |	Multiplies two values | `x * y` |
| `/` | Divides one value by another | `x / y` |
| `%` | Modulus; this returns the division remainder | `x % y` |
| `++` | Increment; this increases the value of a variable by 1 | `++x` |
| `--` | Decrement; this decreases the value of a variable by 1 | `-` |


{% highlight c++ %}
// Here is an example of declaring variables and using operators:
int myNumber = 4;
int mySecondNumber = 5;
int mySum = myNumber+mySecondNumber;
int myThirdNumber = 6;
mySum = mySum + myThirdNumber;
int myFourthNumber = 7;
mySum += myFourthNumber;
// By the end of this code, the variable `mySum`
// would contain `4+5+6+7`, or rather, `22`.
{% endhighlight %}



&nbsp;&nbsp;&nbsp;
## Characters

Characters are a variable type that is made of a single byte, which means they can encode for a fairly limited number of characters. We can identify which characters we can store using an ASCII table shown below. 

Characters can be referred to by placing the chosen character in single quotation marks, like this:

{% highlight c++ %}
char myChar = 'a';
{% endhighlight %}

Characters can also can be accessed using numerical values. Since every sequence of binary numbers that encodes a character could also instead be interpreted as an integer, we can use those numbers to identify which character we are talking about. The integer values that correspond with each letter are shown in the ASCII table.

There are a few traits that you may find helpful as you move forward: firstly, observe that all lower case letters are listed in consecutive alphabetical order, and secondly that all upper case letters are similarly listed in consecutive alphabetical order. This means that the space between a lowercase '`a`' and a capital '`A`' is the same as the space between a lowercase '`b`' and a capital '`B`' and so on. This is useful for converting characters from lowercase to uppercase. 

{% include img.html src='ascii_table.png' alt='ascii table 0 Null to 127 Del, must lookup an accessible table' caption='' %}





&nbsp;&nbsp;&nbsp;
### Strings

In C++, a `string` is a data type that represents sequences of characters instead of a numeric value (such as `int` or `float`). A string literal can be defined using double-quotes. So `"Hello, world!"`, `"3.1415"`, and `"int i"` are all strings. We can access the character at a particular location within a string by using square brackets, which enclose an index which you can think of as the address of the character within the string. Importantly, strings in C++ are indexed starting from zero. This means that the first character in a string is located at index 0, the second character has index 1, and so on. For example:

{% highlight c++ %}
string s = "Hello, world!";
cout << s[0] << endl;  //prints the character 'H' to the screen
cout << s[1] << endl;  //prints the character 'e' to the screen
cout << s[4] << endl;  //prints the character 'o' to the screen
cout << s[9] << endl;  //prints the character 'r' to the screen
cout << s[12] << endl; //prints the character '!' to the screen
{% endhighlight %}


Note that when a character in a string is accessed with square brackets, the character has type char. For example:

{% highlight c++ %}
string str = "Example"; //this is a string
char c = str[1]; //this is a char
{% endhighlight %}

There are many useful standard functions available in C++ to manipulate strings. One of the simplest is `length()`. We can use this function to determine the number of characters in a string. 

{% highlight c++ %}
string s = "Hello, world!";
int s_length = s.length();
cout << s_length << endl; //This line will print 13 to the screen    
{% endhighlight %}

Notice how the length function is called.

The correct way:

{% highlight c++ %}
s.length()
{% endhighlight %}

Common incorrect ways:

{% highlight c++ %}
length(s)  // NO: if only it were so simple...
s.length   // NO: don't forget the ()
{% endhighlight %}

Another useful function available for strings is `substr()`. This function allows us to access a subset, or a small portion, of a longer string. The substring function takes two arguments:

1. The starting index of the substring you would like to capture
1. The length of the substring you would like to capture (optional)

Note that the second argument is optional. If you don't pass a second argument to subtring, then the function will print the entirety of the string, beginning with the character at the position specified in the first argument. Note that `substr()` always returns a variable of type `string`, regardless of the length of the substring.

For example, consider the code below:


{% highlight c++ %}   
// Substring example code:
string str = "Coding is fun!";
cout << str.substr(0, 6) << endl;
cout << str.substr(6) << endl;
cout << str.substr(1, 1) << endl; //prints a string of length one
{% endhighlight %}

This will ouput the following:

{% highlight c++ %}
Coding
 is fun!
o
{% endhighlight %}

**Note: The second line of output begins with a space.**

Both `length()` and `substr()` are special kinds of functions associated with objects, usually called methods, which we will discuss later in the course.


&nbsp;&nbsp;&nbsp;
### Terminal Input and Output

It is important to be able to take input from the user or to print output to the terminal as your program runs. You can do this using `cin` and `cout` for input and output, respectively. 

The Hello World program you have seen provides an example of using `cout` to display output.

{% highlight c++ %}
// EXAMPLE: Hello World for C++:
#include <iostream>

using namespace std;

int main() {
    cout << "Hello, world!" << endl;
    
    return 0;
}
{% endhighlight %}


You can similarly ask the user for a particular value and store that value in a variable using `cin`:


{% highlight c++ %}
// EXAMPLE: An example of collecting user input to sum two integer variables and then printing their sum
#include <iostream>

using namespace std;

int main() {
    int firstNum;
    int secondNum;
    cout << "Please provide one number:" << endl;
    cin >> firstNum;
    cout << "Please provide a second number:" << endl;
    cin >> secondNum;
    cout << "The sum of these two numbers is " << firstNum + secondNum << endl;

    return 0;
}
{% endhighlight %}




&nbsp;&nbsp;&nbsp;
### Pseudocode and Algorithms

Pseudocode is used to develop algorithms. An algorithm is a procedure for solving a problem.

An algorithm describes actions to be executed and the order in which those actions are to be executed. In other words, an algorithm is merely the sequence of steps taken to solve a problem; like a recipe. An algorithm is not computer code. Algorithms are just the instructions which provide a clear path for you to write the computer code.

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #000000; background-color: #eebb00; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>An algorithm for adding two numbers together:</b>
  <ol>
    <li>Step 1: Start</li>
    <li>Step 2: Declare variables <code>num1</code>, <code>num2</code>, and <code>sum</code>.</li>
    <li>Step 3: Read values <code>num1</code> and <code>num2</code>.</li>
    <li>Step 4: Add <code>num1</code> and <code>num2</code> and assign the result to <code>sum</code>.</li>
    <li>Step 5: Display <code>sum</code></li>
    <li>Step 6: Stop</li>
  </ol>
</div>


The main difference between an algorithm and pseudocode is that an algorithm is a step by step procedure to solve a given problem while pseudocode is a method of writing an algorithm. In other words, an algorithm is how to solve a problem while pseudocode is how to implement that solution. 

| Algorithm | Pseudocode |
| --- | --- |
| An unambiguous specification of how to solve a problem. | An informal high-level description of the operating principle of a computer program or other algorithm. |
| Helps to simplify and understand the problem. | A method of developing an algorithm. |


Pseudocode is informal language that helps programmers develop algorithms (or recipes). Although there are no hard and fast rules for pseudocode, there are some suggestions to help make pseudocode more understandable and easy to read.

For instance, consider indenting all statements showing a "dependency”, like statements that use: While, do, for, if.

Several keywords are often used to indicate common input, output, and processing operations.

| Term | A Few Equivalent Terms |
| --- | --- |
| Input: |  READ, OBTAIN, GET |
| Output: |  PRINT, DISPLAY, SHOW |
| Compute: |  COMPUTE, CALCULATE, DETERMINE |
| Initialize: |  SET, INITIALIZE |
| Add one: | INCREMENT, BUMP |


For looping and selection, the keywords that you might consider writing include:
1. Do While...
1. Do Until...
1. Case...
1. If… then...
1. Call ... with (parameters)
1. Call
1. Return ....
1. Return
1. When

Try to indicate the end of loops and iteration by using scope terminators.
For instance use `if… (statements) ... endif`.

Other words you may find useful while writing pseudocode include: Generate, Compute, Process, set, reset, increment, compute, calculate, add, sum, multiply, subtract, divide, print, display, input, output, edit, test, etc.

Be sure to indent if the indentation fosters understanding. Being clear is the purpose of pseudocode, and a very desirable goal to strive for.

Here are some examples of pseudocode:

{% highlight c++ %} 
// Will a grade pass?
/**
 * If students course grade is lower than  60
 *    Then Print, "Failed"
 * else
 *     If students exam grade is lower than  67
 *         Then Print, "Failed"
 *     else
 *         Print, "Passed"
 *     endif
 * endif
 */
{% endhighlight %}    



{% highlight c++ %} 
// How do you find the area of a rectangle?
    // Read the length of the rectangle
    // Read the width of the rectangle
    // Compute the area of the rectangle as length times width.
{% endhighlight %}    

You should write pseudocode whenever you are addressing problems in computer science. This allows you space to determine how to solve a problem without worrying about syntax and formatting, instead of having to figure out everything all at once. 




