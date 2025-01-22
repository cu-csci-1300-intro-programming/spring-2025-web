---
layout: post
title:  "Week 4: Functions"
date:   2025-01-22 09:00:00 -0700
categories: jekyll update
---

## Learning Goals

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Understand switch statements</li>
    <li>Understand basic functions:
        <ol>
            <li>Return types</li>
            <li>Parameter lists</li>
            <li>Function calls</li>
        </ol>
    </li>
    <li>Be able to identify the scope of a variable</li>
   </ol>
</div>

**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;&nbsp;
## Background
SPWI: readings

&nbsp;&nbsp;&nbsp;
### Switch Statements
Switch statements are an easy way to make decisions in a program. We can execute different sections of our code based on the value of a character or integer variable. 

1. If we are building a switch statement around an `int` variable, all of the cases must be defined using numbers. 
1. If we are building a switch statement around a `char` variable, all of the cases must be defined using characters. This means they must also use single quotes. 


{% include img.html src='switchdiagram.png' alt='flow diagram start line directional to diamond labeled expression one directional line out mutex to N locations each box labeled code block some number each with directional lines out which join to direct to a single end state' caption='' %}

With the switch statement, the variable name is used once in the opening line. The `case` keyword is used to provide the possible values of the variable, which is followed by a colon and a set of statements to run if the variable is equal to a corresponding value.

An example of a simple switch statement:

{% highlight c++ %}
// Switch statement syntax:
switch (n){
     case 1:
          // code to be executed if n == 1;
          break;
     case 2:
          // code to be executed if n == 2;
          break;
     default:
          // code to be executed if n doesn’t match any cases
}
{% endhighlight %}

Important notes to keep in mind when using switch statements :


