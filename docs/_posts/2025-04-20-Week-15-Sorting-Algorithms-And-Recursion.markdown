---
layout: post
title: "Week 15: Sorting Algorithms and Recursion"
date: 2025-04-01 09:00:00 -0700
categories: jekyll update
---


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
This week you will:
    <ol>
        <li>Learn about sorting algorithms and how to discuss the "speed" of an algorithm</li>
        <li>Learn how to use recursive functions</li>
    </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 6.1, 6.2
1. Wednesday: 5.10
1. Friday: Review content as needed.



&nbsp;&nbsp;&nbsp;&nbsp;
## Background

    
&nbsp;&nbsp;&nbsp;
### Sorting Algorithms

There are several different strategies to sort unordered lists of data. They generally fall into two categories based on how long it takes for them to run proportionate to the number of items they are designed to sort. 

When discussing how long an algorithm takes to run, we use something called "Big O Notation". To use Big O, you need to determine the size of the input, which is designated as `n`. The number of singular operations to execute your algorithm as a function of the input size defines how long it takes -- for example if you have to look at every element in your list only once, you would need `n` operations. If you had to compare every element to every other element in your list, you would need `n^2` (n-squared) operations. Big O then removes any constants or smaller terms, as we are only concerned with the limit of the behavior -- i.e., what happens as your input gets exceedingly large. 

When using Big-O, the two categories of sorting algorithms become clear: algorithms that generally either require that you compare every element against every other element, meaning they take `O(n^2)` time, or algorithms that continuously break your data set in halves and compare these smaller pieces, which would take `O(n*log(n))` time, as seen in Quick Sort.

Below are four algorithms chosen to represent the different styles of sorting algorithms available to you.


&nbsp;&nbsp;
#### Bubble Sort

Bubble Sort is generally considered the simplest sorting algorithm. It works by repeatedly swapping the adjacent elements if they are in the wrong order, only comparing two at a time.

{% include img.html src='bubble_sort.png' alt='list iterations over time. original list 7, 6, 4, 3. final list 3, 4, 6, 7' caption='' %}

Image Source: https://www.computersciencebytes.com/sorting-algorithms/bubble-sort/

Bubble sort requires comparing `n` elements against `n` elements, and so its computational complexity described using Big-O is `O(n^2)`.



&nbsp;&nbsp;
#### Selection Sort

Selection Sort involves picking the smallest (or largest) number out of the unsorted elements and then putting it in its own list, one after the other, so that you find the smallest, then the second smallest, and so on and so forth. 

{% include img.html src='selection-sort.png' alt='list iterations over time. original list 7,5,4,2. final list 2,4,5,7' caption='' %}

Image Source: https://www.hackerearth.com/practice/algorithms/sorting/selection-sort/tutorial/

For the first level of selection sort, you must search all `n` elements to find the smallest one. For the second level, you must search `n-1` elements, then `n-2`, and so on and so forth. This will ultimately require `n^2/2` operations. We do not worry about constants such as `1/2` in Big-O, and so this is still a computational complexity of `O(n^2)`.



&nbsp;&nbsp;
#### Insertion Sort

Insertion sort works by splitting the list of elements into two pieces: one piece that has already been sorted, and one piece that has not been sorted yet. The algorithm goes through the unsorted list one element at a time and inserts it into the correct position in the sorted list until all elements have been sorted.

{% include img.html src='Insertion-sorting.png' alt='list iterations over time. original list 23,1,20,5,2. final list 1,2,5,10,23' caption='' %}

Image Source: https://www.geeksforgeeks.org/insertion-sort-algorithm/

The first element is already considered sorted. For the second element, you must compare against 1 element to decide where to put it; the third requires 2 comparisons; this pattern continues until the last comparison, which would be against `n-1` elements. The formula `1+2+...+n-1`, when removing constants, also reduces to a Big-O of `O(n^2)`.



&nbsp;&nbsp;
#### Quick Sort

Quick Sort is a little more complex, but it is faster than the previous algorithms, hence the name. Quick sort works by splitting our list around a randomly chosen "pivot" into two smaller lists for us to sort, where one list is smaller than the pivot and the other list is larger than the pivot. We then split those smaller lists around their own pivots again, resulting in four lists. This continues until we run out of elements in our lists.

{% include img.html src='quick-sort.png' alt='list iterations over time. original list 20,2,9,7,12,15,1,6,8. final list 1,2,6,7,8,9,12,15,20' caption='' %}

