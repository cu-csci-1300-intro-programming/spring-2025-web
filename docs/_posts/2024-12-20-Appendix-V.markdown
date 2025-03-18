---
layout: post
title:  "Appendix V: Vectors"
date:   2024-12-20 12:58:53 -0700
categories: jekyll update
---


We will not formally cover `vector`s, but it's a great topic that we have some readings on, so let us share it here. 

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
In this lesson you will:
<ol>
    <li>Learn what vectors are</li>
    <li>Practice using vectors</li>
</ol>
</div>


* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;
## vector

Let's start with something we already know about - Arrays.

To recap, an array is a contiguous series that holds a fixed number of values of the same datatype.

A vector is a template class that uses all of the syntax that we used with vanilla arrays, but adds in functionality that relieves us of the burden of keeping track of memory allocation for the arrays. It also introduces a bunch of other features that makes handling arrays much simpler.

First things first. We need to include the appropriate header files to use the vector class.

`#include <vector>`

We can now move on to declaring a vector. This is general format of any vector declaration:

`vector <datatype_here> name(size);`

The size field is optional. Vectors are dynamically-sized, so the size that you give them during initialization isn't permanent - they can be resized as necessary.

You can access elements of a vector in the same way you would access elements in an array, for example array[4]. Remember, indices begin from 0.

The C++ vector class comes with <a href="https://www.cplusplus.com/reference/vector/vector/vector/" target="_blank">several member functions</a> available in the C++ reference guide, but following are the ones you will need in this week:


<ol>
    <li>`size()` return the size of a vector</li>
    <li>`at()` takes an integer parameter for index and returns the value at that position</li>
</ol>


Adding elements to the vector is done primarily using two functions

&nbsp;&nbsp;&nbsp;
## push_back
`push_back()` takes in one parameter (the element to be added) and appends it to the end of the vector. Here is an example:



{% highlight c++ %}
// How to use `push_back()` with vectors:
vector <int> vector1; // initializes an empty vector
vector1.push_back(1); //Adds 1 to the end of the vector. 
vector1.push_back(3); //Adds 3 to the end of the vector. 
vector1.push_back(4); //Adds 4 to the end of the vector. 
cout<< vector1.size(); //This will print the size of the vector - in this case, 3.
// vector1 looks like this: [1, 3, 4]
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
## insert
`insert()` can add an element at some position in the middle of the vector.


{% highlight c++ %}
// How to use `insert` with vectors:
// vectorName.insert(vectorName.begin() + position, element)
vector1.insert(vector1.begin() + 1, 2);
cout << vector1.at(1) << endl; // 2 is at index=1
// vector1 looks like this: [1, 2, 3, 4]
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
## begin
Here, the `begin` function returns an iterator to the first element of the vector. Due to the nature of an iterator, this allows for the utility of using `begin()` to refer to the first element and `begin()+k` would refer to the kth element in the vector, starting at 0.

Elements can also be removed.

&nbsp;&nbsp;&nbsp;
## pop_back
`pop_back()` deletes the last element in the vector.

{% highlight c++ %}
// How to use `pop_back()` with vectors:
vector <int> vector1; // initializes an empty vector
vector1.push_back(1); //Adds 1 to the end of the vector. 
vector1.push_back(3); //Adds 3 to the end of the vector. 
vector1.push_back(4); //Adds 4 to the end of the vector. 
vector1.pop_back(); //Removes the last element of the vector.
//vector1 looks like this: [1, 3]
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
## erase
`erase()` can delete a single element at some position, which is shown below using the iterator function of `begin()` to erase the first element of the vector.

{% highlight c++ %}
// How to use `erase()` with vectors:
// vector_name.erase(vector_name.begin() + position)
vector1.erase(vector1.begin() + 0);
cout << vector1.at(0) << endl; //2 is at index=0
// vector1 looks like this: [2, 3, 4]
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
## pass-by-value
It may be useful to think of vectors relationship to arrays as something similar to strings vs arrays of characters; they are similar concepts, but with added utility and flexibility that is helpful. Vectors are also passed by value (like strings) instead of passed by reference (like arrays). This might look something like:


{% highlight c++ %}
// Full vector example:
void myVecEditFunction(vector <int> vec){
   vec.erase(vec.begin());
   //vec now contains the original vector minus the starting element
}

...

int main(){
   vector <int> originalVector = {1, 2, 3};
   myVecEditFunction(originalVector);
   //originalVector still looks like [1, 2, 3]
}
{% endhighlight %}


That's all for now. Consider re-writing an old homework assignment involving arrays with vectors to give yourself practice with this concept.

