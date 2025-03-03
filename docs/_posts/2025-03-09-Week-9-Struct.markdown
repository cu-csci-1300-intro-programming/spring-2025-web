---
layout: post
title: "Week 9: Structs"
date: 2025-02-13 09:00:00 -0700
categories: jekyll update
---



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Learn how to write to a file</li>
    <li>Learn how to create structs</li>
    <li>Learn how to access data in structs</li>
    <li>Learn how to write functions that use structs</li>
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
1. Monday: 8.3, 7.7
1. Wednesday: 7.7
1. Friday: 7.7, 9.1, 9.2, 9.3



&nbsp;&nbsp;&nbsp;&nbsp;
## Background

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
{% include underConstruction.html caption="check back soon for the prequiz link" %}
{% comment %}
SPWI: TODO
{% endcomment %}

## Recitation

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 1
The program is supposed to square all the numbers in an array. Identify the error(s) in the code below, and write the correct line(s).

```cpp
    #include <iostream>
    #include <string>
    using namespace std;
    
    void FindSquare(int numbers) 
    {
        for (int i = 0; i < 4; i++) 
        {
            numbers[i] *= numbers[i];
        }
        return numbers;
    }
    
    int main()
    {
        const int length = 4;
        int numbers[] = {1, 2, -3, 4};
    
        cout << "The contents of the array before changing: ";
        for (int i = 0; i < length; i++)
        {
            cout << numbers[i] << " ";
        }
        cout << endl;
    
        FindSquare(numbers);
    
        cout << "The contents of the array after changing: ";
        for (int i = 0; i < length; i++)
        {
            cout << numbers[i] << " ";
        }
    
        return 0;
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 2
The Louvre Museum wants to determine its busiest day of the week so it can allocate more staff to assist with guided tours. The museum keeps a log of daily visitors in a file called 'visitors.txt'. Each line in the file has the following format:

`dayOfWeek <space> visitor1,visitor2,..,visitorN.`

Identify the error(s) in the code below and write the correct line(s).

```cpp
    #include <iostream>
    #include <string>
    using namespace std;
    
    int main()
    {
        ifstream my_file("visitors.txt"); 
        string full_line;
        string days[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
        int vis[5] = {0, 0, 0, 0, 0}; 
        int i = 0;
        int traffic = 0;
        int j = 0;
    
        while (getline(my_file, full_line))
        {
            for(int i = 0; i < static_cast<int>(full_line.length()); i+=1) 
            {
                if(full_line[i] == ' ' && i < static_cast<int>(full_line.length())-1)
                {
                    visitors[i]++;
                }
                if(full_line[i] == ",") 
                {
                    visitors[i]++;
                }
            }
            if (visitors[i] < traffic) 
            {
                traffic = visitors[i];
                j = i;
            }
            i++;
        }
        cout << days[j] << " is the busiest day of the week at the mueseum." << endl;
    
        return 0;
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 3
The program appends and prepends underscores for every word in the given message string. Assume the message is maximum 4 words. Identify the error(s) in the code below, and write the correct line(s). split() is a function from last week's Homework.

```cpp
    #include <iostream>
    #include <string>
    #include <cassert>
    using namespace std;
    
    string appendPrepend(string message)
    {
        const int LENGTH = 4;
        string message_fragments[LENGTH] = {};
        string empty_word = "";
        split(message, ' ', message_fragments[], LENGTH);
        assert(message_fragments[4] == empty_word);
    
        string answer, word; 
        for(int i = 0; i < LENGTH; i++)
        {
            answer += "_" + message + "_";
        }
        int first_word_length = message_fragments[0].length();
        int second_word_length = message_fragments[1].length();
        assert(message_fragments[1] == answer.substr(first_word_length+3, second_word_length));
    
        return answer;
    }
    
    int main()
    {
        cout << "Please enter the string message:" << endl;
        string message;
        getline(cin, message);
        cout << appendPrepend(message);
    }
```
&nbsp;&nbsp;&nbsp;
### Recitation Midterm Averages- Problem 4

The file 'midterms.txt' contains a list of comma-separated scores for three midterms taken by each student in a class. Each line represents one student’s scores for all three midterms. Your task is to compute the average score for each midterm across all students.

To complete this task, you must:

    1. Read each line in as a string,
    2. Use your `split()` function from previous homework to separate each line at the commas,
    3. Use the provided `validateDouble()` function to confirm that the pieces of each line translate into doubles, and then you can use `stod` to translate those valid strings to doubles.

Examples runs:

If the file contains the following lines:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:red;"> 85.5,90.2,78.6 </strong></p>
<p><strong style="color:red;"> 92.0,88.5,79.8 </strong></p>
</div>

Expected output:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:Green;"> The average scores per midterm are: </strong></p>
<p><strong style="color:Green;"> Midterm 1: 88.75 </strong></p>
<p><strong style="color:Green;"> Midterm 2: 89.35 </strong></p>
<p><strong style="color:Green;"> Midterm 3: 79.2 </strong></p>
</div>

If the file contains the following lines:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:red;">  100,98.2,95 </strong></p>
<p><strong style="color:red;">  85.5,88,90 </strong></p>
<p><strong style="color:red;">  75.5,85.2,80 </strong></p>
</div>

Expected output:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:Green;"> The average scores per midterm are: </strong></p>
<p><strong style="color:Green;"> Midterm  1: 87.0 </strong></p>
<p><strong style="color:Green;"> Midterm  2: 90.47 </strong></p>
<p><strong style="color:Green;"> Midterm  3: 88.33 </strong></p>
</div>

If the file contains the following lines:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:red;"> 85.5,abc,78 </strong></p>
<p><strong style="color:red;"> 90,88.5,79.8 </strong></p>
</div>

Expected output:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><strong style="color:Green;"> Invalid value detected in Student 1’s scores! </strong></p>
</div>

#### Recitation Midterm Averages- Problem 4.a. : Algorithm
Write out the steps you would use to solve this problem by hand as pseudocode. 

#### Recitation Midterm Averages- Problem 4.a. : Implementation
Translate your pseudocode into a C++ program to solve the above code, verify that your program works as expected.

Helper function:
```cpp
bool validateDouble(string input){
    //if the string is empty return false
    if (input.length() == 0){
        return false;
    }
    
    //the string must have at least one numerical digit, but it can also start with a minus sign
    //it can have up to one decimal
    
    int numDecimals = 0;
    bool seenDigit = false;
    
    //if the string is longer than 1, the first character can be a digit or a minus sign
    switch(input[0]){
        case '-':
            break;
        
        case '.':
            numDecimals++;
            break;

        default:
            if (isdigit(input[0])){
                seenDigit = true;
            }else{
                return false;
            }
    }

    //check if all other digits are valid for index 1 through the end
    for (int i = 1; i < (int)input.length(); i++){
        if (input[i] == '.'){ //if the character isn't a number return false
            numDecimals++;
        }else if (isdigit(input[i])){
            seenDigit = true;
        }else{
            return false;
        }
    }
    
    if (numDecimals > 1)
        return false;
    
    return seenDigit;
}
```

&nbsp;&nbsp;&nbsp;&nbsp;
## Homework 7
**Warning: You are not allowed to use global variables for this assignment.**
 
All function names, return types, and parameters must precisely match those shown. You may not use pass by reference or otherwise modify the function prototypes. You are welcome to create additional functions that may help streamline your code. 

All files used in this assignment are in a zipped folder titled '<a targe="_blank" el="nofollow noopener noreferrer" href="https://github.com/cu-csci-1300-intro-programming/spring-2025-web/blob/main/docs/assets/zips/homework_7_input_files.zip">homework_7_input_files.zip</a>' also located in Canvas under the week 9 module.


&nbsp;&nbsp;&nbsp;
### National Park 
*This question may require the use of file streams, loops, and arrays.*

Write a C++ program to read a file of national park names and print them to the console in the same order as they appear in the file.


**Note:** There are 63 national parks in the USA, which is why our <tt>MAX\_SIZE</tt> is set to 63. \newline

For this question, the answer box on the coderunner is preloaded with the following solution template. You are only required to fill in the appropriate blanks. Additionally, you may use the <tt>national\_parks\_1.txt</tt> file to test out your code. **All the files used in this assignment, including <tt>national\_parks\_1.txt**, are available in Canvas under week 10 module</tt>. You may also create more files for further testing.


{% highlight c++ %}
#include <iostream>
#include <fstream>

using namespace std;

void listNationalParks(string filename)
{
    // initialize variables
    ifstream file_in(filename); // opens a file

    if (file_in.fail())
    {
        cout << "Failed to open file." << endl;
        return;
    }

    const int MAX_SIZE = 63;
    string parks[MAX_SIZE];

    string park;

    int idx = 0;

    // Fill in the blank below with code to read from the file into the 'park' variable
    _______________________________
    {
        parks[idx] = park;
        idx += 1;

        // Fill in the blank below with code to check if you are trying to store more values 
        // than possible in the parks array
        __________________________
        {
            break;
        }

    }

    for (int i = 0; i < idx; ++i)
    {
        cout << i << ": " << parks[i] << endl;
    }

    file_in.close();
}

int main()
{
    string filename;
    cout << "Enter national parks filename" << endl;
    cin >> filename;
    listNationalParks(filename);
    return 0;
}
{% endhighlight %}


**For Question 1, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and replace the blank with your solution. The answer box is preloaded with the template above.** 


&nbsp;&nbsp;&nbsp;
### Museum Attendance 
*This question may require the use of file streams, loops, and arrays.* 

Your former high school took students on a museum trip. Before boarding the bus, the teachers made a list of all the students' names. After visiting the museum, the teachers asked the students to board the bus and made a new list of all the students' names. Before leaving, the teachers wanted to compare the two lists to make sure no student was left behind. Write a C++ program to help them do this quickly and easily. Your program compares the two attendance sheets and reports if any student is still inside the museum.

**Note:** The largest file has 24 names; therefore, declare your array with size 30 to ensure it accommodates all test cases.


{% highlight c++ %}
void compareAttendanceSheet( string first_attendance_file, 
                             string second_attendance_file )
{
    // ...
}
{% endhighlight %}

| **Function:** | <tt>compareAttendanceSheet( string, string )</tt> |
| **Purpose:** | Given two attendance sheets, the function will compare and print out any individuals who are present in the first sheet but missing in the second. |
| **Parameters:** | **string** <tt>first\_attendance\_file</tt> - The first attendance sheet. <br /> **string** <tt>second\_attendance\_file</tt> - The second attendance sheet. |
| **Return Value:** | N/A. |
| **Error Handling:** | - If either file does not exist, print "Failed to open attendance files". <br />- If a name exists in the `second_attendance_file`, it will also be present in the `first_attendance_file`. In other words, no new names are added to the `second_attendance_file` that were not in the first. <br />- Hint: The largest file has 24 names; therefore, declare your array with size 30 to ensure it accommodates all test cases. |


**Example:** 
{% highlight c++ %}
// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of compareAttendanceSheet() is included.

int main() {
    compareAttendanceSheet("example_1.txt", "example_2.txt");
    return 0;
}
{% endhighlight %}



**Sample Input:**  

Sample from example\_1.txt:
{% highlight txt %}

{% endhighlight %}


Sample from example\_2.txt:
{% highlight txt %}

{% endhighlight %}


**Sample Output:** 
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p><span style="color:green">Inputs:</span></p>
<br />
<p><span style="color:red">Example_1.txt:</span></p>
<p><span style="color:red">Jorden Owen</span></p>
<p><span style="color:red">Waylon Mccoy</span></p>
<p><span style="color:red">Dario Harding</span></p>
<p><span style="color:red">Jameson Odonnell</span></p>
<p><span style="color:red">Andrew Wilkinson</span></p>
<br />
<p><span style="color:red">Example_2.txt:</span></p>
<p><span style="color:red">Jorden Owen</span></p>
<p><span style="color:red">Waylon Mccoy</span></p>
<p><span style="color:red">Jameson Odonnell</span></p>
<p><span style="color:red">Andrew Wilkinson </span></p>
<br />

<p><span style="color:green">OUTPUT:</span></p>
<p>Students yet to board the bus are</p>
<p>Dario Harding</p>
</div>


**For Question 2, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste compareAttendanceSheet() and any helper function(s) to the answer box!**



<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:green">Inputs:</span>
<br />
<p><span style="color:red">Example_3.txt:</span></p>
<p><span style="color:red">Anya Garcia</span></p>
<p><span style="color:red">Oliver Jones</span></p>
<p><span style="color:red">Sofia Smith</span></p>
<br />
<p><span style="color:red">Example_4.txt:</span></p>
<p><span style="color:red">Anya Garcia</span></p>
<p><span style="color:red">Sofia Smith</span></p>
<p><span style="color:red">Oliver Jones</span></p>
<br />
<p><span style="color:green">Output:</span></p>
<p>Every student has boarded the bus. It's time to leave.</p>
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:green">Inputs:</span>
<br />
<p><span style="color:red">does_not_exist_1.txt</span></p>
<br />
<p><span style="color:red">does_not_exist_2.txt</span></p>
<br />
<span style="color:green">Output:</span>
<p>Failed to open attendance files</p>
</div>

&nbsp;&nbsp;&nbsp;
### Compare Trails 
{% comment %}
a question that has to use stod and validateInt() or double
{% endcomment %}

*This question may require the use of file streams, split(), loops, and functions* 

Today is your first day as a software engineering intern with the National Park Service. You've started on a busy day, and after the initial meetings, your boss asked you to develop a function to print some statistics about some of the long hikes around the world. You've been given a text file, which contains a list of different hikes. Each line includes the name of a long hike, its length (as a whole number) in miles, and its elevation gain (as a whole number) in feet, each separated by the delimiter `|`.

Hint: Your `split( )` function from homework 6 could be helpful. 

| **Function:** | <tt>printHikeStats(string)</tt>  <br /> `void printHikeStats(string file_name)` |
| **Purpose:** | Given a text file that contains information on the trails, the function will print the following:<br />- Number of valid lines read from the file. A valid line must contain exactly three fields: the hike name, length (as an integer), and elevation gain (as an integer).<br />- Name and the length of the longest hike.<br />- Name and the length of the shortest hike.<br />- Name and elevation gain per mile of the steepest hike. This number should be rounded to one decimal point (use setprecision). |
| **Parameters:** | **string** <tt>file\_name</tt> - The file name of the text file. |
| **Return Value:** | N/A. |
| **Error Handling:** | - If the file does not exist, print ``Could not open file." <br />- If there is a tie, choose the first one.  |


**Example:** 
{% highlight c++ %}
// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of printHikeStats() is included.

int main() {
    printHikeStats("long_hikes.txt");
    return 0;
}
{% endhighlight %}


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:green">INPUT:</span>
<p><span style="color:red">Content of long_hikes.txt:</span></p>
<p><span style="color:red">The Appalachian Trail|2180|464500</span></p>
<p><span style="color:red">The South West Coast Path|630|115000</span></p>
<p><span style="color:red">Continental Divide Trail|3100|457000</span></p>
<p><span style="color:red">Great Himalayan Trail|1056|289000</span></p>
<p><span style="color:red">The Colorado Trail|578|89000 </span></p>
<p><span style="color:red">The Pacific Crest Trail|2650|824370 </span></p>
<br />
<span style="color:green">OUTPUT:</span>
<p>Number of lines read: 6.</p>
<p>Longest hike: Continental Divide Trail at 3100 miles.</p>
<p>Shortest hike: The Colorado Trail at 578 miles.</p>
<p>Steepest hike: The Pacific Crest Trail at 311.1 feet gained per mile.</p>
</div>

**For Question 3, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste printHikeStats() and any helper function(s) to the answer box!**


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:green">INPUT:</span>
<p><span style="color:red">Content of hikes_blanks1.txt:</span></p>
<p><span style="color:red">The South West Coast Path|630|115000 </span></p>
<br />
<br />
<p><span style="color:red">Continental Divide Trail|3100|457000 </span></p>
<p><span style="color:red">Great Himalayan Trail|1056|289000</span></p>
<br />
<span style="color:green">Output</span>: 
<p>Longest hike: Continental Divide Trail at 3100 miles.</p>
<p>Shortest hike: The South West Coast Path at 630 miles.</p>
<p>Steepest hike: Great Himalayan Trail at 273.7 feet gained per mile.</p>
</div>


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<p><span style="color:green">Input:</span></p>

<p><span style="color:red">file_does_nots_exist.txt</span></p>

<p><span style="color:green">Output:</span></p>

<p>Could not open file. </p>
</div>


&nbsp;&nbsp;&nbsp;
### Restaurant Struct 
{% comment %} 
struct question
{% endcomment %}

*This question may require the use of structs and functions.* 

You are tasked with designing a program to evaluate restaurants based on a food quality rating, cleanliness rating, and wait time rating, ultimately providing an overall rating. Write a C++ program to accept the name of a restaurant, its food quality rating (0-10), cleanliness rating (0-10), and wait time rating (0-5). Use a function to calculate the overall rating using the function specification and formula given below:

{% highlight c++ %}
// Overall Rating =   0.5 * food_quality 
//                  + 0.3 * cleanliness 
//                  + 0.2 * wait_time
{% endhighlight %}


You must create a struct named Restaurant with the following attributes: the name of the restaurant, food quality rating, cleanliness rating, wait time rating, and overall rating. 


| **Member Type** | **Member Name** | **Description** |
| `string` | <tt>name</tt> | Restaurant's name |
| `int` | <tt>food\_quality</tt> | Restaurant's food quality rating (0-10) |
| `int` | <tt>cleanliness</tt> | Restaurant's cleanliness rating (0-10) |
| `int` | <tt>wait\_time</tt> | Restaurant's wait time rating (0-5) |
| `double` | <tt>overall</tt> | Restaurant's overall rating |



Next, create a function that will calculate the overall score of each restaurant.

| **Function:**  | <tt>getOverallRating(Restaurant)</tt>  <br /> `double getOverallRating(Restaurant restaurant)` |
| **Purpose:** | Given a object of type <tt>Restaurant</tt>, calculate its overall rating. |
| **Parameters:** | **Restaurant** <tt>restaurant</tt> <br />- A <tt>Restaurant</tt> object that contains all the information of the object.|
| **Return Value:** | The overall rating of the restaurant. The function should not print anything. |
| **Error Handling:** | - If any of the ratings in <tt>restaurant</tt> are not within its bound, return -1. The rating bounds are: food quality (0-10), cleanliness (0-10), wait time (0-5) |



**Example:** 
{% highlight c++ %}
// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of getOverallRating() and Restaurant struct is included.

int main() {
    Restaurant r; 
    r.name = "McDonalds";
    r.food_quality = 4;
    r.cleanliness = 7;
    r.wait_time = 5;

    r.overall = getOverallRating(r);

    if(r.overall == -1)
    {
        cout << "Invalid rating(s) entered." << endl;
    }
    else
    {
        cout << "Restaurant: " << r.name << " Overall: " << r.overall << endl;
    }
    return 0;
}
{% endhighlight %}



**Sample Output:** 
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Restaurant: McDonalds Overall: 5.1</p>
</div>

**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste Restaurant struct, getOverallRating(), and any helper function(s) to the answer box!**


The sample inputs will be given in the order of name, food quality, cleanliness, and wait time, respectively.
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:green">Input:</span> 
<p><span style="color:red">Aloy Thai</span></p>
<p><span style="color:red">9</span></p>
<p><span style="color:red">8</span></p>
<p><span style="color:red">3</span></p>
<br />
<p><span style="color:green">Output:</span></p>
<p>Restaurant: Aloy Thai Overall: 6.8</p>
</div>


The sample inputs will be given in the order of name, food quality, cleanliness, and wait time, respectively. \newline
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:green">Input:</span> 
<p><span style="color:red">Invalid</span></p>
<p><span style="color:red">2</span></p>
<p><span style="color:red">3</span></p>
<p><span style="color:red">-1</span></p>
<br />
<p><span style="color:green">Output:</span></p>
<p>Invalid rating(s) entered.</p>
</div>


&nbsp;&nbsp;&nbsp;
### List of Restaurants 
{% comment %} 
the restaurant 
{% endcomment %}

*This question may require the use of file streams, split(), loops, arrays, and structs.*

In this question, we will use the same <tt>struct</tt> for <tt>Restaurant</tt> from Question 4. You will be given a file, which contains the name of the restaurant, followed by its food quality, cleanliness rating, and wait time rating, all separated by `~` The task will be to evaluate the best restaurant from within the list.


&nbsp;&nbsp;
#### Part A:
First, write a function that reads the restaurant details from a file and populates the required array for further analysis. 

Hint: The `split( )` function from homework 6 could be helpful. 

{% highlight c++ %}
int readRestaurantDetails( string filename, 
                           Restaurant restaurant[], 
                           const int MAX_RESTAURANTS )
{
    // ...
}
{% endhighlight %}


| **Function:**  | <tt>readRestaurantDetails( string, Restaurant[], const int )</tt> |
| **Purpose:** | Read all the restaurant details from a given file and calculate the overall rating for all restaurants. |
| **Parameters:** | **string** <tt>filename</tt> - The text file that contains all the details of the restaurants. <br />**Restaurant[]** <tt>restaurants</tt> - The array that will be populated with all the restaurant objects. <br />**const int** <tt>MAX\_RESTAURANTS</tt> - The maximum number of restaurants that can be present in the file containing restaurant details. |
| **Return Value:** | If successful (function parameters are correct), return the number of restaurants added to the array. <br /> The function should not print anything. |
| **Error Handling:** |- If the file does not exist, -1 is returned. <br />- If there is an incorrect number of attributes for a given line of the file, skip the line.|

**Example:** 
{% highlight c++ %}
// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of readRestaurantDetails(), getOverallRating(), and Restaurant struct is included.

int main()
{
    Restaurant restaurants[30];

    int res_size = readRestaurantDetails("restaurants.txt", restaurants, 30);

    // Checking if the file was opened correctly
    if (res_size == -1)
    {
        cout << "Failed to open file." << endl;
    }
    else
    {
        for (int i = 0; i < res_size; ++i) {
            cout << "Restaurant: " << restaurants[i].name << " ";
            cout << "Ratings: ";
            cout << restaurants[i].food_quality << " ";
            cout << restaurants[i].cleanliness<< " ";
            cout << restaurants[i].wait_time << " ";
            cout << "Overall: ";
            cout << restaurants[i].overall << " ";
            cout << endl;
        }
    }
}
{% endhighlight %}

**Sample Output:**
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Restaurant: Wendys Ratings: 6 3 2 Overall: 4.3</p>
<p>Restaurant: Chick-fil-a Ratings: 9 5 5 Overall: 7</p>
<p>Restaurant: Snarfburger Ratings: 10 4 3 Overall: 6.8</p>
<p>Restaurant: Cosmo's Pizza Ratings: 7 3 2 Overall: 4.8</p>
</div>


&nbsp;&nbsp;
#### Part B:
Then, create a feature where we can find the best restaurant according to your criteria. The possible options are:

<ul>
    <li>Option 1: "Food Quality"</li>
    <li>Option 2: "Cleanliness"</li>
    <li>Option 3: "Wait Time"</li>
    <li>Option 4: "Overall"</li>
</ul>


{% highlight c++ %}
int getBest( Restaurant restaurants[], 
             int arr_size, 
             string metric )
{
    // ...
}
{% endhighlight %}


| **Function:**  | <tt>getBest(Restaurant[], int, string)</tt> |
| **Purpose:** | Given an array, the function will find and return the index of the best restaurant according to the metric. |
| **Parameters:** | **Restaurant[]** <tt>restaurants</tt> - The array that has been populated with the details of all the restaurants. <br />**int** <tt>arr\_size</tt> - The maximum number of restaurants that are present in the restaurants array. <br /> **string** <tt>metric</tt> - The metric used to find the best restaurant. |
| **Return Value:** | If successful (function parameters are correct), return the index of the best restaurant according to the metric. The function should not print anything.|
| **Error Handling:** | - If the metric is not a valid option (not "Food Quality," "Cleanliness," "Wait Time," or "Overall"), -1 is returned. <br /> - If the line does not have exactly four attributes—name, food quality, cleanliness, and wait time—skip the line. <br /> - If there is a tie, choose the first one.  <br /> - Note: in this assignment, a higher wait time rating means a shorter wait, which indicates better service. For example, a wait time rating of 5 indicates excellent service with minimal wait. |

**Example:**
{% highlight c++ %}
// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of getBest(), readRestaurantDetails(), getOverallRating(), and Restaurant struct is included.

int main()
{
    Restaurant restaurants[30];

    int arr_size = readRestaurantDetails("restaurants.txt", restaurants, 30);

    // Checking if the file was opened correctly
    if (arr_size == -1)
    {
        cout << "Failed to open file." << endl;
    }
    else if (arr_size == 0)
    {
        cout << "Empty file." << endl;
    }
    else
    {
        int idx = getBest(restaurants, arr_size, "Food Quality");

        if (idx == -1)
        {
            cout << "Invalid metric." << endl;
        }
        else
        {
            cout << "Restaurant: " << restaurants[idx].name << " ";
            cout << "Ratings: ";
            cout << restaurants[idx].food_quality << " ";
            cout << restaurants[idx].cleanliness << " ";
            cout << restaurants[idx].wait_time << " ";
            cout << "Overall: ";
            cout << restaurants[idx].overall << " ";
            cout << endl;
        }
    }
}
{% endhighlight %}

**Sample Output:**
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Restaurant: Snarfburger Ratings: 10 4 3 Overall: 6.8</p>
</div>

**For Question 5, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste the Restaurant struct, getOverallRating(), readRestaurantDetails(), getBest(), and any helper function(s) to the answer box!**


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<p>The content of restaurants_1.txt:</p>
<p>Wendys~6~3~2</p>
<p>Chick-fil-a~9~5~5</p>
<p>McDonalds~2~2~2~2</p>
<p>Snarfburger~10~4~3</p>
<p>Cosmo's Pizza~7~3~2</p>
<p>Pizza Hut~1~2</p>
<br />
<span style="color:green">Input</span>:
<p><span style="color:red">restaurants_1.txt</span></p>
<p><span style="color:red">Cleanliness</span></p>
<br />
<span style="color:green">Output</span>:
<p>Restaurant: Chick-fil-a Ratings: 9 5 5 Overall: 7</p>
</div>
