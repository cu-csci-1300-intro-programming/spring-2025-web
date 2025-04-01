---
layout: post
title: "Week 14: Midterm Exm 3"
date: 2025-04-01 09:00:00 -0700
categories: jekyll update
---

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
This week you will:
    <ol>
        <li>Complete midterm exam 3</li>
        <li>Begin Project 2</li>
    </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


By request we have copied the relevant background sections from weeks 10 though 13 here for ease of search in advance of midterm exam 3. The exam is comprehensive, so you should study material from weeks 1 - 9 if needed.

We will not cover new content at lecture this week.









&nbsp;&nbsp;&nbsp;
## Readings - Weeks 10 - 13
Please note the following were advised readings of "Brief C++ Late Objects" - Cay Horstmann which are relvant to this exam:
1. 4.10
1. 5.6
1. 6.7
1. 9.1, 9.2, 9.3, 9.4, 9.5, 9.6, 9.9, 9.11

The exam is comprehensive, so you should study readings from weeks 1 - 9 if needed.

This textbook has many well written practice questions for you to explore if you need additional resources for studying.









&nbsp;&nbsp;&nbsp;&nbsp;
## Background - Week 10

&nbsp;&nbsp;&nbsp;
### Classes
When writing complex programs, sometimes the built-in data types (such as int, char, string) don’t offer developers enough functionality or flexibility to solve their problems. A solution is for the developer (you - yes, you!) to create your own custom data types to use, called classes. Classes are user-defined data types, which hold their own data members and member functions, which can be accessed and used by creating an instance of that class. A class is like a blueprint for an object, customized for whatever particular problem the programmer is working on.

String, for example, is a class in C++ which holds data (the characters comprising the string) and supports useful member functions like substr which operate on this data.

Below is an example of the basic definition of a class in C++.

{% highlight c++ %}
class ClassName{
    public:
        //The public interface
        //Member functions

    private:
        //The private data members
}; //must end with a semicolon
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Anatomy of a Class
&nbsp;&nbsp;
#### Class Name
A class is defined in C++ using the keyword `class` followed by the name of the class. The body of the class is defined inside the curly brackets and terminated by a semicolon at the end. This class name will be how you reference any variables or objects you create of that type. For example: 

`ClassName objectName;`

The above line would create a new object (variable) with name `objectName` and of type `ClassName`, and this object would have all the properties that you have defined within the class `ClassName`.

&nbsp;&nbsp;
#### Access Specifiers
Access specifiers in a class are used to set the accessibility of the class members. That is, they restrict access by outside functions to the class members.

Consider the following analogy:

Imagine an intelligence agency like the CIA, that has 10 senior members. Such an organization holds various sorts of information, and needs some way of determining who has access to any given piece of information. Some information concerning classified or dangerous operations may only be accessible to the 10 senior members of the agency, and not directly accessible by any other person. This data would be **private**.

In a class, like in our intelligence agency, these private data members are only accessible by a class's member functions and not directly accessible by any object or function outside the class.

Some other information may be available to anyone who wants to know about it. This is **public** data. Even people outside the CIA can know about it, and the agency might release this information through press releases or other means. In terms of our class, this public data can be accessed by any member function of the class, as well as outside functions and objects, even other classes. The public members of a class can be accessed from anywhere in the program using the direct member access operator (.) with the object of that class.

&nbsp;&nbsp;
#### Data Members and Member Functions
Data members are the data variables and member functions are the functions used to manipulate these variables; together, data members and member functions define the properties and behavior of the objects in a Class.

The data members declared in any class definition can be fundamental data types (like `int`, `char`, `float`, etc.), `arrays`, or even other classes.

For example, for string objects, the data member is a `char array[]` that holds all of the individual letters of your string. Some of a string’s member functions that we have used already are functions like `.substr()` and `.length()`.

&nbsp;&nbsp;
#### Accessing Data Members
Keeping with our intelligence agency example, the code below defines a class that holds information for any general agency. In the main function, we then create a new `IntelligenceAgency` object called `CIA`, and we set its `organizationName` to “CIA” by using the access operator (.) and the corresponding data member’s name. However, we cannot access the `classifiedIntelligence` data member in the same way. Not everyone has access to that private data.

Instead, we need to use a member function of the `IntelligenceAgency` class, `getClassifiedIntelligence()`, in order to see that information. This allows us to control the release of private information by our `IntelligenceAgency`.

Additionally, the main function includes four different ways of creating objects with descriptions in the comments next to it.

