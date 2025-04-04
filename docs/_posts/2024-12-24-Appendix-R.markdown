---
layout: post
title: "Appendix R: References"
date: 2024-12-24 09:00:00 -0700
categories: jekyll update
---

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
References are a great tool to understand how to use. We aren't certain that we will cover them this semester in CSCI 1300, but you will certainly learn them in CSCI 2275. Please consider this reading.
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}
## Function Parameters: Pass By Reference

In C++, you can pass parameters to functions either by value or by reference. Passing by reference allows you to modify the original variable within the function.

The syntax is:

{% highlight c++ %}
// pass by reference, note the single `&`
void functionName(<data_type> &parameter_name)
{
    // Function body
}

// pass by value, note the lack of single `&`
void functionName(<data_type> parameter_name)
{
    // Function body
}
{% endhighlight %}

Example:

{% highlight c++ %}
#include <iostream>
using namespace std;

// Function to increment a number by value
void incrementByValue(int num)
{
    num++;
}

// Function to increment a number by reference
void incrementByReference(int &num)
{
    num++;
}

int main()
{
    int x = 5;

    cout << "Before increment: " << x << endl;
    incrementByValue(x); // passing x by value
    cout << "After increment: " << x << endl;

    cout << "---" << endl;

    cout << "Before increment: " << x << endl;
    incrementByReference(x); // passing x by reference
    cout << "After increment: " << x << endl;

    return 0;
}
{% endhighlight %}



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Before increment: 5</p>
<p>After increment: 5</p>
<p>---</p>
<p>Before increment: 5</p>
<p>After increment: 6</p>
</div>




Key points to remember:

<ol>
    <li>Parameters passed by reference are indicated by `&` in the function declaration.</li>
    <li>Changes made to the reference parameter within the function affect the original variable.</li>
    <li>Pass by reference avoids unnecessary copying of the argument to the parameter variable, which can be more efficient.</li>
    <li>Arrays are passed by reference by default (so there is no preceding `&` for an array parameter).</li>
    <li>References cannot be reassigned to refer to a different variable once initialized.</li>
</ol>




