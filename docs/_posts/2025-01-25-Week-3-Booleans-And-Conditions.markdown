---
layout: post
title:  "Week 3: Booleans and Conditions"
date:   2025-01-11 12:58:53 -0700
categories: jekyll update
---
## Learning Goals

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li> Understand the Boolean data type and boolean operators</li>
    <li>Understand relational operators</li>
    <li>Be able to implement decisions using if statements</li>
  </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}

&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 3.2, 3.3
1. Wednesday: 3.4, 3.5, 3.6
1. Friday: 3.3, 3.4, 3.5, 3.6 (re-read the sections, they should make more sense now)

&nbsp;&nbsp;&nbsp;&nbsp;
## Background

&nbsp;&nbsp;&nbsp;
### Booleans
Booleans are a special data type that stores only `true` or `false`. This true or false value can be stored in a boolean variable, or it can be the result of evaluating different expressions.

&nbsp;&nbsp;
#### Relational Operators
A relational operator is a feature of a programming language that tests or defines some kind of relation between two entities. These include numerical equality (e.g., `5 == 5`) and inequalities (e.g., `4 >= 3`). Relational operators will evaluate to either True or False based on whether the relation between the two operands holds or not. When two variables or values are compared using a relational operator, the resulting expression is an example of a boolean condition that can be used to create branches in the execution of the program. Below is a table with each relational operator’s C++ symbol, definition, and an example of its execution.

| Operator | Meaning | Example | Counter Example |
| ---  | --- | --- | --- |
| `>`  | greater than | `5 > 4` is TRUE | `4 > 5` is FALSE |
| `<`  | less than | `4 < 5` is TRUE | `5 < 4` is FALSE |
| `>=` | greater than or equal | `4 >= 4` is TRUE | `4 >= 5` is FALSE |
| `<=` | less than or equal | `3 <= 4` is TRUE | `5 <= 4` is FALSE |
| `==` | equal to | `5 == 5` is TRUE | `4 == 5` is FALSE |
| `!=` | not equal to | `5 != 6` is TRUE | `4 != 4` is FALSE |

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #000000; background-color: #eebb00; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>NOTE:</b> `==` (double-equals) is used to ask about whether two things are equal to one another, while `=` (single-equals) is used to assign values. This can be very frustrating at first and cause unexpected bugs in our code.
</div>


&nbsp;&nbsp;
#### Logical Operators
Logical operators are used to compare the results of two or more conditional statements, allowing you to combine relational operators to create more complex comparisons. Similar to relational operators, logical operators will evaluate to True or False based on whether the given rule holds for the operands. Below are some examples of logical operators and their definitions.

| `Operator` | NAME | type | notes |
| --- | --- | --- | --- |
| `<leftOperand> && <rightOperand> ` | AND | binary | returns true if and only if both `<leftOperand>` and `<rightOperand>` are true |
| `<leftOperand> || <rightOperand>` | OR | binary | returns true if one or both operands are true |
| `! <onlyOperand>` | NOT | unary | returns true if the `<onlyOperand>` is false and false if the `<onlyOperand>` is true |


Every logical operator will have a corresponding truth table, which specifies the output that will be produced by that operator on any given set of valid inputs. Below are truth tables for each of the logical operators specified above.



 AND ( `&&` ): These operators return true if and only if both operands are True. This can be visualized as a venn diagram where the circles are overlapping.

| `<leftOperand>` | `<rightOperand>` | `<leftOperand> && <rightOperand>` |
| --- | --- | --- |
| true | true | true |
| true | false | false |
| false | true | false |
| false | false | false |

{% include img.html src='and.png' alt='circle labeled p and circle labled q in white box and overlapping. the overlap is shaded red' caption='' %}


OR ( `||` ): These operators return True if one or both of the operands are True. This can be visualized as the region of a venn diagram encapsulated by both circles.

| `<leftOperand>` | `<rightOperand>` | `<leftOperand> || <rightOperand>` |
| --- | --- | --- |
| true | true | true |
| true | false | true |
| false | true | true |
| false | false | false |

{% include img.html src='or.png' alt='circle labeled p and circle labled q in white box and overlapping. both circles and the overlap is shaded red' caption='' %}