As you can see, this sorting creates a tree-like structure. Each layer contains `n` elements and requires `n` operations comparing those elements against their respective pivots. However, the trick that makes this faster than the previous algorithms lies in the number of repetitions for this search: instead of requiring `n` separate comparisons for each element, as you have seen in the previous three sorting algorithms, you only need as many repetitions as there are layers in this tree. Since each iteration of the tree is splitting the number of elements in half, there are `log(n)` layers, resulting in a total time complexity of `O(n*log(n))`. 



&nbsp;&nbsp;&nbsp;
### Recursion
A recursive function is one which calls itself. Recursion can be used to accomplish a repetitive task, like loops. Indeed, it turns out that anything you can do with a loop, you could also do with recursion, and vice versa. However, some algorithms are easier to express with loops, and others are easier to express with recursion. You'll want both in your toolkit to write elegant, simplistic, short code.

Every recursive function includes two parts:


1. **base case:** A simple non-recursive occurrence that can be solved directly. Sometimes, there are multiple base cases.
1. **recursive case:** A more complex occurrence that can be described using smaller chunks of the problem, closer to the base case.. It is possible to have multiple recursive cases as well.

    
To write a recursive function, we often use the following format:



{% highlight c++ %}
returnType functionName(arguments)
{
    if (/* baseCase? */)
    {
        return /* baseCase result */;
    }
    else
    {
        // some calculations, including a call to functionName
        // with “smaller” arguments.
        return /* general result */
    }
}
{% endhighlight %}




Consider the following simple recursive function, which calculates the sum of the numbers 1, 2, 3, …, n:

{% highlight c++ %}
int sumNumsRecursive(int num)
{
    // base case: if the number is 0, we will return 0
    if(num == 0)
    {
        return  0;
    }
    else
    {
        // recursive case: where we try to find the result of the previous step
        return num + sumNumsRecursive(num - 1);
    }
}
{% endhighlight %}




The following examples show the final returned value and intermediate recursive function calls.

For example, if `num = 3`.
- recursive call 1: `sumNumsRecursive(3)` will return `3 + sumNumsRecursive(2)` (we are running the else statement since num is 3).
- recursive call 2: When `sumNumsRecursive(2)` is called, it will return `2 + sumNumsRecursive(1)`.
- recursive call 3: Similarly, `sumNumsRecursive(1)` will `return 1 + sumNumsRecursive(0)`.
- recursive call 4: Finally, `sumNumsRecursive(0)` will return 0, by definition of the base case.
- Next if we go back the chain and replace `sumNumsRecursive(0)` with 0, we will have `sumNumsRecursive(1) = 1 + 0`. Therefore, `sumNumsRecursive(1) = 1`.
- Similarly, `sumNumsRecursive(2) = 2 + sumNumsRecursive(1)`, where `sumNumsRecursive(1) = 1`. Therefore, `sumNumsRecursive(2) = 2 + 1`; thus, `sumNumsRecursive(2) = 3`.
- Lastly, `sumNumsRecursive(3) = 3 + 3`; the second 3 is the result of `sumNumsRecursive(2)`. Therefore, `sumNumsRecursive(3) = 6`.

Below is the same explanation in a different format.


{% highlight txt %}
sumNumsRecursive(3) = 3 + sumNumsRecursive(2) // running the else statement
                    = 3 + 2 + sumNumsRecursive(1) 
                    // sumNumsRecursive(2) = 2 + sumNumsRecursive(1)
                    = 3 + 2 + 1 + sumNumsRecursive(0) 
                    // sumNumsRecursive(1) = 1 + sumNumsRecursive(0)
                    = 3 + 2 + 1 + 0 
                    // sumNumsRecursive(0) = 0 (base case)
                    = 6
{% endhighlight %}



