---
layout: post
title: "Week 7: Arrays"
date: 2025-02-10 09:00:00 -0700
categories: jekyll update
---
## Learning Goals

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Make arrays of any data type</li>
    <li>Learn how to make multidimensional arrays</li>
    <li>Learn how to use arrays in functions</li>
    <li>Be able to distinguish between pass by reference and pass by value
Make arrays of any data type</li>
  </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}

&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 6.1, 6.2, 6.4, 6.5, 6.6
1. Wednesday: 2.5
1. Friday: 6.4, 6.5



&nbsp;&nbsp;&nbsp;&nbsp;
## Background

An array is a data structure which can store other data types like double, int, char, and boolean, and string. Arrays have both a type and a size.

&nbsp;&nbsp;&nbsp;
### Making Arrays

**How to declare arrays**
{% highlight c++ %}
// data_type array_name[declared_size];
bool myBooleans[10]; 
string myStrings[15];
int myInts[7];
{% endhighlight %}


**How to initialize arrays (method 1)**
{% highlight c++ %}
bool myBooleans[4] = {true, false, true, true};
{% endhighlight %}

If you do not declare the size inside the square brackets, the array size will be set to however many entries you provide on the right.

{% highlight c++ %}
bool myBooleans[] = {true, false, true}; // size = 3
{% endhighlight %}

Note: the size specified in the brackets needs to match the number of elements you wrote in the curly brackets.

{% highlight c++ %}
/**
 * When the specified size is larger than the actual number of elements, 
 * the elements provided in the curly brackets will be the first several
 * elements in the array, while the additional elements will be filled 
 * with default values. If it’s an integer/double array, the default 
 * values are zero, while if it’s a string array, the default values
 * are empty strings.
 */
#include <iostream>
using namespace std;
int main()
{
    int intArray[5] = {1,2,3};
    for (int i = 0; i < 5; i ++)
    {
        cout << intArray[i] << " ";
    }
}
// OUTPUT:
// 1 2 3 0 0
{% endhighlight %}


{% highlight c++ %}
/**
 * When the specified size is smaller than the actual number of elements,
 * there will be a compilation error.
 */
#include <iostream>
using namespace std;
int main()
{
    int intArray[3] = {1,2,3,4,5};
}
// OUTPUT:
// error: excess elements in array initializer
// int intArray[3] = {1,2,3,4,5};
//                          ^
// 1 error generated.
{% endhighlight %}


**How to Initialize Arrays (Method 2)** You can also initialize elements one by using the arrays index. Note that the left most element has index `0`, NOT index `1`:

{% highlight c++ %}
// method 1
int someInts[5] = { 2, 4, 6, 8, 10 };

// method 2
int alsoSomeInts[5];
alsoSomeInts[0] = 2;
alsoSomeInts[1] = 4;
alsoSomeInts[2] = 6;
alsoSomeInts[3] = 8;
alsoSomeInts[4] = 10;
{% endhighlight %}

**How to Initialize Arrays (Method 3)** Or course you can also initialize elements one by one using a for loop:

{% highlight c++ %}
int yetAnotherVersionOfSomeInts[5];
// NOTE: i += 2 rather than i++ to match the arrays of method 2 above
int yetAnotherVersionOfSomeInts[5];
for (int i = 0; i < 5; i++ )
{   
    yetAnotherVersionOfSomeInts[i] = (i+1)*2;
} 
// { 2, 4, 6, 8, 10 }
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
### How to Access Elements in an Array

We have essentially already had practice with accessing elements in an array, as in C++, string is basically an array of characters. You can access elements in arrays using the same syntax you used for strings:

{% highlight c++ %}
string greetings[] = {"hello", "hi", "hey", "what’s up?"};
cout << greetings[3] << endl;
{% endhighlight %}

Arrays and strings can also be iterated through in the same way. See these two examples:

{% highlight c++ %}
// Iterating through an array of many strings:
string greetings[] = {"hello", "hi", "hey", "what’s up?"};
int size = 4;
for (int i = 0; i < size; i++)
{
    cout << greetings[i] << endl;
}
{% endhighlight %}