NOT ( ! ): This operator returns the opposite of the operand. This can be visualized as the region of a venn diagram outside the circle. Unlike AND and OR, the NOT operator has only one operand.

| `<onlyOperand>` | `! <onlyOperand>` |
| --- | --- |
| true | false |
| false | true |

{% include img.html src='not.png' alt='a white circle labeled p in a red box. ' caption='' %}

You can create truth tables for more complicated expressions by combining elements of these tables. You should begin with columns of the basic variables representing each possible combination of those variables, and then add columns to represent their modified values. For example, if you wanted to create a truth table for `!p && q` you could make a column for `p` and a column for `q` representing all possible combinations of true/false between the two variables. You can then create a third column for `!p`, and then perform the `&&` operation between the `!p` and `q` columns instead of the `p` and `q` columns, like this below:

| `p` | `q` | `!p`  | `!p && q` |
| --- | --- | --- | --- |
| true | true | false | false |
| true | false | false | false |
| false | true | true | true |
| false | false | true | false |

You might also choose to represent this intermediate column with a variable as demonstrated in the table below:

| `p` | `q` | `r = !p`  | `r && q`  |
| --- | --- | --- | --- |
| true | true | false | false |
| true | false | false | false |
| false | true | true | true |
| false | false | true | false |


For simple expressions, you can often work through the truth table in your head. However, knowing how to make truth tables will be helpful when you need more complicated expressions. 

&nbsp;&nbsp;
#### Using Booleans
There are two main ways you can use booleans: you can either assign them to a boolean variable, or you can use them directly as a condition (such as in an if statement). If you would like to evaluate a boolean expression and store it in a variable, you can do it like this:

{% highlight c++ %}
bool myNewBoolean = (4 < 5); // this will evaluate to true
bool mySecondBoolean = (5 == 6); //this will evaluate to false
bool myFinalBoolean = (myNewBoolean && mySecondBoolean); //this will evaluate to false
{% endhighlight %}

You can string together increasingly complicated boolean equations either as a combination of boolean variables or as a combination of relational/logical expressions.

Booleans can also be represented using integers, and will print that way by default in C++. As an integer representation, `0` is `false` and `1` is `true`. 

You can build if statements using boolean variables or boolean expressions.

