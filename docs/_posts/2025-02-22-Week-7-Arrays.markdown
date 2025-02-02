---
layout: post
title: "Week 6: Arrays"
date: 2025-02-02 09:00:00 -0700
categories: jekyll update
---
## Learning Goals

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Make arrays of any data type</li>
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

Arrays and strings can also be iterated through in the same way.

{% highlight c++ %}
// Iterating through an array:
string greetings[] = {"hello", "hi", "hey", "what’s up?"};
int size = 4;
for (int i = 0; i < size; i++)
{
    cout << greetings[i] << endl;
}
{% endhighlight %}

{% highlight c++ %}
// Iterating through a string:
string greeting = "Hello world!";
for (int i = 0; i < greeting.length(); i++){
    cout << greeting[i] << ", " << endl;
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Code to Play With
Here is some code to play with if you are interested. Note how it builds a testing function for us. Try to run that testing function with a larger array.

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

&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz Assignment 
{% include uc.html caption='check back later' %}


{% comment %}
(due Monday Jan 27 at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="https://canvas.colorado.edu/courses/117869/quizzes/454783">Recitation 3 Pre-quiz</a>
</div>
{% endcomment %}


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

## Recitation
{% include underConstruction.html caption='check back later' %}


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

## Homework
Please continue working on project 1
{% comment %}
SPWI: link the project
{% endcomment %}