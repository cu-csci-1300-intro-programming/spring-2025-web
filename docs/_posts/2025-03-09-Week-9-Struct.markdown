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
1. Monday: 8.3
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

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
{% include uc.html caption="check back soon for the recitation information" %}

{% comment %}
NOTE for Advait: unsure which recitation you should use. we condensed two week here.

&nbsp;&nbsp;&nbsp;
### Spot The Error
\begin{multipart}
The program is supposed to flip the sign of all the numbers in an array. Identify the error(s) in the code below, and write the correct line(s).
\end{multipart}

{% highlight c++ %}
    #include <iostream>
    #include <string>
    using namespace std;
    
    void flipSign(int numbers[]) 
    {
        for (int i = 0; i < 14; i++) 
        {
            numbers[i] = -1.0 * numbers[i];
        }
        return;
    }
    
    int main()
    {
        const int length = 4;
        int numbers[] = {1, 2, 3, 4};
    
        cout << "The contents of the array before changing: ";
        for (int i = 0; i < length; i++)
        {
            cout << numbers[i] << " ";
        }
        cout << endl;
    
        flipSign(numbers);
    
        cout << "The contents of the array after changing: ";
        for (int i = 0; i < length; i++)
        {
            cout << numbers[i] << " ";
        }
    
        return 0;
    }
{% endhighlight %}

\newpage

\begin{multipart}
The program below reads a file visitors.txt and prints out the busiest day. Each line in the file has the format:

`dayOfWeek <space> visitor1,visitor2,..,visitorN.`

Identify the error(s) in the code below and write the correct line(s).
\end{multipart}

{% highlight c++ %}
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
        cout << days[j] << " is the busiest day of the week at the motel." << endl;
    
        return 0;
    }
{% endhighlight %}

\newpage

\begin{multipart}
 The program appends and prepends underscores for every word in the given message string. Assume the message is maximum 4 words. Identify the error(s) in the code below, and write the correct line(s). Note, `split()` is a function from Homework 5.
\end{multipart}

{% highlight c++ %}
    #include <iostream>
    #include <string>
    #include <cassert>
    using namespace std;
    
    string appendPrepend(string message)
    {
        const int LENGTH = 4;
        string message_fragments[LENGTH] = {};
        string empty_word = "";
        split(message, ' ', message_fragments[], LENGTH) 
        assert(message_fragments[4] == empty_word) 
    
        string answer, word; 
        for(int i == 0; i < LENGTH; i++)
        {
            answer += "_" + message + "_";
        }
        int first_word_length = message_fragments[0].length();
        int second_word_length = message_fragments[1].length();
        assert(message_fragments[1] = answer.substr(first_word_length+3, second_word_length))
    
        return answer;
    }
    
    int main()
    {
        cout << "Please enter the string message:" << endl;
        string message;
        getline(cin, message);
        cout << appendPrepend(message);
    }
{% endhighlight %}

\newpage 

&nbsp;&nbsp;&nbsp;
### Center of Mass

The file `coordinates1.txt` contains a list of comma-separated X, Y and Z coordinates for a given geometric body in each column respectively. Your goal is to find the center of mass of the body by computing the average of the X, the Y and the Z coordinates. In order to do this, you must:

\begin{enumerate}
    1. Read each line in as a string,
    1. Use your `split()` function from Homework 5 to separate each line at the commas,
    1. Use your `validateDouble()` function from Q2 to confirm that the pieces of each line translate into doubles, and then you can use `stod` to translate those valid strings to doubles.
\end{enumerate}

Report the average of your X coordinates, Y coordinates and Z coordinates as your center of mass.

Example output (red is user input):

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
// If file contains two lines: \\
// 3.25,4.19,-3.56 \\
// 1.04,2.31,5.12 \\
The center of mass is at: 2.145, 3.25, 0.78! \\
// 2.145 = (3.25+1.04)/2.0 \\
// 3.25 = (4.19+2.31)/2.0 \\
// 0.78 = (-3.56+5.12)/2.0 \\
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> %THIS ONE IS INCORRECT -- FIX FOR SPRING
// If file contains these lines: \\
// 5.00,0,-0.8 \\
// -3,3.3,-0.75 \\
// 1,-1.0,3.8 \\
// 3.50,0.67,-2 \\
The center of mass is at: 1, 1.65, -0.025!
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
// If file contains these lines: \\
// 0,5.00,-0.8 \\
// -3,3.3,0.75 \\
// abc,-1.0,2.8 \\
Invalid value detected!
</div>