{% highlight c++ %}
class IntelligenceAgency
{
    public:
        IntelligenceAgency();         // Default constructor
        IntelligenceAgency(string classified_intelligence_input); // Parameterized constructor  
        string organizationName;
        string getClassifiedIntelligence();
        void setClassifiedIntelligence(string classifiedIntelligenceInput);

    private:
        string classifiedIntelligence;
};

int main()
{
    IntelligenceAgency CIA;
    CIA.organization_name = "CIA";
    cout << CIA.classifiedIntelligence; // gives an error
    cout << CIA.getClassifiedIntelligence();
    
    // four types of constructor calls
    IntelligenceAgency abc; // creating an IntelligenceAgency object with the default constructor 
    IntelligenceAgency xyz = IntelligenceAgency(); // creating an IntelligenceAgency 
    //object with the default constructor 
    IntelligenceAgency pqr("PQR"); // creating an IntelligenceAgency 
    //object with a paramaterized constructor
    IntelligenceAgency rst = IntelligenceAgency("RST"); // creating an IntelligenceAgency 
    //object with a paramaterized constructor
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Defining Member Functions
You may have noticed that we declared various member functions in our class definition, but we did not specify how they will work when called. The body of the function still needs to be written. The solution is to define a function, such as `getClassifiedIntelligence()`, corresponding to our class’s functions. But how does our program know that these functions are the same as the ones we declared in our class? You as the developer need to explicitly tell the computer that these functions you are defining are the same ones you declared earlier.

{% highlight c++ %}
string IntelligenceAgency::getClassifiedIntelligence()
{
    return classifiedIntelligence;
}
void IntelligenceAgency::setClassifiedIntelligence(string classifiedIntelligenceInput)
{
    classifiedIntelligence = classifiedIntelligenceInput;
}
{% endhighlight %}

We start the definition as we do any function, with the return type. Then, we have to add a specifier `IntelligenceAgency::` that lets our program know that this function and the one we declared inside the class are the same. We can see that this function returns the class’ `classifiedIntelligence` to the user.

Functions like `getClassifiedIntelligence()` are called accessor/getter functions. This is because they retrieve or `get’ the private data members of a class object and return it to the program so that these values may be used elsewhere.

The second function, `setClassifiedIntelligence(string classifiedIntelligenceInput)`, is called a mutator/setter function. These allow functions from other parts of our program to modify or ‘set’ the private data members of our class objects. Getters and setters are the functions that our program uses to interact with the private data members of our class objects.

&nbsp;&nbsp;&nbsp;
### Structs and Classes

A class can have a struct as a data member, much like how a class could have any other type of data member. It's important to make sure that the class header file (the .h file) can see the definition of the struct. This can be accomplished by defining the struct inside of the .h file, like below:

{% highlight c++ %}
// filename: example.h
struct State
{
    string name;
    int area;
};                // don't forget the semicolon

class Example
{
    private:
        State my_state_;
        //other data members

    public:
        //setter accepts a State parameter
        void setState(State new_state);

        //getter returns the State member variable
        State getState();

        //other member methods
};
{% endhighlight %}





Any file that includes the .h file shown above will be able to use instances of the State struct, so you will not need to define the State struct anywhere else.

&nbsp;&nbsp;&nbsp;
### When to use Structs vs Classes
While structs and classes are similar, there are some key differences between them. When deciding whether you should use one over the other, consider the functionality you'd like to achieve. A good rule of thumb is to ask whether the data type you're defining will need to have any methods or private variables. If it will, then you should create a class. If all members can be public and there are no methods, then a struct may be better.









&nbsp;&nbsp;&nbsp;&nbsp;
## Background - Week 11
Week 11 was spring break. No backround section available.













&nbsp;&nbsp;&nbsp;&nbsp;
## Background - Week 12
If you have not already, please read <a href="https://cu-csci-1300-intro-programming.github.io/spring-2025-web/jekyll/update/2025/02/13/Week-9-Struct.html#classes">Week 9's background section</a>

&nbsp;&nbsp;&nbsp;
### Header and Source Files
Creating our own classes with various data members and functions increases the complexity of our program. Putting all of the code for our classes as well as the main functionality of our program into one `.cpp` file can become confusing for you as a programmer, and we need ways of reducing the visual clutter that this creates. This is why, as we increase the complexity of a program, we might need to create multiple files: header and source files, which capture the *definition* and *implementation* of the class, respectively.

&nbsp;&nbsp;
#### Header Files

Header files have `.h` as their filename extensions. In a header file, we declare one or more of the complex structures (classes) we want to develop. In a class, we define member functions and member attributes. These functions and attributes are the building blocks of the class.


{% highlight c++ %}
// Example File 0: ClassName.h
#include <iostream> 
using namespace std; 
class ClassName 
{ 
    public: 
    . 
    . 
    . 
    private: 
    . 
    . 
    . 
};
{% endhighlight %}

{% highlight c++ %}
// Example File 1: IntelligenceAgency.h
#include <iostream> 
using namespace std; 
class IntelligenceAgency
{
    public:
        IntelligenceAgency();         // Default constructor
        IntelligenceAgency(string classifiedIntelligenceInput); // Parameterized const
        string organization_name;
        string getClassifiedIntelligence(){return classifiedIntelligence};
        void setClassifiedIntelligence(string classifiedIntelligenceInput)
        {classifiedIntelligence=classifiedIntelligenceInput};

    private:
        string classified_intelligence;
};
{% endhighlight %}



&nbsp;&nbsp;
#### Source File

Source files are recognizable by the `.cpp` extension. In a source file, we implement the class defined in the header file. Since we are splitting the development of actual code for the class into a definition (header file) and an implementation (source file), we need to link the two somehow.

{% highlight c++ %}
//IntelligenceAgency Example
#include "IntelligenceAgency.h"
{% endhighlight %}

Or, more generally,

{% highlight c++ %}
//General Example
#include "ClassName.h"
{% endhighlight %}

In the source file, we will include the header file that defines the class so that the source file is “aware” of where we can retrieve the definition of the class. We must define the class definition in every source that wants to use our user defined data type (our class). When implementing each member function, our source files must tell the compiler that these functions are actually the methods defined in our class definition using the syntax that we showed earlier.


&nbsp;&nbsp;
#### How To Compile Multiple Files

Once you create a project with one or more separate classes, it will be necessary to write multiple files (`.h` and `.cpp`) and test them before submitting them. You need to compile and execute your code using the command line. Make sure that you start by changing directories so that you are in the folder where your solution’s files are stored. In this example, our folder will be called **project2**. To change to this directory, use:

{% highlight bash %}
cd project2/
{% endhighlight %}


When compiling from the command line, you need to specify every `.cpp` file in your project. This means that when you call the g++ compiler, you need to explicitly name the files you’re compiling:

{% highlight bash %}
# short
g++ -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}


The compiling command results in the creation of an executable file. Note that header files (.h) are NOT included in compilation commands. If you did not specify a name for this executable, it will be named `a.out` by default. To execute this file, use the command:

{% highlight bash %}
./a.out
{% endhighlight %}


You can add the \mintinline{bash}{-o} flag to your compiling command to give the output file a name:

{% highlight bash %}
g++ -o myName.out -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}


And then run it with:

{% highlight bash %}
./myName.out
{% endhighlight %}


At this stage, you may also find it helpful to begin compiling with flags that tell you more information about possible errors in your code. These flags include:

{% highlight bash %}
-Wall
{% endhighlight %}


Wall is short for "Warn All", which will turn on most of the warnings in C++. This will help identify various possible ways your code might go wrong, including array bounds errors and other helpful messages.

{% highlight bash %}
-Werror
{% endhighlight %}


Werror will treat all warnings as errors. This will prevent you from skipping past the possible sources of error in your code, and you will need to make sure all warnings are resolved prior to compiling.

{% highlight bash %}
-Wpedantic
{% endhighlight %}


This flag enables warnings that alert you about language constructs that are not ISO C or ISO C++ standard compliant. This is particularly helpful to identify constructs that may not be uniform in other compilers, which could cause problems with your code on other machines. This will help prevent instances where your code works on your personal computer, but does not work on CodeRunner or on the grader's computer. All together, your command line prompt will look something like this:

{% highlight bash %}
-Wsign-compare
{% endhighlight %}

This flag ensures that you don't have issues across machines and their behavior on looping over a string.

{% highlight bash %}
g++ -Wall -Werror -Wpedantic -Wsign-compare -o myName.out -std=c++17 file1.cpp file2.cpp main.cpp
{% endhighlight %}

{% comment %}
%maybe add a section on header guards? 
%add a section on arrays in objects?
{% endcomment %}
















&nbsp;&nbsp;&nbsp;&nbsp;
## Background - Week 13
This weeks background section explores vectors, randomness, and references. This is an important concept for your project. We may not cover it in detail at lecture.



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


&nbsp;&nbsp;&nbsp;
### Function Parameters: Pass By Reference

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




























&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz
There is no prequiz this week

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
TODO

&nbsp;&nbsp;&nbsp;&nbsp;
## Midterm Exam 3
Please see canvas announcements and lectures for the time and location of midterm exam 3. Unless you have accommodations, the exam is during your scheduled classtime. Locations vary by course time.



