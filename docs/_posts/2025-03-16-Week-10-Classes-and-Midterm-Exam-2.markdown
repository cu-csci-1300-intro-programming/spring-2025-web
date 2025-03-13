---
layout: post
title: "Week 10: Classes and Midterm Exam 2"
date: 2025-02-13 09:00:00 -0700
categories: jekyll update
---


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Learn the basics of object oriented programming</li>
    <li>Learn about data members, member functions, and constructors.</li>
  </ol>
</div>


**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: 9.1, 9.2, 9.3, 9.4, 9.5, 9.6
1. Wednesday: 9.5, 9.6, Prepare for midterm exam 2
1. Friday: midterm exam 2 in lecture


&nbsp;&nbsp;&nbsp;&nbsp;
## Background - weeks 7 - 9
By request we have copied the background sections from weeks 7 though 9 here for ease of search in advance of midterm exam 2. 

Week 9 background will be the basis of this weeks lectures as we more deeply explore how to write `class` types and their associated `object`s in C++.

Please also note the following information regarding your upcoming exam for what to prioritiz in your studies:
<ol>
    <li>Nested for loops</li>
    <li>Arrays - definition, initialization, modification, out of bounds errors, partially filled, array algorithms, array operations, array limitations.</li>
    <li>Functions and arrays - pass by reference</li>
    <li>2D arrays - definition, initialization, algorithms, accessing all indices in a 2D array</li>
    <li>File I/O - Opening a file for reading, reading words, lines, chars using <tt>getline</tt> and <tt>>></tt></li>
    <li>Structs - creating, modifying, arrays of structs</li>
    <li>In recitation this week, the TAs will host a practice exam and discuss the solutions.</li>
</ol>

&nbsp;&nbsp;&nbsp;&nbsp;
## Background Week 7

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
&nbsp;&nbsp;&nbsp;&nbsp;
## Background Week 8

&nbsp;&nbsp;&nbsp;
### File Input/Output
So far in class, we've been using the `iostream` standard library. This library has provided us with methods like `cin` and `cout`. `cin` is the method that reads from standard input (i.e. in the terminal via the keyboard) and `cout` is for writing to standard output.

In this background section we'll cover file input, which will allow you to read information from a file and begin creating programs that can be turned off and on while maintaing knowledge of past times it was turned on. To do this, we'll need to include C++'s `fstream` library, which is short for "file stream".


&nbsp;&nbsp;
#### Reading Lines From A File

**Step 0. Include the library.**

A lot of code is needed in secret to get this to work. Just like we have `#include<iostream>` to get `cin` and `cout` for us

{% highlight c++ %}
//
#include<fstream>
{% endhighlight %}

**Step 1. Make a stream object.**

Create an object (a variable) of file stream type. If you want to open a file for reading only, then the `ifstream` object should be used (short for “`i`nput `f`ile `stream`”).

{% highlight c++ %}
// create an `i`nput `f`ile `stream` object
ifstream file_input;
{% endhighlight %}


**Step 2. Open a file.**

Once you have a file stream object, you need to open the file. To do this, use the ifstream object's `open()` method (function), which takes only one parameter: the file name as a string (surrounded by " " if the file name is given directly).

{% highlight c++ %}
// open myTextFile.txt with the file stream object
file_input.open("myTextFile.txt");
{% endhighlight %}

NOTE: this is a common source of bugs in coding with file streams. The `myTextFile.txt` file needs to exist in the same directory as the program that you are running. You can access other directories on the computer by learnign more about "file paths". For now we will not cover it.

**Step 3. Checking for open files.**

It is always good practice to check if the file has been opened properly and take an appropriate action if not. To check if a file was successfully opened, you may use the `fail()` or `is_open()` methods.

`fail()`: This method will return a boolean value true if the file failed to open and false otherwise.


{% highlight c++ %}
if (file_input.fail()) // true when file fails to open
{
    cout << "Could not open file." << endl; 
     // return to terminate the program
     // EXIT_FAILURE to indicate that the program didn't function as expected
     return EXIT_FAILURE;
}
// do things with the file
{% endhighlight %}

`is_open()`: This method will return a boolean value true if the file has successfully opened and false otherwise.

{% highlight c++ %}
if (file_input.is_open()) // true when file opens sucessfully
{
    // do things with the file
}
else
{
    cout << "Could not open file." << endl;        
}
{% endhighlight %}

**Step 4. Read lines from the file.**

To read a line from the file, you can use `getline(file_input, line)` which returns true as long as an additional line has been successfully assigned to the variable line. Once no more lines can be read in, getline returns false. So we can set up a while loop where the condition is the call to getline. 