1. The expression provided in the switch should result in a constant value otherwise it would not be valid.
    1. `switch(4)` allowed, allowed for any `int` value (any `int` expression)
    1. `switch(num)` allowed, were `num` is an `int` variable defined earlier (any `int` expression)
    1. `switch(a+b)` allowed, where `a` and `b` are `int` variables, which are defined earlier (any `int` expression)
    1. `switch('c')` allowed (takes the [ASCII Value](https://www.asciitable.com/) of the character `c`, here `99`)
1. The `break` statement is used inside the switch to terminate a statement sequence. When a `break` statement is reached, the switch terminates, and the flow of control jumps to the next line following the switch statement.
1. The `break` statement is optional. If omitted, execution will continue on into the next case. The flow of control will fall through to subsequent cases until a break is reached.
1. The default statement is optional. Even if the switch case statement does not have a default statement, it would run without any problem.


Switch statements are a simple way to make decisions based exclusively on the equivalence of some characters or numbers. They are a simple form of **conditional statement**.








&nbsp;&nbsp;&nbsp;
### Functions
"**Functions**" in the context of math may be familiar, especially when formatted like this:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
    f(x) = x<sup>2</sup> + 5
</div>


Here we have labeled our function `f`, and it is a function of the variable `x`. You might have seen some where the functions are functions on multiple variables:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
    g(x,y) = x<sup>2</sup> + y<sup>3</sup>
</div>

Here we have labeled our function `g`, and it is a function of two variables `x` and `y` (reading from left to right).

Functions in computer science are similar, but we can abstract them further so they apply to more than just numbers. 

A function is a named block of code which is used to perform a particular task. The power of functions lies in the capability to perform that task anywhere in the program without requiring the programmer to repeat that code many times. This also allows us to group portions of our code around concepts, making programs more organized. You can think of a function as a mini-program.

There are two types of functions:

1. Library functions
1. User-defined functions


Library functions refer to pre-existing functions that you can use but did not write yourself. In order to use a library function, you must include the library that contains the function. For example, the C++ math library provides a `sqrt()` function to calculate the square root of a number. To use the `sqrt()` function, you must include the cmath library at the top of your program, e.g.`#include<cmath>`. Libraries other than the built-in C++ libraries can be found online.

C++ allows programmers to define their own functions. These are called user-defined functions. Every valid C++ program has at least one function, the `main()` function.

We pass values to functions via parameters. In general, the parameters should be all the information needed for the function to do its work. When that work is complete, we would like to use the result in other code. The function can return one value of the specified return type. A function may also return nothing, in which case its return type is void.

Here is the syntax for a function definition:

{% highlight c++ %}
returnType functionName(parameterList)
{
    //function body
}
{% endhighlight %}


1. The `returnType` is the data type that the function returns
1.  <span style="color:darkRed"><b>`functionName`</b></span> is the actual name of the function
1. `parameterList` refers to the type, order, and number of the parameters of a function. A parameter is like a placeholder. When a function is invoked, you pass a value to the parameter. This value is referred to as actual parameter or argument. Note: this can be a list of multiple items separated by commas. 
1. `//function body` contains a collection of statements that define what the function does. The statements inside the function body are executed when a function is called.


This may not immediately look like the functions you have seen in math, but they are actually quite close. Here is an example of the functions above written in C++:


{% highlight c++ %}
// The function `f(x) = x^2 + 5` written in C++:
double f(double x){
    return ( x*x + 5 );
}
{% endhighlight %}


{% highlight c++ %}
// The function `g(x,y) = x^2+y^3` written in C++:
double g(double x, double y){
    return ( x*x + y*y*y );
} 
{% endhighlight %}

I used `double` for the parameters and the return type because these functions in math would probably use decimals (real number), but you could also use integers if you only wanted to use whole numbers. We can also use functions inside of other functions. Instead of just multiplying variables by themselves to do the exponents, we could use the `pow` function from `cmath`. We have seen the `cmath` library before but likely didn't fully understand what it did:


{% highlight c++ %}
// The function `f(x) = x^2 + 5` written using cmath:
#include<cmath>

double f(double x){
    return pow(x, 2) +5;
}
{% endhighlight %}


{% highlight c++ %}
//The function `g(x,y) = x^2+y^3` written using cmath:
#include<cmath>

double g(double x, double y){
    return pow(x, 2) + pow(y, 3);
} 
{% endhighlight %}

If you wanted to then use these functions to perform some calculations, you could use any value of `x` and `y`. You could use constant values, or you could use variables. Here are examples of ways you could use the function:


{% highlight c++ %}
// Examples of calling the function `g(x,y)`:
#include<cmath>
#include<iostream>

using namespace std;

double g(double x, double y){
    return pow(x, 2) + pow(y, 3);
} 

int main(){
    double firstValue = g(4.0, 5.0);
    double secondValue = g(2, 3); 
    double myX, myY;

    cout << "What value would you like for X?" << endl;
    cin >> myX;
    cout << "What value would you like for Y?" << endl;
    cin >> myY;
    cout << "The result would be " << g(myX, myY) << endl;

    return 0;
}

{% endhighlight %}

A function has its own **scope**. That means that the parameters of the function, as well as local variables declared within the function body, are not accessible outside the function. This is useful because it allows us to solve a small problem in a self-contained way. Parameter values and local variables disappear from memory when the function completes its execution. We can illustrate the order in which code executes with this example:


{% highlight c++ %}
// An example with a simple function:
#include <iostream>
using namespace std;

//funtion to add two numbers
int sum( int num_one, int num_two)
{
    int result = num_one + num_two;
    return result;
}

//main function
int main()
{
    //declare parameter value
    int parameter_var = 1;
    
    //call the function
    int sum_result = sum(parameter_var, 99);
    
    cout << "The sum is " << sum_result << endl;
    
    return 0;
}    
{% endhighlight %}

The code will begin executing in the main function -- in this case, the first step is declaring a variable in line 15. When the program execution reaches line 18, the main function will pause, and the first line in the body of the `sum()` function will begin running. After the line `return result;` is reached, `sum()` will stop running, and the main program will resume execution where it left off. In this case, when `main()` resumes execution, the return value of `sum()` will be stored in `int sum_result`, and then the last two lines of the main function will run.

Let us clarify this point with a few changes to the above example


{% highlight c++ %}
// NOTE any comment
#include <iostream>
using namespace std;

int sum( int num_one, int num_two)
{
    int result = num_one + num_two;
    return result;
}

//main function
int main()
{
    // NOTE: a result variable set to 42 in main
    int result = 42;

    int parameter_var = 1;
    
    //call the function
    int sum_result = sum(parameter_var, 99);

    // NOTE: an update to result
    result = 75;
    
    cout << "The sum is " << sum_result << endl;
    
    return 0;
}    
{% endhighlight %}

In the above example sum-result is still `100`. There are now two variables named `result` one is scoped only to the `sum()` function and happens to get the value `100` at some point in time. That `result` variable has no awareness of the other variable named `result` that is scoped to the `main()` function (starts with value `42` and is later set to `75`).

Functions can do more than just perform calculations; they can also perform operations on other variables, or they can be used to prevent yourself from copy/pasting the same code multiple times in your program. They do not even always need parameters. For example, if you wanted to write out a selection menu, you could write a function to print the menu so you do not have to type it out every time. In these cases, the parenthesis can be empty, like they are for our main functions. 

As a general note: the function names `f` and `g` are not very good function names. You should generally pick better (clearer) names, and you should choose a naming style to be consistent. The naming style you choose should be different from how you name variables, so it is easier to read your code.We recommend using camel case to name your functions, like so:

Examples of function names we might use: `circleArea(), sumList(), findCapitalLetters()`






&nbsp;&nbsp;&nbsp;
### Testing Code
You must naturally test your code to make sure that it works correctly, and that it works correctly **all** the time. This may seem like a very difficult task, but there are several steps you can take to make sure you start correctly.


1. Come up with a handful of test cases to use on your program. 
1. Consider the ways a user could use your program incorrectly. Use this to develop additional test cases.
1. Consider extreme values, or "boundary conditions". Use these boundary conditions to develop yet more test cases.
1. Test each part of your program independently. This is called "*Unit Testing*". Do you have individual functions? Test each of them. Do you have major steps in your main function? Test each of them.


Boundary conditions are significant for many complex problems, and should test the extreme limits of what your problem may be applied to. Example: Are you supposed to examine a string? What happens if that string is empty? What happens if that string is thousands of digits long? 

You should develop test cases for each boundary condition you can come up with. If there are several components to your program, you may need to identify boundary conditions for each of these components. Testing these boundary conditions of these pieces individually -- whether they are functions or just blocks of code in your main function -- is often easier than testing every independent combination of them. 

Consider a program where you have 4 functions, and each function has 3 boundary conditions. To test each boundary condition for each of the 4 functions, you would need 12 tests. If however you only tested the program as a whole, you might need to check each combination of boundary conditions, which would end up becoming **3<sup>4</sup> = 81** different tests. This is part of why **unit testing** is valuable. 

As you develop extra functions, you should start by using your `main` function to test these functions. There will be 3 different types of test cases you should be expected to write depending on the return type of the function. Listed below is how we expect you to test different types of functions. The process will be different for if you are testing a `void function`, non-void functions that return an `int` or `bool`, and non-void functions that return a `double`.

&nbsp;&nbsp;
#### Testing Void Functions

For void functions that have printed output (i.e. functions that use cout to print to the terminal), call the testing function in the main function. Your tests should include the expected output in comments. For these functions you will want to make sure that all expected outputs are successfully printed.

See the example code below:

{% highlight c++ %}
// This is testing a function that prints whether a grade is passing or not. 
void checkGrade(char grade){
    switch(grade){
        case 'a':
        case 'b':
        case 'c':
            cout << "You passed!" << endl;
            break;
        case 'd':
            cout << "You did not pass, but you were close." << endl;
            break;
        case 'f':
            cout << "You failed." << endl;
            break;
        default:
            cout << "That is not a valid grade." << endl;
    }
}        

int main(){
    checkGrade('b'); //Should output "You passed!"
    checkGrade('d'); //Should output "You did not pass, but you were close."
    checkGrade('f'); //Should output "You failed."
    checkGrade('m'); //Should output "That is not a valid grade."
}
{% endhighlight %}



&nbsp;&nbsp;
#### Testing Integer/Boolean Functions

For non-void functions that return a `bool` or `int`, use an `assert` statement from the `cassert` header (`#include <cassert>`) with a conditional expression.

Assert tests contain a conditional expression which will be true unless there is a bug in the program. If the conditional expression evaluates to false, then your program will terminate and show an error message.

For immediate purposes, functions that return a `bool` or `int` can be compared to a specific value using the equality operator `==`.

Your test will look something like this:

`assert(<function call> == <value to compare to>);`


1. `<function call>` is where you will call the function you want to test with its function parameters.
1. `<value to compare to>` is the value you expect the function to return.
1. `==` is the equality operator, and it compares the equality of both sides of itself.


See the sample code below:

{% highlight c++ %}
The below code shows examples of how to test integer functions with a simple addition function:
#include <iostream>
#include <cassert>
using namespace std;

int addInts(int num1, int num2)
{
    // add num1 and num2 before returning
    return num1 + num2;
}

int main()
{
    // test 1 for addInts
    assert(addInts(5, 6) == 11);
    // test 2 for addInts
    assert(addInts(10, 10) == 20);
}
{% endhighlight %}




&nbsp;&nbsp;
#### Testing Double Functions
For non-void functions that return a double, use an `assert` statement from the `cassert` header (`#include <cassert>`) with a conditional expression and include the following function in your program:

{% highlight c++ %}
// This is a required function to successfully test Double functions in C++:
/**
 * doublesEqual will test if two doubles are equal to each 
 * other within two decimal places.
 */
bool doublesEqual(double a, double b, const double epsilon = 1e-2)
{
    double c = a - b;
    return c < epsilon && -c < epsilon;
}
{% endhighlight %}

Because the `double` type holds so much precision, it will be hard to compare the equality of a function that returns a `double` with another `double` value. To overcome this challenge, we can compare `double` values within a certain range of precision or decimal places. The function above compares the equality of two values `a` and `b` up to two decimal places. This function returns `true` if the values `a` and `b` are equal with each other up to two decimal places.

You will be expected to use this function in conjunction with assert statements to test functions that return the type double.

Your test will look something like this:

`assert(doublesEqual(<function call>, <value to compare to>));`

1. `<function call>` is where you will call the function you want to test with its function parameters
1. `<value to compare to>` is the double value you expect the function to return.


See the sample code below:


{% highlight c++ %}
// This is code to test a function that finds the reciprocal of a value (i.e., divides 1 by that number).
#include <iostream>
#include <cassert>
using namespace std;

/**
 * doublesEqual will test if two doubles are equal to each other within 
 * two decimal places.
 */
bool doublesEqual(double a, double b, const double epsilon = 1e-2) {
    double c = a - b;
    return c < epsilon && -c < epsilon;
}

/**
 * reciprocal returns the value of 1 divided by the number 
 * passed into the function.
 */
double reciprocal(int num) {
    return 1.0 / num;
}

int main() {
    // test 1 for reciprocal
    assert(doublesEqual(reciprocal(6), 0.16));
    // test 2 for reciprocal
    assert(doublesEqual(reciprocal(12), 0.083));
}
{% endhighlight %}



&nbsp;&nbsp;
#### General Testing Tips
You will certainly come to a time in your coding career when your code does not work, and you just cannot figure out *why*.

In these times, there are a few possible options. First, your algorithm may be incorrect. If that is the case no amount of code testing will help you, and you will need to go back and think through how to solve the problem. If your algorithm is correct but your code is not, here are three tips:

1. If your code does not compile, start commenting out sections of your code. Keep going until it compiles, even if you have to go all the way back to an empty main function. Then, you can uncomment sections of your code until it fails to compile again. This will help you pinpoint *where* the issue is in your code, and once you know where it is you will be able to see *what* it is. 
1. If your code compiles but has unexpected runtime errors, add output statements periodically throughout your code. When your program fails, you will know where your code stopped running based on which output statements failed to print.
1. If your code compiles and runs completely but the output is incorrect, go back through your code and print out the significant variables at each step in your code. You can then compare this to the test cases you worked out by hand and see where the code output differs from your algorithm.























&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz
TODO: this will be made into a canvas quiz. this webpage must be updated acccordingly. Unsure what that looks like at this time.

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
ADVAIT: will update. (most of it is prepped in `<project>/docs/_ignoreForNow/week4fall.tex`)


























&nbsp;&nbsp;&nbsp;&nbsp;
## Homework

&nbsp;&nbsp;&nbsp;
### Homework Problem 1: Car switch

Write a program that accepts a single character representing an automobile manufacturing company as input from the user. Then, the program should print out the text for the appropriate company


1. Your program prompts the user with “Enter the first letter of the company: ”, which asks for a character input. 
1. The input must be case sensitive, e.g., if the user enters ‘b’ instead of ‘B’, the output should be invalid and not “BMW”.
    1. Your program prints output according to the following:
        1. If the input is ‘B’, print “BMW”
        1. If the input is ‘V’, print “Volkswagen”
        1. If the input is ‘H’, print “Honda”
        1. If the input is ‘T’, print “Tesla”
        1. Any input value that is not ‘B’, ‘V’, ‘H’, or ‘T’ should print “Invalid”

**Note:** Code should NOT contain any  if-else statements and should only utilize Switch Statements

Below are a few examples of valid runs of the program. The examples include more formatting information:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the first letter of the company:</p>

<p><span style="color:red">B</span></p>
 
<p>Automobile manufacturer chosen: BMW</p>
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the first letter of the company:</p>

<p><span style="color:red">V</span></p>
 
<p>Automobile manufacturer chosen: Volkswagen</p>


</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the first letter of the company:</p>

<p><span style="color:red">A</span></p>
 
<p>Automobile manufacturer chosen: Invalid</p>

</div>
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the first letter of the company:</p>

<p><span style="color:red">T</span></p>
 
<p>Automobile manufacturer chosen: Tesla</p>

</div>








&nbsp;&nbsp;&nbsp;
### Instrument Price

You want to learn to play an instrument, but you need to know how much it will cost to buy it. The music store has the following table on their website:

| **Category** | **Instrument** | **Price** |
| --- | --- | --- |
| Brass | Trumpet | $570 |
| Brass | Trombone | $500 |
| Woodwind | Flute | $425 |
| Woodwind | Saxophone | $225 |
| Percussion | Snare | $275 |
| Percussion | Cymbals | $350 |


Write a menu-driven program that asks the user to input an instrument category and then an instrument. The program should give the user the price.

The user should input an integer in the range of the choices you give them (for example, a user cannot input 3 if you only have 2 choices). If the user inputs the correct range, the program should be prompted for the next set of choices. Once they make the final selection, the total should be printed to them as an integer with proper formatting, as shown in the sample run. 

**Note:** Code should NOT contain any  if-else statements and should only utilize Switch Statements

Below are a few examples of valid runs of the program. The examples include more formatting information:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select a category: (1)Brass (2)Woodwind (3)Percussion</p>

<p><span style="color:red">1</span></p>
 
<p>Select an instrument: (1)Trumpet (2)Trombone</p>

<p><span style="color:red">2</span></p>
 
<p>Your instrument will be $500</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select a category: (1)Brass (2)Woodwind (3)Percussion</p>

<p><span style="color:red">3</span></p>
 
<p>Select an instrument: (1)Snare Drum (2)Cymbals</p>

<p><span style="color:red">2</span></p>
 
<p>Your instrument will be $350</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select a category: (1)Brass (2)Woodwind (3)Percussion</p>

<p><span style="color:red">5</span></p>
 
<p>Please enter a valid input.</p>

</div>
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select a category: (1)Brass (2)Woodwind (3)Percussion</p>

<p><span style="color:red">2</span></p>
 
 
<p>Select an instrument: (1)Flute (2)Saxophone</p>

<p><span style="color:red">1</span></p>
 
<p>Your instrument will be $425.</p>


</div>


&nbsp;&nbsp;&nbsp;
### Movie Night

You are preparing a movie night with your friends. Create a C++ program that helps you determine which movie to select. 

Based on the given table, you, as the programmer, should give step-by-step choices to the user to proceed further and make a movie selection. Once the user has selected the movie, the program should display a message: "You have selected the movie: `<movie title>`" where "`<movie title>`" is the movie the user has selected. 

Additionally, ensure that the user's input is present in the range of choices. If the user inputs an invalid option, print "Please enter a valid input" and terminate the program. 

[//]: # (https://www.tablesgenerator.com/html_tables#)
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 496px"><colgroup>
<col style="width: 118px">
<col style="width: 156px">
<col style="width: 222px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh"><span style="font-weight:bold">Genre</span></th>
    <th class="tg-c3ow"><span style="font-weight:bold">Directors</span></th>
    <th class="tg-0pky"><span style="font-weight:bold">Movies</span></th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-baqh" rowspan="6">(1) Animation<br></td>
    <td class="tg-c3ow" rowspan="2">(1) Pete Docter</td>
    <td class="tg-0pky">(1) Monsters, Inc.<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">(2) Inside Out</td>
  </tr>
  <tr>
    <td class="tg-c3ow" rowspan="2">(2) Brad Bird <br><br></td>
    <td class="tg-0pky">(1) The Incredibles</td>
  </tr>
  <tr>
    <td class="tg-0pky">(2) Ratatouille</td>
  </tr>
  <tr>
    <td class="tg-baqh" rowspan="2">(3) Andrew Stanton <br></td>
    <td class="tg-0lax">(1) Finding Nemo<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">(2) WALL-E</td>
  </tr>
  <tr>
    <td class="tg-baqh" rowspan="6">(2) Adventure<br></td>
    <td class="tg-baqh" rowspan="2">(1) Steven Spielberg</td>
    <td class="tg-0lax">(1) E.T. the Extra-Terrestrial<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">(2) The BFG</td>
  </tr>
  <tr>
    <td class="tg-baqh" rowspan="2">(2) Jon Favreau <br></td>
    <td class="tg-0lax">(1) The Jungle Book (2016)<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">(2) Elf</td>
  </tr>
  <tr>
    <td class="tg-baqh" rowspan="2">(3) Robert Zemeckis</td>
    <td class="tg-0lax">(1) Back to the Future<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">(2) Who Framed Roger Rabbit</td>
  </tr>
</tbody></table>


Below are a few examples of valid runs of the program. The examples include more formatting information:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select the genre: (1) Animation (2) Adventure</p>

<p><span style="color:red">1</span></p>

<p>Select the director: (1) Pete Docter (2) Brad Bird (3) Andrew Stanton</p>

<p><span style="color:red">1</span></p>

<p>Select the movie: (1) Monsters, Inc. (2) Inside Out</p>

<p><span style="color:red">1</span></p>

<p>You have reserved the movie: Monsters, Inc.</p>
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select the genre: (1) Animation (2) Adventure</p>

<p><span style="color:red">2</span></p>

<p>Select the director: (1) Steven Spielberg (2) Jon Favreau (3) Robert Zemeckis</p>

<p><span style="color:red">1</span></p>

<p>Select the movie: (1) E.T. the Extra-Terrestrial (2) The BFG</p>

<p><span style="color:red">1</span></p>

<p>You have reserved the movie: E.T. the Extra-Terrestrial</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select the genre: (1) Animation (2) Adventure</p>

<span style="color:red">4</span>

<p>Please enter a valid input</p>
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Select the genre: (1) Animation (2) Adventure</p>

<p><span style="color:red">2</span></p>

<p>Select the director: (1) Steven Spielberg (2) Jon Favreau (3) Robert Zemeckis</p>

<p><span style="color:red">2</span></p>

<p>Select the movie: (1) The Jungle Book (2016) (2) Elf</p>

<p><span style="color:red">2</span></p>

<p>You have reserved the movie: Elf</p>
</div>








&nbsp;&nbsp;&nbsp;
### Area of a room

You work in a construction company and have been tasked to develop a reusable C++ function that will allow engineers to calculate the area of the room they wish to renovate. For simplicity, we'll imagine every room as a rectangle.

The engineers will be asked to input the room's length and width in feet. Then, the dimensions will be passed into the function <tt>calculateRoomArea()</tt>, which will compute and return the area of the room. 

Complete and submit the <tt>calculateRoomArea()</tt> function and <tt>main()</tt> to coderunner. You do not need to include the header. 

{% highlight c++ %}
double calculateRoomArea(double length, double width){

}
{% endhighlight %}

The following table includes the function details for calculateRoomArea

| component | description |
| --- | --- |
| **Function:** | <tt>calculateRoomArea(double, double)</tt> <br /> <tt>double calculateRoomArea(double length, double width)</tt> |
| **Purpose:** | To calculate the area of the room. |
| **Parameters:** | **double** <span style="color:red"><tt>length</tt></span> - the length of the room. <br /> **double** <span style="color:blue"><tt>width</tt></span> - the width of the room. |
| **Return Value:** | If successful, it returns the area of the room. |
| **Error Handling:** | If <span style="color:red"><tt>length</tt></span> or <span style="color:blue"><tt>width</tt></span> is non-positive, `-1` is returned. Then, in <tt>main()</tt>, the program should display "Length or width is invalid. Area cannot be calculated." |


Below are a few examples of valid runs of the program. The examples include more formatting information:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the length of the room in ft:</p>

<p><span style="color:red">4.5</span></p>
 
<p>Enter the width of the room in ft:</p>

<p><span style="color:red">2</span></p>
 
<p>The area is: 9 sq ft.</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the length of the room in ft:</p>

<p><span style="color:red">30</span></p>
 
<p>Enter the width of the room in ft:</p>

<p><span style="color:red">40</span></p>
 
<p>The area is: 1200 sq ft.</p>


</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the length of the room in ft:</p>

<p><span style="color:red">2</span></p>
 
<p>Enter the width of the room in ft:</p>

<p><span style="color:red">0</span></p>
 
<p>Length or width is invalid. Area cannot be calculated.</p>
</div>
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter the length of the room in ft:</p>

<p><span style="color:red">-10</span></p>
 
<p>Enter the width of the room in ft:</p>

<p><span style="color:red">2</span></p>
 
<p>Length or width is invalid. Area cannot be calculated.</p>

</div>




&nbsp;&nbsp;&nbsp;
### Estimate Sowing Time
Write a C++ program with a function to estimate the time it takes to sow seeds on farmland. The farming company provides 4 different kinds of sowing machines. Each machine can sow seeds at a different speed per square foot, as shown below.

| **Sowing Machine** | **Time taken per square foot** |
| --- | --- |
| W   | 8 sq ft per 12 minutes |
| X   | 3 sq ft per 10 minutes  |
| Y   | 2 sq ft per 7 minutes |
| Z   | 7 sq ft per 8 minutes |



Your program should ask the user the area of the farm and the type of sowing machine the user intends to use in `main()`. Once the information is obtained, call the `calculateSowingTime()` function and pass in the appropriate values. 

For submission, please paste in the whole program into coderunner. Please make sure `calculateSowingTime()` function exists and takes in the two parameters in the same order. Below is the function specification for `calculateSowingTime()`:

| component | description |
| --- | --- |
| **Function:** |  <tt>calculateSowingTime(double, char)</tt> <br /> <tt>double calculateSowingTime(double area, char machine\_type)</tt> |
| **Purpose:** | To calculate the time taken to plant seeds all over the farmland. |
| **Parameters:** | **double** <span style="color:red"><tt>area</tt></span>  - the area of the farmland. <br /> **char** <span style="color:blue"><tt>machine_type</tt></span> - the type of machine selected. |
| **Return Value:** | If successful, it returns the time taken to plant seeds using a particular machine across the entire farmland. |
| **Error Handling:** | - If <span style="color:red"><tt>area</tt></span> is non-positive, 0 is returned. <br /> - If <span style="color:blue"><tt>machine_type</tt></span> is invalid, 0 is returned. |

Below are a few examples of valid runs of the program. The examples include more formatting information:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter area of the farmland in sq ft:</p>

<p><span style="color:red">1200</span></p>
 
<p>Enter the type of sowing machine to be used:</p>

<p><span style="color:red">W</span></p>
 
<p>The time taken is: 1800 minutes.</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter area of the farmland in sq ft:</p>

<p><span style="color:red">3244</span></p>
 
<p>Enter the type of sowing machine to be used:</p>

<p><span style="color:red">X</span></p>
 
<p>The time taken is: 10813.33 minutes.</p>

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter area of the farmland in sq ft:</p>

<p><span style="color:red">5000</span></p>
 
<p>Enter the type of sowing machine to be used:</p>

<p><span style="color:red">A</span></p>
 
<p>Area or machine type is invalid. Time cannot be calculated.</p>
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter area of the farmland in sq ft:</p>

<p><span style="color:red">1000.45</span></p>
 
<p>Enter the type of sowing machine to be used:</p>

<p><span style="color:red">Z</span></p>
 
<p>The time taken is: 1143.37 minutes.</p>

</div>




