---
layout: post
title: "Week 13: Vectors, Randomness, and References"
date: 2025-03-18 09:00:00 -0700
categories: jekyll update
---

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
This week you will:
    <ol>
        <li>Learn what vectors are</li>
        <li>Practice using vectors</li>
        <li>Explore randomness</li>
    </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 4.10, 6.7
1. Wednesday: 6.7
1. Friday: Review content as needed.

&nbsp;&nbsp;&nbsp;&nbsp;
## Background
This weeks background section explores vectors and randomness. These are important concept for your upcoming project.



&nbsp;&nbsp;&nbsp;
### Vectors

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
    <li><texttt>size( )</texttt> return the size of a vector</li>
    <li><texttt>at( )</texttt> takes an integer parameter for index and returns the value at that position</li>
</ol>


Adding elements to the vector is done primarily using two functions

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


`insert()` can add an element at some position in the middle of the vector.


{% highlight c++ %}
// How to use `insert` with vectors:
// vectorName.insert(vectorName.begin() + position, element)
vector1.insert(vector1.begin() + 1, 2);
cout << vector1.at(1) << endl; // 2 is at index=1
// vector1 looks like this: [1, 2, 3, 4]
{% endhighlight %}


Here, the `begin` function returns an iterator to the first element of the vector. Due to the nature of an iterator, this allows for the utility of using `begin()` to refer to the first element and `begin()+k` would refer to the kth element in the vector, starting at 0.

Elements can also be removed.

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


`erase()` can delete a single element at some position, which is shown below using the iterator function of `begin()` to erase the first element of the vector.


{% highlight c++ %}
// How to use `erase()` with vectors:
// vector_name.erase(vector_name.begin() + position)
vector1.erase(vector1.begin() + 0);
cout << vector1.at(0) << endl; //2 is at index=0
// vector1 looks like this: [2, 3, 4]
{% endhighlight %}

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





&nbsp;&nbsp;&nbsp;
### Randomness

Random numbers are a valuable tool for a number of applications, including writing games where we want random chance to be a factor. There are limitations in being able to make a truly random number generator with code, but we have tools to get close enough.

`rand()` function is an inbuilt function in C++ STL, which is defined in header file `<cstdlib>`. `rand()` is used to generate a series of random numbers. The random number is generated by using an algorithm that gives a series of non-related numbers whenever this function is called. The `rand()` function is used in C++ to generate random numbers in the range `[0, RAND_MAX)`.

`RAND_MAX`: It is a constant whose default value may vary between implementations but it is granted to be at least 32767.

The syntax for the function is: `int rand(void);` where `int` is the return type and the parameter list is void (i.e. needs to parameters).

However in order to ensure that the random sequence of numbers is unique each time, we must choose a unique starting seed for the random generator.

`srand()` function is an inbuilt function in C++ STL,  which is defined in `<cstdlib>` header file. `srand()` is used to initialize random number generators. The `srand()` function sets the starting point for producing a series of pseudo-random integers. If `srand()` is not called, the `rand()` seed is set as if `srand(1)` were called at the program start. Any other value for seed sets the generator to a different starting point. 

Here are the two function prototypes for `srand()` to see the syntax:


{% highlight c++ %}
void srand( unsigned seed );
int srand( unsigned int seed);
{% endhighlight %}


Seeds the pseudo-random number generator used by rand() with the value seed.
Parameter **seed**: A seed for a new sequence of pseudo-random numbers to be returned by successive calls to rand()

Return value: This function returns a pseudo-generated random number.

**Note:** The pseudo-random number generator should only be seeded once, before any calls to rand(), and at the start of the program. It should not be repeatedly seeded or reseeded every time you wish to generate a new batch of pseudo-random numbers. 

Standard practice is to use the result of a call to `srand(time(0))` as the seed. However, `time()` returns a `time_t` value which varies every time and hence the pseudo-random number varies for every program call. 

Here are a few examples of using randomness.


{% highlight c++ %}
// A short example to roll a die:
int main( )
{
    //declare variables
    int dieRoll;
    //random seed 
    srand(time(0));

    dieRoll = rand()%6; //randomly generate a number 0 through 5
    dieRoll+=1; //add 1 to make it now store a number 1 through 6

    //printing a random number stored in a variable
    cout << "Our dice roll is " << dieRoll << endl; 

    //printing the random number directly
    cout << "Our D20 rolled " << rand()%20+1 << endl; 
}
{% endhighlight %}



{% highlight c++ %}
// A long example to play Rock, Paper, Scissors:
int main( )
{
    //declare variables
    char userChoice; //to store the user's choice of R, P or S
    int compChoice; //to store the computer's choice
    srand(time(0));

    //ask the user for their choice
    cout << "Rock (R), Paper (P), or Scissors (S)?" << endl;
    cin >> userChoice;

    compChoice = rand()%3; //randomly choose a number 0, 1 or 2

    //Arbitarily choosing that 0 = R, 1 = P, 2 = S for comparison
    switch(userChoice){
        case 'R':
            switch(compChoice){
                case 0: 
                    cout << "Both chose rock-- tie!" << endl;
                    break;
                case 1:
                    cout << "You chose rock, the computer chose ";
                    cout << "paper -- you lose." << endl;
                    break;
                case 2:
                    cout << "You chose rock, the computer chose ";
                    cout << "scissors -- you win!" << endl;
            }
            break;
        case 'P':
            switch(compChoice){
                case 0: 
                    cout << "You chose paper, the computer chose ";
                    cout << "rock -- you win!" << endl;
                    break;
                case 1:
                    cout << "Both chose paper -- tie!" << endl;
                    break;
                case 2:
                    cout << "You chose paper, the computer chose ";
                    cout << "scissors -- you lose." << endl;
            }
            break;
        case 'S':
            switch(compChoice){
                case 0: 
                    cout << "You chose scissors, the computer "; 
                    cout << "chose rock -- you lose." << endl;
                    break;
                case 1:
                    cout << "You chose scissors, the computer "; 
                    cout << "chose paper -- you win!" << endl;
                    break;
                case 2:
                    cout << "Both chose scissors -- tie!" << endl;
            }
            break;
        default:
            cout << "Invalid choice." << endl;
    }

}
{% endhighlight %}























&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz 
{% include uc.html caption='we will have this ready soon' %}

{% comment %}
(due Monday April 7 at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="TODO">Recitation 12 Pre-quiz</a>
</div>
{% endcomment %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
TODO

&nbsp;&nbsp;&nbsp;&nbsp;
## Homework: Code Skeleton

You will need to submit your code skeleton for your final project on Canvas for your homework this week. You should think about your code skeleton as an outline for how you will approach your project. You will need to determine how you are going to break down your code -- an outline for the major sections of your main function and what types of objects and functions will help you make each part.

For your code skeleton you will need:


<ol>
    <li>For each class you create, your .h files should be complete with all the data members and member functions you will be using for each class.</li>
    <li>For the class implementation .cpp files, you should fully implement simple functions like your getters, setters, and constructors. For more complex functions, you can include the function prototype with detailed comments.</li>
    <li>For your game driver, you should have an approximate outline of how you will approach your main function's code. Pseudocode-like comments are fine for this. An example of expected comments is available in the code skeleton assignment on Canvas.</li>
</ol>