There are several coordinate files included in the week 9 module which you can use to test your code. You can also make your own input files.

\newpage

\begin{multipart}
Write out the steps you would use to solve this problem by hand as pseudocode. 
\end{multipart}

\vspace{10cm}

\begin{multipart}
Write three possible lines you can include in your file to later test your program. Try to pick values that will test different aspects of your program. Follow the steps you wrote for these values to find your result, and verify it.
\end{multipart}

\vspace{5cm}

\begin{multipart}
Implement your solution in C$++$ using VS Code. Revise your solution, save, compile and run it again. Are you getting the expected result and output? Keep revising until you do. Make sure you test for the values used in your sample runs, and for the boundary conditions. Use the coordinates files on github to test your code.
\end{multipart}



&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation
&nbsp;&nbsp;&nbsp;
### Spot the Error
\begin{multipart}
The following code writes a string to the file output.txt. Identify and fix the error.
\end{multipart}

{% highlight c++ %}
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    ofstream file_out;
    file_out.open("output.txt");

    string message = "Hello, World!";
    file_out << message << endl;

    return 0;
}

{% endhighlight %}


\begin{multipart}
The following code intends to write a sentence and a variable's content to a file. Identify and fix the error.
\end{multipart}

{% highlight c++ %}
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    ofstream file_out;
    file_out.open("output.txt");

    string test_string = "C++ file handling is fun!";
    
    file_out("Writing this sentence to the file") << endl;
    file_out(test_string) << endl;

    file_out.close();
    return 0;
}
{% endhighlight %}

\begin{multipart}
The following code should open the file log.txt and write some data into it. Identify and fix the error.
\end{multipart}

{% highlight c++ %}
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    ofstream file_out.open("log.txt");

    string log_message = "This is a log entry.";
    file_out << log_message << endl;

    file_out.close();
    return 0;
}
{% endhighlight %}

\newpage

&nbsp;&nbsp;&nbsp;
### Center of Mass with File Output
For this assignment you should create a coordinates2.txt file with the following contents:
\begin{verbatim}
3.25,4.19,-3.56
1.04,2.31,5.12
abc,2.31,5.12
5.00,0,-0.8
2.35,7.45,1.22
\end{verbatim}


The file `coordinates2.txt` now contains a list of comma-separated X, Y, and Z coordinates for a given geometric body. Your goal is to find the center of mass of the body by computing the average of the X, the Y, and the Z coordinates. Additionally, you are required to log the results and handle invalid data entries using file I/O in C++.

In order to do this, you must:
\begin{enumerate}
    1. Read each line in as a string from the file `coordinates2.txt`.
    1. Use your `split()` function to separate each line at the commas.
    1. Use your `validateDouble()` function to confirm that the pieces of each line translate into valid doubles.
    1. Accumulate the valid X, Y, and Z values to compute the center of mass.
    1. If any line is invalid (e.g., a non-numeric or incomplete coordinate set), log that line into the file `error_log.txt` and continue with the next line.
    1. After processing all lines, calculate and display the center of mass. Additionally, write the center of mass, the number of valid entries, and a completion message to the file `summary.txt`.
\end{enumerate}

Expected contents of each file:
\begin{enumerate}
    1. summary.txt:
    
        1. Write the computed center of mass (average X, Y, and Z).
        1. Write the number of valid coordinate entries processed.
        1. Write a completion message indicating the process was successful.
    
    
    1. error\_log.txt:
    
        1. Log each invalid line (if any) with the message `"Invalid entry: "` followed by the contents of the line.
    
\end{enumerate}

For example, if the file `coordinates2.txt` contains:
\begin{verbatim}
3.25,4.19,-3.56
1.04,2.31,5.12
abc,2.31,5.12
5.00,0,-0.8
\end{verbatim}

The contents of `summary.txt` will be:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
Center of Mass:\\
X: 3.095\\
Y: 2.25\\
Z: 0.92\\

Number of valid entries: 3\\
Process completed successfully!
</div>