{% highlight c++ %}
// Iterating through a single string:
string greeting = "Hello world!";
for (int i = 0; i < greeting.length(); i++){
    cout << greeting[i] << ", " << endl;
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Code to Play With
Here is some code to play with if you are interested. Note how it builds a printing function for us. Exercise: run this code to exectue the printing function with a larger array.

{% highlight c++ %}
#include<iostream>
using namespace std;

void formattedDisplayArray( string title, int arr[], int len )
{
    cout << title << "\n";
    for ( int index = 0 ; index < len ; index++ )
    {
        cout << "\tarr[" << index << "] == " << arr[index] << "\n";
    }
    return;
}

int main()
{
    // method 1
    int someInts[5] = { 2, 4, 6, 8, 10 };

    // method 2
    int alsoSomeInts[5];
    alsoSomeInts[0] = 2;
    alsoSomeInts[1] = 4;
    alsoSomeInts[2] = 6;
    alsoSomeInts[3] = 8;
    alsoSomeInts[4] = 10; 

    // method 3
    int yetAnotherVersionOfSomeInts[5];
    for (int i = 0; i < 5; i++ )
    {   
        yetAnotherVersionOfSomeInts[i] = (i+1)*2;
    }   

    formattedDisplayArray( "METHOD 1", someInts, 5 );
    formattedDisplayArray( "METHOD 2", alsoSomeInts, 5 );
    formattedDisplayArray( "METHOD 3", yetAnotherVersionOfSomeInts, 5 );

    // TODO: call formattedDisplayArray on an array of your own creation
    //       with length 10

    return 0;
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Passing Arrays By Reference
Up until now, when calling functions, we have always **passed by value**. When a parameter is passed in a function call, a new variable is declared and initialized to the value passed in the function call. This has likely led to many questions about why our function calls are not changing the values of variables in `main`.

Observe that the variable `x` in `main` and variable `x` in `AddOne` are separate variables in memory. When `AddOne` is called with `x` on line 10, it is the value of `5` that is passed to the function. This value is used to initialize a new variable `x` that exists only in `AddOne`'s scope. Thus the value of the variable `x` in main's scope remains unchanged even after the function `AddOne` has been called. 

{% highlight c++ linenos start=1 %}
// Pass by value:
void AddOne(int x){
    x = x + 1;
    cout << "AddOne" << x << endl;
}

int main(){
    int x = 5;
    cout << "main: " << x << endl;
    AddOne(x);  /** LINE 10 */
    cout << "main: " << x << endl;
    cout << "Ask yourself, why doesn't the above line print main: 6?" << endl;
}

// OUTPUT:
// main: 5
// AddOne: 6
// main: 5
// Ask yourself, why doesn't the above line print main: 6?
{% endhighlight %}



**Passing By Reference**: Arrays, on the other hand, are **passed by reference** (a reference to the original array’s location in the computer’s memory). So, when an array is passed as a parameter, the original array is used by the function. Observe that there is only one array `X` in memory for the following example. When the function `AddOne` is called on line 10, a reference to the original array `X` is passed to `AddOne`. Because the array `X` is passed by reference, any modifications done to `X` in `AddOne` are done to the original array. These modifications persist and are visible even after the flow of control has exited the function and we return to main.


{% highlight c++ linenos start=1%}
// Pass by reference example:
void AddOne(int X[]){
   X[0] = X[0] + 1;
   cout << "AddOne: " << X[0] << endl;
}

int main(){
    int X[4] = {7, 5, 3, 2};
    cout << "main: " << X[0] << endl;
    AddOne(X);  /** LINE 10 */
    cout << "main: " << X[0] << endl;
    cout << "Ask yourself, why doesn't the above line print main: 7?" << endl;
}

// OUTPUT:
// main: 7
// AddOne: 8
// main: 8
// Ask yourself, why doesn't the above line print main: 7?
{% endhighlight %}



When we pass a one-dimensional array as an argument to a function we also provide its length. For two-dimensional arrays, in addition to providing the length (or number of rows), we will also assume that we know the length of each of the subarrays (or the number of columns). A function taking a two-dimensional array (somtimes called a `matrix`) with 3 rows and 10 columns as an paremeter might look something like this:

{% highlight c++ %}
void TwoDimensionalFunction( int matrix[3][10], int rows )
{
    // ...
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Multidimensional Arrays

In C++ we can declare an array of arrays known as a multidimensional array. Multidimensional arrays store data in tabular form.

**How to Declare Multidimensional Arrays**

{% highlight c++ %}
// data_type array_name[dimension_1][dimension_2]....;
int myInts[7][5];  // 7 rows, 5 columns
bool myBooleans[10][15][12];  // 10 rows, 15 columns, 12 depths
string myStrings[15][10];  // 15 rows, 10 columns
{% endhighlight %}

**How to Initialize Multidimensional arrays (Method 1)**

{% highlight c++ %}
int myInts[2][2] = {1, 2, 3, 4};
{% endhighlight %}

The 2D array in this case will be filled from left to right from top to bottom.

{% highlight c++ %}
int myInts[2][2] = { {1, 2}, {3, 4} };
{% endhighlight %}

You can also initialize a 2D array by explicitly separating the rows as shown above.

**How to Initialize Multidimensional arrays (Method 2)** You can also initialize elements using nested loops:

{% highlight c++ %}
int myInts[2][2];
for(int i=0; i < 2; i++)
{
    for(int j=0; j < 2; j++)
    {
        myInts[i][j] = i + j;
    }
}
{% endhighlight %}

The above code will create the following 2D array: `{ {0,1}, {1,2} }`.


**How to Access Elements in a Multidimensional array**
You can use `myInts[i][j]` to access the ith row and jth column of a 2D array

Multidimensional arrays can be iterated using nested loops as shown below:

{% highlight c++ %}
int myInts[2][2] = { {0,1}, {1,2} };
int res = 0;
for(int i=0; i < 2; i++)
{
    for(int j=0; j < 2; j++)
    {
        res = res + myInts[i][j];
    }
}
cout << "Result is " << res << endl;

// OUTPUT:
// Result is 4
{% endhighlight %}




&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz Assignment 
{% include uc.html caption='check back later' %}


{% comment %}
(due Monday Feb 24 at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="TODO">Recitation TODO Pre-quiz</a>
</div>
{% endcomment %}


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

## Recitation
{% include underConstruction.html caption='check back later' %}


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

## Homework
Please continue working on project 1. It is due at the end of this week.
{% comment %}
TODO: link the project
{% endcomment %}
{% include underConstruction.html caption='We will link to the project here.' %}