&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz (due Monday April 21 at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="https://canvas.colorado.edu/courses/117869/quizzes/464390">Recitation 15 Pre-quiz</a>.
</div>


&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation 

### Recitation Spot The Error- Problem 1
The following program attempts to erase the first number (0th index) from a vector. Identify the error(s) in the code and provide the corrected line(s).

```cpp
#include <vector>
#include <iostream>
using namespace std;

int main() {
    vector<int> v = {5, 6, 7, 8, 9};
    v.erase(0);
    
    cout << v[0] << endl;
    return 0;
}
```
&nbsp;&nbsp;&nbsp;


### Recitation Spot The Error- Problem 2
The following program attempts to add an element to an empty vector. Identify the error(s) in the code and provide the corrected line(s).

```cpp
#include <vector>
#include <iostream>
using namespace std;

int main() {
    vector<int> v;
    v.at(0) = 42;
    cout << v.at(0) << endl;
    return 0;
}
```
&nbsp;&nbsp;&nbsp;

### Recitation Spot The Error- Problem 3
The following program attempts to delete the even numbers from a vector. Identify the error(s) in the code and provide the corrected line(s).

```cpp
#include <vector>
#include <iostream>
using namespace std;

int main() {
    vector<int> v = {2, 4, 6, 8, 9};

    for (int i = 0; i < v.size(); i++) {
        if (v[i] % 2 == 0) {
            v.erase(v.begin() + i);
        }
    }

    // Print remaining elements
    for (int i = 0; i < v.size(); i++) {
        cout<< v[i] <<" ";
    }
    cout << endl;
    return 0;
}
```
&nbsp;&nbsp;&nbsp;


### Recitation Spot The Error- Problem 4
The following program attempts to double every element in the vector and add it at the end of the cector. Identify the error(s) in the code and provide the corrected line(s).

```cpp
#include <vector>
#include <iostream>
using namespace std;

int main() {
    vector<int> v = {5, 6, 7, 8, 9};
    
    for(int i = 0; i < 5; i++){
        v.push_back(v[i] * 2);
    }
    
    for(int i=0; i<v.size(); i++){
        cout<< v[i]<< endl;
    }
}
```
&nbsp;&nbsp;&nbsp;

### Recitation Fibonacci Sequence - Problem 5
The Fibonacci Sequence is on of the popular sequences that can be found in nature.

Write a function to calculate the nth number in the Fibonacci Series. You can read all about Fibonacci numbers [here](https://en.wikipedia.org/wiki/Fibonacci_number).

In summary, nth number in the series is the sum of (n-1)th and (n-2)th number i.e

```
fib(n) = fib(n-1) + fib(n-2)
Given:
    fib(0) = 0
    fib(1) = 1
    fib(2) = 1
```

Write a function that takes in an integer n and returns the 'n'th fibonacci number. Take an input from the user and print the nth fibonacci number using the function.

*Hint: Recursion*
&nbsp;&nbsp;&nbsp;


#### Recitation Fibonacci Sequence- Problem 5.a. : Algorithm
Write out the steps you would use to solve this problem by hand as pseudocode. 

&nbsp;&nbsp;&nbsp;

#### Recitation Fibonacci Sequence - Problem 5.b.: Examples
Pick four possible inputs for each of your function. Follow the steps you wrote for these values to find your result, and verify it.

&nbsp;&nbsp;&nbsp;

#### Recitation Fibonacci Sequence- Problem 5.b. : Implementation
Translate your pseudocode into a C++ program to solve the above code, verify that your program works as expected.

&nbsp;&nbsp;&nbsp;

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
 
By following these steps, your submission will be clear, organized, and standardized across all recitation assignments.

&nbsp;&nbsp;&nbsp;&nbsp;
## Homework 9

**Warning: You are not allowed to use global variables for this assignment.**

This homework is extra credit, you will receive credit for the questions you have completed. Regardless of your completion of this extra credit homework assignment, sorting and recursion is fair game for the final exam. 

This assignment is due Friday May 2. Prior to that, you have deadlines for Project 2. Please plan accordingly.

All function names, return types, and parameters must precisely match those shown. You may not use pass by reference or otherwise modify the function prototypes. You are welcome to create additional functions that may help streamline your code.


&nbsp;&nbsp;&nbsp;
### Carbon Emission Reduction 
*This question may require the use of recursion, logical and relational operators, if-else statements, declaring and calling a function, and processing user input. Note: you are not allowed to use loops for this question.*

You are tasked with estimating the future reduction in your organization's carbon emissions. Based on historical data, the reduction of carbon emissions for the next year can be predicted from the current year using the following equation:

{% highlight c++ %}
next_year_reduction = current_reduction + 0.5 * current_reduction + 10
{% endhighlight %}

Develop a recursive function that takes the current year's carbon emission reduction and the number of years forward for which the reduction needs to be predicted and returns the estimated reduction. 


| **Function:** | <tt>emissionReduction(double, int)</tt><br />`double emissionReduction(double current_reduction, int years)` |
| **Purpose:** | To estimate future reductions in carbon emissions based on current reduction efforts and projected yearly improvements. |
| **Parameters:** | **double** <tt>current\_reduction</tt> - The current year's reduction in carbon emissions. <br /> **int** <tt>year</tt> - number of years forward |
| **Return Value:** | Returns the estimated reduction in carbon emissions after the specified number of years. |
| **Error Handling:** |- If <tt>current\_reduction</tt> and/or <tt>year</tt> is negative, -1 is returned. <br /> - If <tt>year</tt> is equal to 0, return original <tt>current\_reduction</tt> <br /> - It should not print anything. |

**Example:**

Note: This is only an example of the function; you need to develop your own main function to fulfill the requirement for this problem.

{% highlight c++ %}

// Assume the proper libraries are included.
// Assume the proper implementation of emissionReduction() is included.

int main()
{
    cout << "Predicted reduction in carbon emissions: " 
         << emissionReduction(100, 3) 
         << endl;
    return 0;
}

// // OUTPUT:
// Predicted reduction in carbon emissions: 385
{% endhighlight %}

 
**For Question 1, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste emissionReduction() and any helper function(s) to the answer box!**



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

<p>Current reduction: 200</p>
<p>Years: 5</p>

<span style="color:red">Output:</span>

<p>Predicted reduction in carbon emissions: 1650.62</p>

<span style="color:red">Explanation:</span>

<p>emissionReduction(200, 0) = 200</p>
<p>emissionReduction(200, 1) = 200 + 0.5 * 200 + 10 = 310</p>
<p>emissionReduction(200, 2) = 310 + 0.5 * 310 + 10 = 47</p>
<p>emissionReduction(200, 3) = 475 + 0.5 * 475 + 10 = 722.5</p>
<p>emissionReduction(200, 4) = 722.5 + 0.5 *722.5 + 10 = 1093.75</p>
<p>emissionReduction(200, 5) = 1093.75 + 0.5 * 1093.75+ 10 = 1650.62</p>

</div>


  
&nbsp;&nbsp;&nbsp;
### Vector Shuffle 
*This question may require the use of functions, vectors, and loops.*

Your task is to write a C++ function that takes the elements of two vectors and returns a vector of integer values that combines the two input vectors by alternating between values from each of the two vectors. If the vectors are of different sizes, the remaining elements from the longer vector should be appended to the result vector.

| **Function:**  | <tt>vectorShuffle(vector\<int>, vector\<int>)</tt><br /> `vector<int> vectorShuffle(vector<int> vec1, vector<int> vec2)` |
| **Purpose:** | To shuffle the elements of two vectors and return a new vector containing elements from both vectors in an interleaved fashion. |
| **Parameters:** |  **vector\<int>** <tt>vec1</tt> - The first vector of integers <br />**vector\<int>** <tt>vec2</tt> - The second vector of integers |
| **Return Value:** | - **vector\<int>** Returns a new vector containing elements from both <tt>vec1</tt> and <tt>vec2</tt> <br />- The function should not print anything. |
| **Error Handling:** | - If one vector is shorter than the other (including size 0), alternate as long as you can and append the remaining elements from the longer vector. <br />- If both vectors are empty (size 0), the return value should be an empty vector.<br />- The first element of the returned vector should come from the first input argument. |


**Example:**

Note: This is only an example of the function; you need to develop your own main function to fulfill the requirement for this problem.

{% highlight c++ %}
// Assume the proper libraries are included.
// Assume the proper implementation of vectorShuffle() is included.

int main()
{
    vector<int> vec1 = {1, 3, 5};
    vector<int> vec2 = {2, 4, 6, 8, 10};
    vector<int> result = vectorShuffle(vec1, vec2);
    if (result.size() == 0)
    {
        cout << "No elements found" << endl;
    }
    else
    {
        cout << "Shuffled vector:" << endl;
        for (int i = 0; i < int(result.size()); i++)
        {
            cout << result.at(i) << " ";
        }
        cout << endl;
    }
    return 0;
}

// // OUTPUT:
// Shuffled vector: 
// 1 2 3 4 5 6 8 10
{% endhighlight %}


**For Question 2, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste the vectorShuffle() and any helper function(s) into the answer box!!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

<p>vector&lt;int&gt; vec1;</p>
<p>vector&lt;int&gt; vec2 = { 2, 4, 6, 8, 10 };</p>

<span style="color:red">Output:</span>

<p>Shuffled vector:</p>
<p>2 4 6 8 10</p>

</div>



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

<p>vector&lt;int&gt; vec1;</p>
<p>vector&lt;int&gt; vec2;</p>

<span style="color:red">Output:</span>

<p>No elements found</p>

</div>


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

<p>vector&lt;int&gt; vec1 = { 1, 1, 3 };</p>
<p>vector&lt;int&gt; vec2 = { 2, 4, 6, 8, 10 };</p>

<span style="color:red">Output:</span>

<p>Shuffled vector:</p>
<p>1 2 1 4 3 6 8 10</p>

</div>




&nbsp;&nbsp;&nbsp;
### The Magical List  
*This question may require the use of functions, vectors, and loops.*

Alex is a curious programmer who loves solving puzzles. One day, while tinkering with numbers, Alex decides to create a magical list that follows a set of peculiar rules. Here's how the game works:

Alex starts with an empty list. They ask a friend to keep entering positive integers, one at a time. The program will continuously prompt the user with "Please enter a number:" until -1 is entered and each number influences the list in some way:

1. If the list is empty, Alex adds the number to the list immediately and does not consider the remaining rules of the game
1. If the number is divisible by 5, Alex removes the first number from the list (if there is one).
1. If the number is divisible by 3, Alex removes the last number from the list (if there is one).
1. NOTE: If the number is divisible by both 3 and 5, Alex does both: remove the first and last numbers from the list (if there is a number). 
1. If none of the above applies, Alex simply adds the number to the end of the list.


However, there's a catch! If someone enters a negative number that isn't `-1`, or zero, Alex scolds them with:  

**"The number should be a positive integer or -1."**

When someone finally enters `-1`, Alex stops the game. Then, Alex proudly displays the final list of numbers, separated by spaces. Note: the printing will happen in `main( )`. 


| **Function:** | <tt>processMagicalList( )</tt><br /> `vector<int> processMagicalList()` |
| **Purpose:** | To process a series of user inputs according to the rules and return the final list of integers. |
| **Parameters:** | None. All inputs are provided by the user interactively during execution. |
| **Return Value:** | **vector\<int>** Returns a vector containing the final list of numbers after applying the rules. |
| **Error Handling:** | - The program should prompt the user with "Please enter a number:" for each input. <br />- If the user enters a non-positive number (excluding `-1`), display <tt>"The number should be a positive integer or -1."</tt>.<br />- The function should not print the vector. Printing should be handled by the main function. |


**Example:**&

Note: This is only an example of the function; you need to develop your own main function to fulfill the requirement for this problem.

Sample Code:

{% highlight c++ %}
// Assume the proper libraries are included.
// Assume the proper implementation of processMagicalList() is included.

int main()
{
    vector<int> result = processMagicalList();
    if (result.size() == 0)
    {
        cout << "The vector is empty." << endl;
    }
    else
    {
        cout << "The elements in the vector are: ";
        for (int i = 0; i < int(result.size()); i++)
        {
            cout << result[i] << " ";
        }
        cout << endl;
    }
    return 0;
}

// // OUTPUT
// The elements in the vector are: 8
{% endhighlight %}


 
**For Question 3, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste the processMagicalList() function into the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:red">Inputs:</span>
<p>3, 5, 15, 8, -1</p>
<br />

<span style="color:red">Output:</span>

<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>The elements in the vector are: 8</p>
<br />

<span style="color:red">Explanation:</span>
<ol>
    <li><strong>3:</strong> The list is empty, so 3 is added to the list. Current list: [ 3 ]</li>
    <li><strong>5:</strong> The number is divisible by 5. The first number, 3, is removed from the list. Current list: [ ] (empty) </li>
    <li><strong>15:</strong> The list is empty, so 15 is added to the list. Current list: [ 15 ]</li>
    <li><strong>8:</strong> The list is not empty, so 8 is added to the end of the list. Current list: [ 15, 8 ]</li>
    <li><strong>-1:</strong> The game ends. The list contains numbers, so the program prints the elements: "The elements in the vector are: 15 8".</li>
</ol>
</div>



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:red">Inputs:</span>
<p>0,  -5,  6,  -1</p>
<br />

<span style="color:red">Output:</span>
<p>Please enter a number: </p>
<p>The number should be a positive integer or -1. </p>
<p>Please enter a number: </p>
<p>The number should be a positive integer or -1. </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>The elements in the vector are: 6</p>
<br />

<span style="color:red">Explanation:</span>
<ol>
    <li><strong>0:</strong> This is a not a positive number, scold the player. Current list: [ ] (empty)</li>
    <li><strong>-5:</strong> This is a not a positive number, scold the player. Current list: [ ] (empty)</li>
    <li><strong>6:</strong> The list is empty, so 6 is added to the list. Current list: [ 6 ]</li>
    <li><strong>-1:</strong> The game ends. The list contains numbers, so the program prints the elements: "The elements in the vector are: 6".</li>
</ol>
</div>




<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:red">Inputs:</span>
<p>3, 4, 2, 15, 7, 0, 8, 6, 10, 30, 21, 22, -1</p>
<br />

<span style="color:red">Output:</span>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>The number should be a positive integer or -1. </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>Please enter a number: </p>
<p>The elements in the vector are: 21, 22</p>
<br />

<span style="color:red">Explanation:</span>
<ol>
    <li><strong>3:</strong> The list is empty, so 3 is added to the list. Current list: [ 3 ]</li>
    <li><strong>4:</strong> The number is not divisible by 3 or 5. The number is added to the list. Current list: [ 3, 4 ]</li>
    <li><strong>2:</strong> The number is not divisible by 3 or 5. The number is added to the list. Current list: [ 3, 4, 2 ]</li>
    <li><strong>15:</strong> The number is divisible by both 3 and 5. The list has data that can be removed. The first and last number is removed.  Current list: [ 4 ]</li>
    <li><strong>7:</strong> The number is not divisible by 3 or 5. The number is added to the list. Current list: [ 4, 7 ]</li>
    <li><strong>0:</strong> This is a not a positive number, scold the player. Current list: [ 4, 7 ]</li>
    <li><strong>8:</strong> The number is not divisible by 3 or 5. The number is added to the list. Current list: [ 4, 7, 8 ]</li>
    <li><strong>6:</strong> The number is divisible by 3 but not 5. Remove the last number from the list. Current list: [ 4, 7 ]</li>
    <li><strong>10:</strong> The number is divisible by 5 but not 3. Remove the first number from the list. Current list: [ 7 ]</li>
    <li><strong>30:</strong> The number is divisible by both 3 and 5. The list has data that can be removed. The first and last number is removed. Current list: [ ] (empty)</li>
    <li><strong>21:</strong> The list is empty, so 21 is added to the list. Current list: [ 21 ]</li>
    <li><strong>22:</strong> The number is not divisible by 3 or 5. The number is added to the list. Current list: [ 21, 22 ]</li>
    <li><strong>-1:</strong> The game ends. The list contains numbers, so the program prints the elements: "The elements in the vector are: 21 22".</li>
</ol>
</div>




&nbsp;&nbsp;&nbsp;
### T Ball Players 
*This question may require the use of arrays, logical and relational operators, if-else statements, declaring and calling a function.*

Coach Prime is getting ready for the new T-ball season and needed to finalize his roster. The team is open to kids between the ages of 4 and 6, and parents had already sent in names and ages of their children. 

Write a function, printEligiblePlayers, to help Coach Prime filter out the eligible players from the list of names and ages. Your function should identify players between 4 and 6 years old (inclusive) and print their names along with their ages, so Prime Kelly can focus on training her future stars.



**Function Specification :**

| **Function:** | <tt>printEligiblePlayers(string, double, int)</tt><br /> `void printEligiblePlayers(string names[], double ages[], int num)` |
| **Purpose:** | To identify players between 4 and 6 years old (inclusive) and print their names along with their ages |
| **Parameters:** | **string** <tt>names[]</tt> - an array of strings to hold names of players <br />**double** <tt>ages[]</tt> - an array of floating point numbers (as doubles) to hold ages of players <br />**int** <tt>num</tt> - an integer that gives the number of elements in the players and ages arrays |
| **Return Value:** | The function does not return anything |
| **Error Handling:** |  The size of names and ages will be the same represented by num. |



**Example:**

Note: This is only an example of the function; you need to develop your own main function to fulfill the requirement for this problem.


{% highlight c++ %}
// Assume the proper libraries are included.
// Assume the proper implementation of printEligiblePlayers() is included.

int main()
{
    string names[4] = {"Joe", "Jack", "Amy", "Bob"};
    double ages[4] = {4.0, 5.6, 6.0, 4.2};
    printEligiblePlayers(names, ages, 4);
}

// // OUTPUT
// Joe 4
// Jack 5.6
// Amy 6
// Bob 4.2
{% endhighlight %}




**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste printEligiblePlayers() and any helper function(s) to the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

<p>string names[4] = { "Joe", "Jack", "Amy", "Bob" };</p>
<p>double ages[4] = { 3.4, 5.6, 6.4, 4.2 };</p>
<p>printEligiblePlayers( names, ages, 4 );</p>


<span style="color:red">Output:</span>

<p>Jack 5.6</p>
<p>Bob 4.2</p>

</div>





&nbsp;&nbsp;&nbsp;
### Music App 

For this question, you'll develop a basic Music App System by creating a Library class to manage a collection of songs. For this question, you will create a Song class. 

The **Song** class comprises the following attributes:


**Data members (private)**

| **Member Type** | **Member Name** | **Description** |
| --- | --- | --- |
| `string` | `_title` | The name of the song |
| `string` | `_artist` | The name of the song who sang the song |
| `int` | `_downloads` | A count of the number of times the song was download |



**Member Functions (public)**

| **Function** | **Description** |
| --- | --- |
| <tt>Default constructor</tt> | Creates a new instance of `Song` by setting `_title` to an empty string,  `_artist` to an empty string and  `_downloads` to 0. |
| `Song(string)` | Creates a new instance of `Song` by setting `_title` as the string parameter,  `_artist` to an empty string and  `_downloads` to 0. |
| `Song(string, string, int)` | Creates a new instance of `Song` by setting `_title` as the first string parameter,  `_artist` as the second string parameter and  `_downloads` to the integer parament. See Function Specification table below for more details. |
| `string getTitle()` | Returns the `_title` of the `Song`. |
| `string getArtist();` | Returns the `_artist` of the `Song`. |
| `int getDownloads();` | Returns the number of `_downloads` of the `Song`. |
| `void setTitle(string)` | Sets the `_title` to the value of the provided string parameter. |
| `void setArtist(string)` | Sets the `_artist` to the value of the provided string parameter. |
| `void setDownloads(int)` | Sets the `_downloads` to the value of the provided int parameter. |
| `double grossRevenue(double)` | Calculates the revenue generated by the `Song` by taking in a price per download and returning the total revenue. <br /> Formula: `revenue = price * _downloads`. <br />See the Function Specification table below for more details. |




**Function Specifications:**

| **Function:** | <tt>Song(string, string, int)</tt><br /> `Song(string title, string artist, int downloads)` |
| **Purpose:** | This parameterized constructor creates a new instance of the `Song` class. <br />- Sets `_title` to `title`. <br />- Sets `_artist` to `artist` <br />Sets `_downloads` to `downloads` |
| **Parameters:** | `string title` - The title of the Song. <br />`string artist` - The artist who sang the Song. <br />`int downloads` - Number of times the songs has been downloaded. |
| **Return Value:** | N/A |
| **Error Handling:** | If the `downloads` count is non-positive, set `_download` to 0. |


**Example:** 

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the class is included

int main() {
    string title = "Aint Got It Like That";
    string artist = "Earl St. Clair";
    int downloads = 5;
    Song new_song = Song( title, artist, downloads );
}


// // Expected Contents of `new_song` Object:
// _title = "Aint Got It Like That"
// _artist = "Earl St. Clair"
// _downloads = 5
{% endhighlight %}





| **Function:** | <tt>double grossRevenue(double)</tt><br /> `double grossRevenue(double price)` |
| **Purpose:** | Calculates the revenue generated by the `Song` using the formula:<br />`revenue = price * _downloads`. |
| **Parameters:** | `int price` - The price per download of a song. |
| **Return Value:** | `double` : Returns a double representing the revenue generated from the `Song` downloads. |
| **Error Handling:** | If the `price` amount is non-positive, do not add or modify any contents, and return `-1`. |


**Example:**

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of the Library class is included

int main() {
    string _title = "Get Schwifty";
    string _artist = "Rick Sanchez";
    int _downloads = 1000;
    double price = 1.1;
    Song new_song = Song(_title, _artist, _downloads);

    cout << fixed << setprecision(2) << new_song.grossRevenue(price) << endl;
}


// // OUTPUT:
// 1100.00
{% endhighlight %}

**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner and paste the Song Class header (`.h` file) and all the implementations (`.cpp` file). Do NOT include your driver file (`main( )`)**





&nbsp;&nbsp;&nbsp;
### College Admission 
*This question may require the use of file streams, logical and relational operators, if-else statements, declaring and calling a function, and processing user input.*

You are part of a college admission board and have been requested to write a program to recommend prospective students for admission based on specific criteria using data from a text file. Each line in the file contains student data in the comma-separated format:

`Student Name, SAT, GPA, Interest, High School Quality, Sem1, Sem2, Sem3, Sem4`


1. **Overall Score Calculation** Use the following formula to calculate each student’s score:
    1. `Score = (0.4 * GPA) + (0.3 * SAT/1600) + (0.2 * High School Quality) + (0.1 * Interest)`
    1. Students with a score of **2.5 or higher** are selected under the "score" criteria.
1. **Outlier Detection** Flag students as "outlier" if the interest is 0 and they have a score of 1.5 or higher.
1. **Grade Improvement Detection** Students are flagged for "grade improvement" if their semester grades show a consistent increase (i.e., `Sem1 < Sem2 < Sem3 < Sem4`) and they have a score of **1.5 or higher**.
1. **Output** For each student, print their name, score (to 6 decimal places), and the criteria ("score", "outlier", or "grade improvement") if applicable. If no criteria are met, print just the name and score.

**Required Functions :**
1. Use your `split( )` function from earlier in the semester, or use streams to achieve this effect.
1. Implement the `processAdmission()` function to handle calculations and criteria checking.
1. Hint: you may use the `to_string` function to convert numbers (int, double) into strings. For example, `string example = to_string(1.0);`. 



**Function Specification :**

| **Function:** | <tt>string processAdmission(string)</tt><br />`string processAdmission(string line)` |
| **Purpose:** | To analyze a student's data, calculate their admission score, and determine whether they meet the criteria for admission based on score, outlier, or grade improvement. |
| **Parameters:** | **string** <tt>line</tt> - A single line of comma-separated student data containing the student’s name, SAT, GPA, interest, high school quality, and semester grades. <br /> Note: we have skipped the header in `main( )`; therefore, you may assume that all `line` that are passed can be parsed (is formatted as expected). |
| **Return Value:** | Returns a string formatted as: <tt>Name,Score,Criteria</tt>. |
| **Error Handling:** | - Flag students as "outlier" if Interest = 0 and the score is 1.5 or higher (and "score" does not apply). <br />- Flag students for "grade improvement" if the grade of each semester is higher than the previous semester and the student has a score of 1.5 or higher (and "outlier" and "score" does not apply). <br />- Assumes valid input format for the line. The function does not handle cases where the line is improperly formatted or contains invalid data types. <br />- The function should not print anything.<br />- if no criteria are met, then the function returns a string formatted as: <tt>Name,Score</tt> |


**Example:**

Note: This is only an example of the function; you need to develop your own main function to fulfill the requirement for this problem.


{% highlight c++ %}
// Assume the proper libraries are included.
// Assume the proper implementation of processAdmission() 
//        and split() is included (if used)

int main(){
    string fileName;
    string line;
    
    cout<<"Enter the file name:"<<endl;
    cin>>fileName;
    
    ifstream file(fileName);
    if(file.is_open()){
        cout << endl << "Results:" <<endl;
        getline(file, line); // Skip header
        while (getline(file, line)){
            cout << processAdmission(line) << endl;
        }
    } else {
        cout<<"Could not open file."<<endl;
    }
    
    return 0;
}

// // Input:
// text8.txt

// // File Content:
// Student,SAT,GPA,Interest,High School Quality,Sem1,Sem2,Sem3,Sem4
// Anne Mutant,1550,3.89,0,9,97,87,97,87
// Ayla Ranefer,1370,4,3,7,85,86,91,95

// // Output:
// Results:
// Anne Mutant,3.646625,score
// Ayla Ranefer,3.556875,score
{% endhighlight %}


 
**For Question 6, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste processAdmission(), split() and any helper function(s) to the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Input:</span>
<p>file-does-not-exist.txt</p>

<span style="color:red">File Content:</span>
<p>// file does not exist</p>

<span style="color:red">Output:</span>
<p>Could not open file.</p>
</div>



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Input:</span>
<p>text.txt</p>

<span style="color:red">File Content:</span>
<p>Student,SAT,GPA,Interest,High School Quality,Sem1,Sem2,Sem3,Sem4</p>
<p>Abbess Horror,1300,3.61,10,7,95,86,91,94</p>
<p>Anastasia Kravinoff,1500,3.74,0,0,92,86,81,90</p>
<p>Adelicia von Krupp,900,4,5,2,88,92,83,72</p>
<p>Anna Frankenstein,1050,2.42,5,4,90,91,93,98</p>

<span style="color:red">Output:</span>
<p>Results:</p>
<p>Abbess Horror,4.087750,score</p>
<p>Anastasia Kravinoff,1.777250,outlier</p>
<p>Adelicia von Krupp,2.668750,score</p>
<p>Anna Frankenstein,2.464875,grade improvement</p>
</div>
 