The contents of `error_log.txt` will be:
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
Invalid entry: abc,2.31,5.12\\
</div>

If invalid data is found in any line, the program should skip processing that line and log it in `error_log.txt`. The program should still calculate the center of mass from all valid lines. If no valid coordinates are found, write the message `"No valid coordinates processed!"` to `summary.txt` and skip writing the center of mass.

\begin{multipart}
    Write out the steps you would use to solve this problem by hand as pseudocode.
\end{multipart}

\vspace{8cm}

\begin{multipart}
    Write three possible lines you can include in your file to later test your program. Try to pick values that will test different aspects of your program. Follow the steps you wrote for these values to find your result, and verify it.
\end{multipart}

\vspace{5cm}

\begin{multipart}
    Implement your solution in C++ using VS Code. Save, compile, and run it. Test the program with different input files, including boundary conditions.
\end{multipart}

\newpage

{% endcomment %}


&nbsp;&nbsp;&nbsp;&nbsp;
## Homework 7
**Warning: You are not allowed to use global variables for this assignment.**
 
All function names, return types, and parameters must precisely match those shown. You may not use pass by reference or otherwise modify the function prototypes. You are welcome to create additional functions that may help streamline your code. 

All files used in this assignment are in a zipped folder titled <tt>'homework\_7\_input\_files.zip'</tt> located in Canvas under the week 9 module.


&nbsp;&nbsp;&nbsp;
### National Park 
*This question may require the use of file streams, loops, and arrays.* \newline

Write a C++ program to read a file of national park names and print them to the console in the same order as they appear in the file.

{% comment %}

**Note:** There are 63 national parks in the USA, which is why our <tt>MAX\_SIZE</tt> is set to 63. \newline

For this question, the answer box on the coderunner is preloaded with the following solution template. You are only required to fill in the appropriate blanks. Additionally, you may use the <tt>national\_parks\_1.txt</tt> file to test out your code. **All the files used in this assignment, including <tt>national\_parks\_1.txt**, are available in Canvas under week 10 module</tt>. You may also create more files for further testing.
\begin{example}
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
\end{example}

**For Question 1, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and replace the blank with your solution. The answer box is preloaded with the template above.** 

&nbsp;&nbsp;&nbsp;
### Museum Attendance % the file io museum attendance sheet
*This question may require the use of file streams, loops, and arrays.* \newline

Your former high school took students on a museum trip. Before boarding the bus, the teachers made a list of all the students' names. After visiting the museum, the teachers asked the students to board the bus and made a new list of all the students' names. Before leaving, the teachers wanted to compare the two lists to make sure no student was left behind. Write a C++ program to help them do this quickly and easily. Your program compares the two attendance sheets and reports if any student is still inside the museum.

**Note:** The largest file has 24 names; therefore, declare your array with size 30 to ensure it accommodates all test cases.

\newpage
\begin{longtable}{|p{1.7in}|p{4.3in}|}
\hline
**Function:**  <tt>compareAttendanceSheet( string, string)</tt> 
& `void compareAttendanceSheet(string first_attendance_file, ` \newline
`string second_attendance_file)` \\ \hline

**Purpose:** & Given two attendance sheets, the function will compare and print out any individuals who are present in the first sheet but missing in the second. \\ \hline

**Parameters:** & 
**string** <tt>first\_attendance\_file</tt> - The first attendance sheet. \newline
**string** <tt>second\_attendance\_file</tt> - The second attendance sheet.
\\ \hline

**Return Value:** & 
N/A. \\ \hline

**Error Handling:** & 
- If either file does not exist, print ``Failed to open attendance files". \newline
- If a name exists in the second\_attendance\_file, it will also be present in the first\_attendance\_file. In other words, no new names are added to the second\_attendance\_file that were not in the first. \newline
- Hint: The largest file has 24 names; therefore, declare your array with size 30 to ensure it accommodates all test cases.
\\ \hline

**Example:** & 
\begin{example}
{% highlight c++ %}


// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of compareAttendanceSheet() is included.

int main() {
    compareAttendanceSheet("example_1.txt", "example_2.txt");
    return 0;
}
{% endhighlight %}
\end{example}
\\ \hline

**Sample Input:** & 

Sample from example\_1.txt:

\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
Jorden Owen \newline
Waylon Mccoy \newline
Dario Harding \newline
Jameson Odonnell \newline
Andrew Wilkinson
\end{tcolorbox}

Sample from example\_2.txt:
\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
Jorden Owen \newline
Waylon Mccoy \newline
Jameson Odonnell \newline
Andrew Wilkinson 
\end{tcolorbox}
\\ \hline

**Sample Output:** &
Students yet to board the bus are \newline
Dario Harding \newline
\\ \hline
\end{longtable}

**For Question 2, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste compareAttendanceSheet() and any helper function(s) to the answer box!**


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:red">Inputs:</span>
Example\_3.txt: \newline
\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
Anya Garcia \newline
Oliver Jones \newline
Sofia Smith
\end{tcolorbox}

Example\_4.txt:
\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
Anya Garcia \newline
Sofia Smith \newline
Oliver Jones
\end{tcolorbox}

<span style="color:red">Output:</span>

Every student has boarded the bus. It's time to leave.

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<span style="color:red">Inputs:</span>

does\_not\_exist\_1.txt

does\_not\_exist\_2.txt

<span style="color:red">Output:</span>

Failed to open attendance files

</div>

&nbsp;&nbsp;&nbsp;
### Compare Trails % a question that has to use stod and validateInt() or double
*This question may require the use of file streams, split(), loops, and functions* \newline

Today is your first day as a software engineering intern with the National Park Service. You've started on a busy day, and after the initial meetings, your boss asked you to develop a function to print some statistics about some of the long hikes around the world. You've been given a text file, which contains a list of different hikes. Each line includes the name of a long hike, its length (as a whole number) in miles, and its elevation gain (as a whole number) in feet, each separated by the delimiter ``|".

Hint: The split() function from homework 6 could be helpful. 

\begin{longtable}{|p{1.7in}|p{4.3in}|}
\hline
**Function:**  <tt>printHikeStats(string)</tt> 
& `void printHikeStats(string file_name)` \\ \hline

**Purpose:** & Given a text file that contains information on the trails, the function will print the following: \newline
- Number of valid lines read from the file. A valid line must contain exactly three fields: the hike name, length (as an integer), and elevation gain (as an integer). \newline
- Name and the length of the longest hike. \newline
- Name and the length of the shortest hike. \newline
- Name and elevation gain per mile of the steepest hike. This number should be rounded to one decimal point (use setprecision). 
\\ \hline

**Parameters:** & 
**string** <tt>file\_name</tt> - The file name of the text file. 
\\ \hline

**Return Value:** & 
N/A. \\ \hline

**Error Handling:** & 
- If the file does not exist, print ``Could not open file." \newline
- If there is a tie, choose the first one. 
\\ \hline

**Example:** & 
\begin{example}
{% highlight c++ %}


// This is only an example usage, and you should develop your own main function
// Assume the proper libraries are included.
// Assume the proper implementation of printHikeStats() is included.

int main() {
    printHikeStats("long_hikes.txt");
    return 0;
}
{% endhighlight %}
\end{example}
\\ \hline

**Sample Input:** & 
Content of long\_hikes.txt:

\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
The Appalachian Trail|2180|464500 \newline
The South West Coast Path|630|115000 \newline
Continental Divide Trail|3100|457000 \newline
Great Himalayan Trail|1056|289000 \newline
The Colorado Trail|578|89000 \newline
The Pacific Crest Trail|2650|824370 
\end{tcolorbox}
\\ \hline

**Sample Output:** &
Number of lines read: 6. \newline
Longest hike: Continental Divide Trail at 3100 miles. \newline
Shortest hike: The Colorado Trail at 578 miles. \newline
Steepest hike: The Pacific Crest Trail at 311.1 feet gained per mile.
\\ \hline
\end{longtable}

**For Question 3, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste printHikeStats() and any helper function(s) to the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
Content of hikes\_blanks1.txt:

\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
The South West Coast Path|630|115000 \newline
\newline
\newline
Continental Divide Trail|3100|457000 \newline
Great Himalayan Trail|1056|289000 \newline
\newline
\end{tcolorbox}

<span style="color:red">Input</span>:

hikes\_blanks1.txt

<span style="color:red">Output</span>: 