{% highlight c++ %}
string line = "";
int line_idx = 0;
// get the next line from the file and store in 'line' variable
// continue looping as long as there is data to be processed in the file
while ( getline(file_input, line) )
{

    // print each line read from the file
    cout << line_idx << ": " << line << endl;

    // increment index(count of lines in the file)
    line_idx++;   
}
{% endhighlight %}

`.eof()`: This method will return a boolean value true if all the data in the file was processed and false otherwise.

{% highlight c++ %}
string line = "";
int line_idx = 0;
// continue looping as long as there is data to be processed in the file
while (!file_input.eof()) 
{
    // get the next line from the file and store in 'line' variable
    getline(file_input, line);

    // print each line read from the file
    cout << line_idx << ": " << line << endl;

    // increment index(count of lines in the file)
    line_idx++;   
}
{% endhighlight %}


**Step 5. Closing a file.**

When you are finished processing your files, it is recommended to close all the opened files before the program is terminated. You can do this by using the `.close()` function on your file stream object.

{% highlight c++ %}
// closing the file
file_input.close();
{% endhighlight %}


**Step 6. Putting it all together.**

If we put all the previous steps together, this is the final piece of code we get.

{% highlight c++ %}
#include<iostream>
#include<fstream>
using namespace std;

int main( )
{
    // create an input file stream object
    ifstream file_input;

    // open myTextFile.txt with the file stream object
    file_input.open( "myTextFile.txt" ); 

    // check if file opened successfully
    if ( file_input.fail() )
    {
        cout << "Could not open file." << endl;
        return EXIT_FAILURE;
    }
    
    // since the if returns, we don't need an else...

    // do things with the file
    string line = "";
    int line_idx = 0;

    // read each line from the file
    while ( !file_input.eof() )
    {
        // gets line of text from file_input, stores it in line
        getline( file_input, line );

        // print each line read from the file
        cout << line_idx << ": " << line << endl;

        // increment index (count of lines in the file)
        line_idx++;   
    }

    // closing the file
    file_input.close( );
    return 0;
}
{% endhighlight %}

RECALL: the `open()` function requires a correct path to the file. If the `myTextFile.txt` isn't there then we will see a print out: `Could not open file.`

## Background Week 9

&nbsp;&nbsp;&nbsp;
### File Output
We discussed reading from a file last week. Here, we will show how we can write to a file. First, you define an `ofstream` variable and open the file you would like to write to. Then you can write to the output file using the same operation you used with `cout`, `<<`, and `endl`.

{% highlight c++ %}
    
// Create the output file object
ofstream file_out;
// Opening the output file
file_out.open("output.txt");

// Writing something to the output file
file_out << "writing a sentence to the output file" << endl;

// Writing the value of the variable to the file
string test_string = "you can also write the content of the variable";
file_out << test_string << endl;
file_out.close();
{% endhighlight %}

The output.txt will have the following content:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>writing a sentence to the output file</p>
<p>you can also write the content of the variable</p>
</div>

&nbsp;&nbsp;&nbsp;
### Structs

In C++, we can define a structure using the keyword struct like so:

{% highlight c++ %}
struct State
{
    string name;
    int area;
};  // <-- semicolon after struct definition
{% endhighlight %}

This defines a new type, State, that you can use for declaring variables, e.g.

{% highlight c++ %}
//create a State variable with no name or area
State emptyState;

//create a State variable with a name and area
State colorado{"Colorado", 104094};
{% endhighlight %}

The variables `emptyState` and `colorado` both have two named attributes, called members - `name` and `area`. We can access each member using dot notation, e.g.

{% highlight c++ %}
//set members for empty State
emptyState.name = "Texas";
emptyState.area = 268596;

//get members for colorado
cout << colorado.name << " has an area of " << colorado.area << " square miles." << endl;
{% endhighlight %}

Expected output:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
Colorado has an area of 104094 square miles.
</div>

If we want to compare two structs, we cannot do so directly. Instead, we must compare each data member individually to see if they match, e.g.

{% highlight c++ %}
//check each data member by one
if(colorado.name == emptyState.name && colorado.area == emptyState.area)
{
    cout << "These are the same state!" << endl;
}
else
{
    cout << "These are not the same state!" << endl;
}
{% endhighlight %}

Expected output:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
These are not the same state!
</div>



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
## PreQuiz
There is no prequiz this week

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
In recitation this week, the TAs will host a practice exam and discuss the solutions. There is no submission for this weeks recitation.

&nbsp;&nbsp;&nbsp;&nbsp;
## Midterm Exam 2
Please see canvas announcements and lectures for the time and location of midterm exam 2. Unless you have accommodations, the exam is during your scheduled classtime. Locations vary by course time.