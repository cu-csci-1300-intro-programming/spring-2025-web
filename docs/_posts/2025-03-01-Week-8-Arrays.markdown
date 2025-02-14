---
layout: post
title: "Week 8: More Arrays and Streams"
date: 2025-02-12 09:00:00 -0700
categories: jekyll update
---


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
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
## Background

&nbsp;&nbsp;&nbsp;
### Passing Arrays By Reference
Up until now, when calling functions, we have always **passed by value**. When a parameter is passed in a function call, a new variable is declared and initialized to the value passed in the function call.

Observe that the variable `x` in `main` and variable `x` in `AddOne` are separate variables in memory. When `AddOne` is called with `x` on line 10, it is the value of `5` that is passed to the function. This value is used to initialize a new variable `x` that exists only in `AddOne`'s scope. Thus the value of the variable `x` in main's scope remains unchanged even after the function `AddOne` has been called. 

{% highlight c++ linenos start=1 %}
// Pass by value:
void AddOne(int x){
    x = x + 1;
    cout << x << endl;
}

int main(){
    int x = 5;
    cout << x << endl;
    AddOne(x);  /** LINE 10 */
    cout << x << endl;
}

// OUTPUT:
// 5
// 6
// 5
{% endhighlight %}



**Passing By Reference** Arrays, on the other hand, are passed by reference (a reference to the original array’s location in the computer’s memory). So, when an array is passed as a parameter, the original array is used by the function. Observe that there is only one array `X` in memory for the following example. When the function `AddOne` is called on line 10, a reference to the original array `X` is passed to `AddOne`. Because the array `X` is passed by reference, any modifications done to `X` in `AddOne` are done to the original array. These modifications persist and are visible even after the flow of control has exited the function and we return to main.


{% highlight c++ linenos start=1%}
// Pass by reference example:
void AddOne(int X[]){
   X[0] = X[0] + 1;
   cout << X[0] << endl;
}

int main(){
    int X[4] = {1, 5, 3, 2};
    cout << X[0] << endl;
    AddOne(X);  /** LINE 10 */
    cout << X[0] << endl;
}

// OUTPUT:
// 1
// 2
// 2
{% endhighlight %}



When we pass a one-dimensional array as an argument to a function we also provide its length. For two-dimensional arrays, in addition to providing the length (or number of rows), we will also assume that we know the length of each of the subarrays (or the number of columns). A function taking a two-dimensional array with 3 rows and 10 columns (called a `matrix`) as an paremeter then might look something like this:

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
int myInts[7][5];
bool myBooleans[10][15][12];
string myStrings[15][10];
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
cout << "Result is " << res;

// OUTPUT:
// Result is 4
{% endhighlight %}