Longest hike: Continental Divide Trail at 3100 miles. \newline
Shortest hike: The South West Coast Path at 630 miles. \newline
Steepest hike: Great Himalayan Trail at 273.7 feet gained per mile. 
</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

<span style="color:red">Input</span>:

file\_does\_not\_exist.txt

<span style="color:red">Output</span>:

Could not open file. 

</div>


&nbsp;&nbsp;&nbsp;
### Restaurant Struct % struct question
*This question may require the use of structs and functions.* \newline

You are tasked with designing a program to evaluate restaurants based on a food quality rating, cleanliness rating, and wait time rating, ultimately providing an overall rating. Write a C++ program to accept the name of a restaurant, its food quality rating (0-10), cleanliness rating (0-10), and wait time rating (0-5). Use a function to calculate the overall rating using the function specification and formula given below:

\begin{equation}
\text{Overall Rating} = 
0.5 \times \text{food quality} + 
0.3 \times \text{cleanliness} + 
0.2 \times \text{wait time}
\end{equation}


You must create a struct named Restaurant with the following attributes: the name of the restaurant, food quality rating, cleanliness rating, wait time rating, and overall rating. 

\begin{center}
\begin{tabular}{|l|l|l|}
    \hline
    **Member Type** & **Member Name** & **Description** \\ \hline
    ****{string} & <tt>name</tt> & Restaurant's name \\ \hline
    ****{int} & <tt>food\_quality</tt> & Restaurant's food quality rating (0-10) \\ \hline
    ****{int} & <tt>cleanliness</tt> & Restaurant's cleanliness rating (0-10) \\ \hline
    ****{int} & <tt>wait\_time</tt> & Restaurant's wait time rating (0-5) \\ \hline
    ****{double} & <tt>overall</tt> & Restaurant's overall rating \\ \hline
\end{tabular}
\end{center}

Next, create a function that will calculate the overall score of each restaurant. 

\newpage

\begin{longtable}{|p{1.7in}|p{4.3in}|}
\hline
**Function:**  <tt>getOverallRating(Restaurant)</tt> 
& `double getOverallRating(Restaurant restaurant)` \\ \hline

**Purpose:** & Given a object of type <tt>Restaurant</tt>, calculate its overall rating. \\ \hline

**Parameters:** & 
**Restaurant** <tt>restaurant</tt> - A <tt>Restaurant</tt> object that contains all the information of the object.
\\ \hline

**Return Value:** & The overall rating of the restaurant. The function should not print anything.
\\ \hline

**Error Handling:** & 
- If any of the ratings in <tt>restaurant</tt> are not within its bound, return -1. The rating bounds are: food quality (0-10), cleanliness (0-10), wait time (0-5) 
\\ \hline

**Example:** & 
\begin{example}
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
\end{example}
\\ \hline

**Sample Output:** &
Restaurant: McDonalds Overall: 5.1
\\ \hline
\end{longtable}

**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste Restaurant struct, getOverallRating(), and any helper function(s) to the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
The sample inputs will be given in the order of name, food quality, cleanliness, and wait time, respectively. \newline
<span style="color:red">Input:</span> 

Aloy Thai \newline
9 \newline
8 \newline
3

<span style="color:red">Output:</span>

Restaurant: Aloy Thai Overall: 6.8

</div>

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
The sample inputs will be given in the order of name, food quality, cleanliness, and wait time, respectively. \newline
<span style="color:red">Input:</span> 

Invalid \newline
2 \newline
3 \newline
-1

<span style="color:red">Output:</span>

Invalid rating(s) entered.

</div>

&nbsp;&nbsp;&nbsp;
### List of Restaurants % the restaurant
*This question may require the use of file streams, split(), loops, arrays, and structs.* \newline

In this question, we will use the same <tt>struct</tt> for <tt>Restaurant</tt> from Question 4. You will be given a file, which contains the name of the restaurant, followed by its food quality, cleanliness rating, and wait time rating, all separated by <tt>\textasciitilde</tt>. The task will be to evaluate the best restaurant from within the list.

&nbsp;&nbsp;
#### Part A:
First, write a function that reads the restaurant details from a file and populates the required array for further analysis. 

Hint: The split() function from homework 6 could be helpful. 

\newpage