&nbsp;&nbsp;&nbsp;
### Conditionals
Conditional statements, also known as decision statements or branching statements, are used to make a decision based on condition. A condition is an expression that evaluates to a boolean value, either true or false. [Execution in C++](https://cal-linux.com/tutorials/conditionals.html) is a good online resource for learning about conditionals in C++.

There are a few types of conditional expressions such as `If` statements, `If/Else` statements, and `If/Else If/Else` statements each more complicated than the prior but also more dynamic way to make decisions in your code. Other tools for making decisions in your code include `Switch` statments (that we'll cover this week) and `Ternary` expressions (which we may never cover).

&nbsp;&nbsp;
#### IF Statements 

An `If` statement in C++ is composed of a condition and a body. The body is executed only if the condition is true. The condition appears inside a set of parentheses following the keyword “if” and the body appears within a set of curly brackets after the condition:

The general format for if statements is:

{% highlight c++ %}
// NOTE: if is all lowercase
if ( <CONDITION> ){
    <BODY>
}    
{% endhighlight %}

It is good practice to vertically align the closing curly bracket with the start of the if statement, and to indent the body. Examples below:

{% highlight c++ %}
// BEST FOR NOW
if ( <CONDITION> ){
    <BODY>
}    

// SOMETIMES USED
if ( <CONDITION> )
{
    <BODY>
}  


// PLEASE DON'T
if ( <CONDITION> ) {
<BODY>
}  

// THAT'S JUST RUDE.
if ( <CONDITION> ) { <BODY> }  
{% endhighlight %}

The condition is interpreted as a boolean value, either true or false. If-and-only-if the `<CONDITION>` holds `true` then the `<BODY>` of the `If` statement is executed


{% highlight c++ %}
// Here is an if statement that will check 
// if a number is negative 
// and change it to positive 
// (i.e., find the absolute value):

if (num < 0){
    // only occurs if num has a negative value
    cout << "Changing sign" << endl;
    num = -1 * num;
}
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #000000; background-color: #eebb00; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
Assignment operations (single equal sign) are interpreted as true as well. A common mistake is to use a single equals sign inside a condition when a double equals sign is intended.  Be careful, most expressions in C++ have a boolean interpretation. For instance, non-zero numeric values are true. example below
</div>
{% highlight c++ %}
// works as expected
if (num == 4){
    cout << "Found the number 4" << endl;
}
{% endhighlight %}

{% highlight c++ %}
// works in a weird way
// NOTE the use of a single `=`
if (num = 4){
    cout << "Found any number and replaced it with 4!" << endl;
}
{% endhighlight %}


&nbsp;&nbsp;
#### IF-ELSE Statements
 If statements may be paired with else statements in C++. If the condition associated with the if statement is false, the body associated with the else statement is executed. The else statement body is enclosed in a set of curly brackets:

 {% highlight c++ %}
 if ( <CONDITION> ){
    <BODY>
    // executed when CONDITION is true
}
else{
    <BODY>
    // executed when CONDITION is false
}
 {% endhighlight %}

 An if statement does not need an else statement, but there must be an if statement before every else statement.

{% highlight c++ %}
// Here is an if/else statement
// that will check if a number can be a divisor
// before performing division:

if (num == 0) //notice the double equals!{
    cout << "Can't divide by 0!" << endl;
}
else{
    num = 1000 / num; //integer arithmetic
}         
{% endhighlight %}

 &nbsp;&nbsp;&nbsp;
### ELSE-IF Statements
 
Finally, an if statement may also be associated with any number of else-if statements. These statements each have an associated condition and an associated body. The body is executed if the condition is true and the conditions for all preceding if- and else-if statements in the same group are false. An else statement may be included at the end of the group but is not required. The else statement will be executed if all the previous conditions are false.

{% highlight c++ %}
if ( <CONDITION> ){
    <BODY>
}
else if ( <CONDITION> ){
    <BODY>
}
else if ( <CONDITION> ){
    <BODY>
}
else{
    <BODY>
}
{% endhighlight %}

 This is **not** logically the same as having multiple sequential if statements. 

{% highlight c++ %}
// These two if statements:
if ( <CONDITION A>){
    // do X
}
if ( <CONDITION B>){
    // do Y
}    

// are NOT logically the same as this if/else-if statement:
if( <CONDITION A>){
    // do X
}
else if ( <CONDITION B>){
    // do Y
}
{% endhighlight %}

In the first code section, both if statements are evaluated. If both CONDITION A and CONDITION B are true, we will do **both** X and Y. Meanwhile, in the second code block, if CONDITION A is true we will never evaluate CONDITION B, and therefore never do execute that code; here, we will **only** do X. Therefore, we need to use "else if" only when we want the two conditions to be mutually exclusive.

{% highlight c++ %}
// Here is an if/else if/else statement
// to tell you if a number is:
//     positive, 
//     0, 
//     or negative::
if ( num > 0 ){
    cout << "Positive" << endl;
}
else if ( num == 0 ){
    cout << "Zero" << endl;
}
else{
    cout << "Negative" << endl;
}
{% endhighlight %}


 &nbsp;&nbsp;
#### Nested If Statements
 You can put if statements inside of other if statements (or if/else, or if/else if/else). The meaning of logical expressions can change when you are nesting if statements, so you should think through the truth tables for your if/else statements carefully. 

 {% highlight c++ %}
if ( booleanExpression1 ) {
    // anything here will evaluate if booleanExpression1 is true
    if ( booleanExpression2 ) {
        // we will only evaluate this if statement if booleanExpression1 is true, 
        // and then will only execute this statement if booleanExpression2 is ALSO true
    }
}
 {% endhighlight %}

 Nested if statements are essentially performing a logical "AND" operation on the two boolean expressions for the innermost if statement, but if only the first if statement is true you can still do other things. 

&nbsp;&nbsp;&nbsp;
### Common Errors

[//]: # (TODO: add a section about types of errors and some colloquial expressions for errors, such as "throwing an error")



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #000000; background-color: #eebb00; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
Unintended behavior when accidentally using assignment operation (= instead of ==) in conditional statements should give a compiler warning like:
<br /><br />
 warning: using the result of an assignment as a condition without parentheses  [-Wparentheses]
 <br /><br />
 PROTIP: build using the `-Werror` flag to make this warning into an error
 <br /><br />
e.g. `g++ -Wall -Werror -Wpedantic -std=c++17 FILE_NAME.cpp`
</div>

{% highlight c++ %}
// Here is some (incorrect) code:
// We've mentioned it 3 times because it's just that common of an issue
int x = 5;
if (x = 1){ // one equal sign: changes value of x, will always evaluate to true
    cout << "The condition is true." << endl;
}
cout << "x is equal to " << x << "!" << endl;
{% endhighlight %}

The output of this would look like this:

The condition is true.

x is equal to 1

{% highlight c++ %}
// What you would ACTUALLY want is:
// CORRECT CODE
int x = 5;
if (x == 1) // two equal signs, performs comparison
{
    cout << "The condition is true." << endl;
}
cout << "x is equal to " << x << endl;
{% endhighlight %}

Which would output:

x is equal to 5


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #000000; background-color: #eebb00; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<b>Remember</b>, `=` is for assignment and `==` is for checking equality.
</div>

&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="https://canvas.colorado.edu/courses/117869/quizzes/454783">Recitation 3 Pre-quiz</a>
</div>


&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
[//]: # (Advait, see <root>/_ignoreForNow/2025-01-25-Week-3-Booleans-And-Conditions.markdown for the already formatted recitation data. Remove the below gif and note.)

We're working diligently to release the recitation content prior to recitations next week. Please check back here on Monday for that information.

{% include underConstruction.html caption='Please check back later.' %}











&nbsp;&nbsp;&nbsp;&nbsp;
## Homework
You should complete the following homework using VSCode and the skills that you have learned to author, compile, and execute programs. You should build and fix your code using VSCode. Once you believe you have completed the assignment locally, submit your work on Canvas using the appropriate link for the assignment and the "coderunner" tool. 

The coderunner questions match these questions exactly. It will tell you what to do for the problem, give you a few examples of input/output. Give you a space to submit your code.

&nbsp;&nbsp;&nbsp;
### Homework: Preparing for the Heat

[//]: # (TODO: update this to have a Spring term version about it being cold out and impacting how many layers to need to wear)

You are planning to go for a run outside, but it's a hot day. Write a C++ program to determine whether you need to carry extra water based on the temperature.

The program should prompt the user to enter the temperature in degrees Fahrenheit. If the given temperature is above 85°F, display "You need to carry extra water." as it is considered hot weather for running, and then terminate. If the temperature is 85°F or below, the program will display "You don't need extra water." as carrying extra water may not be necessary, and then terminate.

Additionally, the program should perform input validation. If the user inputs a non-positive value for temperature (i.e., 0 or a negative number), the program should display "Invalid  temperature." and terminate.

example: temp is 75
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

  <p>What is the temperature?</p>

  <p><span style="color:red">75</span></p>

  <p>You don't need extra water. </p>
</div>

example: temp is 90
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

  <p>What is the temperature?</p>

  <p><span style="color:red">90</span></p>

  <p>You need to carry extra water. </p>
</div>

example: temp is -5
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

  <p>What is the temperature?</p>

  <p><span style="color:red">-5</span></p>

  <p>Invalid temperature.  </p>
</div>



&nbsp;&nbsp;&nbsp;
### Homework: Ordering Pizza
You've decided to order a pizza for dinner. The restaurant you're ordering from has three sizes of pizza: S, M, and L. Each size has a different base price and price per topping. The prices are indicated in the table below. Create a program to calculate the total cost of your pizza. The program should prompt you for the size of the pizza and the number of toppings, then output the cost. 

| Size | Base Price | Price Per Topping |
| --- |  --- |  --- |
| S | 8.00 | 0.99 |
| M | 10.00 | 1.99 |
| L | 14.00 | 2.99 |

The input should be a **`character`** (for size) and a non-negative integer (for the number of toppings). The program should accept both lowercase and uppercase inputs for pizza sizes (e.g., `s`, `m`, `l` or `S`, `M`, `L`), and the output should be **`double`**.

Here is an example of a good run of the program:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What size pizza would you like to order?</p>

<p><span style="color:red">S</span></p>

<p>How many toppings do you want? </p>

<p><span style="color:red">3</span></p>

<p>Your total is $10.97</p>
</div>

**Note:** You can utilize the `toupper()` or `tolower()` functions to convert the input into either upper or lower case before comparing. 

**Note:** The total cost should be formatted with a two-digit precision. You can use the `setprecision()` function with the fixed manipulator from `<iomanip>` library to do so.

**Bad formatting:** 10.8

**Good formatting:** \$10.80

You will also need to perform input validation on the size of the cake -- i.e., XL is not valid as demonstrated below.

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What size pizza would you like to order?</p>

<p><span style="color:red">XL</span></p>

<p>How many toppings do you want? </p>

<p><span style="color:red">2</span></p>

<p>Invalid pizza size.</p>
</div>

Observe that we choose to still ask teh user for the number of toppings that they want before stating that the pizza size is not valid

We should also have errors for an invalid number of toppings
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What size pizza would you like to order?</p>

<p><span style="color:red">M</span></p>

<p>How many toppings do you want? </p>

<p><span style="color:red">-2</span></p>

<p>Invalid number of toppings.</p>
</div>

And finally we should have an error if neither the pizza size nor the number of toppings are valid.

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What size pizza would you like to order?</p>

<p><span style="color:red">R</span></p>

<p>How many toppings do you want? </p>

<p><span style="color:red">-7</span></p>

<p>Invalid pizza size and number of toppings.</p>
</div>


&nbsp;&nbsp;&nbsp;
### Homework: Travel

You want to write a program that tells you if you can afford a road trip. In order to do this, you need to know your budget, how far you are driving, and how many nights you will stay.

To calculate the gas money, you estimate the road trip will cost you 16 cents per mile. After computing the gas money, you can determine your budget for each night. If you have less than $20 a night, you cannot afford to go. If you have at least $20 a night, you can afford to go camping during this trip. If you have at least $50 a night, you can afford a cheap motel. If you have at least $100 a night, you can afford a nice hotel. 

[//]: # (TODO: update this to have more realistic numbers. moodle and webpage)

You should perform basic input validation for all inputs by checking that they are non-negative numbers. If any of the inputs are invalid, the program should display "Invalid input(s)." Otherwise, the program should proceed with the calculations based on the provided values.

example nice hotel:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What is your budget?</p>

<p><span style="color:red">500</span></p>

<p>How many miles will you drive?</p>

<p><span style="color:red">800</span></p>

<p>How many nights do you want to spend there?</p>

<p><span style="color:red">3</span></p>

<p>You can afford to stay in a nice hotel on this trip.</p>
</div>

example cheap motel hotel:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What is your budget?</p>

<p><span style="color:red">500</span></p>

<p>How many miles will you drive?</p>

<p><span style="color:red">800</span></p>

<p>How many nights do you want to spend there?</p>

<p><span style="color:red">7</span></p>

<p>You can afford to stay in a cheap motel on this trip.</p>
</div>

example: outside your budget
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What is your budget?</p>

<p><span style="color:red">100</span></p>

<p>How many miles will you drive?</p>

<p><span style="color:red">800</span></p>

<p>How many nights do you want to spend there?</p>

<p><span style="color:red">3</span></p>

<p>This trip is outside your budget.</p>
</div>

example: camping
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What is your budget?</p>

<p><span style="color:red">300</span></p>

<p>How many miles will you drive?</p>

<p><span style="color:red">1200</span></p>

<p>How many nights do you want to spend there?</p>

<p><span style="color:red">4</span></p>

<p>You can afford to go camping on this trip.</p>
</div>

example: a generic error
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>What is your budget?</p>

<p><span style="color:red">-300</span></p>

<p>How many miles will you drive?</p>

<p><span style="color:red">1200</span></p>

<p>How many nights do you want to spend there?</p>

<p><span style="color:red">4</span></p>

<p>Invalid input(s).</p>
</div>



&nbsp;&nbsp;&nbsp;
### Homework: Temperature Changes

You've decided to test the temperature outside every morning. Create a program that will tell you if the temperature over the last three days has increased, decreased, or neither. If the temperatures are increasing, print out "It's getting warmer!". If the temperatures are decreasing, then print out "It's getting cooler!". If the temperatures are not in any order or if two or more temperatures are the same, then print "The temperature is changing unpredictably."

The user should input 3 non-negative numbers (**`double`**) separated by spaces.

EXAMPLE: warmer
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Enter temperatures over the last three days:</p>

<p><span style="color:red">75.9 79.3 81.2</span></p>

<p>It's getting warmer!</p>
</div>


EXAMPLE: cooler
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Enter temperatures over the last three days:</p>

<p><span style="color:red">45 30 18</span></p>

<p>It's getting cooler!</p>
</div>


EXAMPLE: unpredictable tempuratures
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Enter temperatures over the last three days:</p>

<p><span style="color:red">79 75 90</span></p>

<p>The temperature is changing unpredictably.</p>
</div>

EXAMPLE: errors (requires only positive values)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Enter temperatures over the last three days:</p>

<p><span style="color:red">-79 75 90</span></p>

<p>Invalid temperature input.</p>
</div>


&nbsp;&nbsp;&nbsp;
### Homework: Car Rental

You have decided to go on a weekend road trip with your friends. So, you plan to rent a car for this trip. The car rental company offers many options and has 4 categories. Each type of car has its specific base rate and price per day to rent the vehicle. Write a C++ program that calculates the total cost based on the car type and number of days.

| Car Type | Base Price | Price per day |
| --- |  --- | --- |
| A | $80 | $15 |
| B | $110 | $25 |
| C | $160 | $35 |
| D | $220 | $45 |


The total bill is calculated based on the following formula:

* Total = 1.23 **X** ( base price **+** no. of days **X** price per day )


The input should be a **`character`** (for car type), a non-negative **`integer`** (for the number of days you want to rent the car), and the output should be **`double`**. 

Ensure you are doing input validation. The user should input car type from one among A, B, C, or D, and the minimum number of days to rent a car is 1. If the car type or the number of days is invalid, display `"Please enter valid input."` and exit the program.


**Note:** The total cost should be formatted with a two-digit precision. You can use the `setprecision()` function with the `fixed` manipulator from the `<iomanip>` library to do so. 

**Bad formatting:** 10.8

**Good formatting:** $10.80


EXAMPLE: Rent `A` for `6` days
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Which car type (A, B, C, or D) would you like to rent?</p>

<p><span style="color:red">A</span></p>

<p>How many days would you like to rent this car?</p>

<p><span style="color:red">6</span></p>

<p>Your total is $209.10</p>
</div>
\begin{sample}


EXAMPLE: Rent `C` for `11` days
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Which car type (A, B, C, or D) would you like to rent?</p>

<p><span style="color:red">C</span></p>

<p>How many days would you like to rent this car?</p>

<p><span style="color:red">11</span></p>

<p>Your total is $670.35</p>
</div>


EXAMPLE: Invalid input 1
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Which car type (A, B, C, or D) would you like to rent?</p>

<p><span style="color:red">E</span></p>

<p>How many days would you like to rent this car?</p>

<p><span style="color:red">1</span></p>

<p>Please enter valid input.</p>
</div>


EXAMPLE: Invalid input 1
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
<p>Which car type (A, B, C, or D) would you like to rent?</p>

<p><span style="color:red">C</span></p>

<p>How many days would you like to rent this car?</p>

<p><span style="color:red">-1</span></p>

<p>Please enter valid input.</p>
</div>


&nbsp;&nbsp;&nbsp;
### Entering on coderunner
Now that you have completed all of the assignment in VSCode, go submit your work via coderunner on Canvas. Be sure to `check` your work and return to VSCode as needed if you need to fix anything. Don't forget to submit this work on coderunner by the deadline to receive credit for this assignment.

<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>