\begin{longtable}{|p{1.7in}|p{4.3in}|}
\hline
**Function:**  <tt>readRestaurantDetails( string, Restaurant[], const int)</tt> 
& `int readRestaurantDetails(string filename, Restaurant ` \newline
`restaurant[], const int MAX_RESTAURANTS)` \\ \hline

**Purpose:** & Read all the restaurant details from a given file and calculate the overall rating for all restaurants. \\ \hline

**Parameters:** & 
**string** <tt>filename</tt> - The text file that contains all the details of the restaurants. \newline
**Restaurant[]** <tt>restaurants</tt> - The array that will be populated with all the restaurant objects. \newline
**const int** <tt>MAX\_RESTAURANTS</tt> - The maximum number of restaurants that can be present in the file containing restaurant details. 
\\ \hline

**Return Value:** & If successful (function parameters are correct), return the number of restaurants added to the array. \newline
The function should not print anything. 
\\ \hline

**Error Handling:** & 
- If the file does not exist, -1 is returned. \newline
- If there is an incorrect number of attributes for a given line of the file, skip the line.
\\ \hline

**Example:** & 
\begin{example}
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
\end{example}
\\ \hline

**Sample Output:** &
Restaurant: Wendys Ratings: 6 3 2 Overall: 4.3 \newline
Restaurant: Chick-fil-a Ratings: 9 5 5 Overall: 7 \newline
Restaurant: Snarfburger Ratings: 10 4 3 Overall: 6.8 \newline
Restaurant: Cosmo's Pizza Ratings: 7 3 2 Overall: 4.8
\\ \hline
\end{longtable}

\newpage
&nbsp;&nbsp;
#### Part B:
Then, create a feature where we can find the best restaurant according to your criteria. The possible options are: \newline \newline
Option 1: ``Food Quality" \newline
Option 2: ``Cleanliness" \newline
Option 3: ``Wait Time" \newline
Option 4: ``Overall"

\begin{longtable}{|p{1.7in}|p{4.3in}|}
\hline
**Function:**  <tt>getBest(Restaurant[], int, string)</tt> 
& `int getBest(Restaurant restaurants[], int arr_size, string metric)` \newline
 \\ \hline

**Purpose:** & Given an array, the function will find and return the index of the best restaurant according to the metric. \\ \hline

**Parameters:** & 
**Restaurant[]** <tt>restaurants</tt> - The array that has been populated with the details of all the restaurants. \newline
**int** <tt>arr\_size</tt> - The maximum number of restaurants that are present in the restaurants array. \newline
**string** <tt>metric</tt> - The metric used to find the best restaurant. 
\\ \hline

**Return Value:** & 
If successful (function parameters are correct), return the index of the best restaurant according to the metric. The function should not print anything.
\\ \hline

**Error Handling:** & 
- If the metric is not a valid option (not ``Food Quality," ``Cleanliness," ``Wait Time," or ``Overall"), -1 is returned. \newline
- If the line does not have exactly four attributes—name, food quality, cleanliness, and wait time—skip the line. \newline
- If there is a tie, choose the first one.  \newline
- Note: in this assignment, a higher wait time rating means a shorter wait, which indicates better service. For example, a wait time rating of 5 indicates excellent service with minimal wait. 
\\ \hline

**Example:** & 
\begin{example}
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
\end{example}
\\ \hline

**Sample Output:** &
Restaurant: Snarfburger Ratings: 10 4 3 Overall: 6.8
\\ \hline
\end{longtable}

**For Question 5, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste the Restaurant struct, getOverallRating(), readRestaurantDetails(), getBest(), and any helper function(s) to the answer box!**

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

The content of restaurants\_1.txt:
\begin{tcolorbox}[colframe=blue, colback=white, boxrule=0.5mm, arc=5mm]
Wendys~6~3~2 \newline
Chick-fil-a~9~5~5 \newline
McDonalds~2~2~2~2 \newline
Snarfburger~10~4~3 \newline
Cosmo's Pizza~7~3~2 \newline
Pizza Hut~1~2
\end{tcolorbox}

<span style="color:red">Input</span>:

restaurants\_1.txt \newline
Cleanliness

<span style="color:red">Output</span>:

Restaurant: Chick-fil-a Ratings: 9 5 5 Overall: 7

</div>

{% endcomment %}