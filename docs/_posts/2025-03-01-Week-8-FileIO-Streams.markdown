---
layout: post
title: "Week 8: File I/O (streams)"
date: 2025-02-12 09:00:00 -0700
categories: jekyll update
---


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #31708f; background-color: #d9edf7; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
  <b>By the end of this week, you will be able to:</b>
  <ol>
    <li>Learn how to open file streams</li>
    <li>Learn how to read files line by line</li>
    <li>Learn how to use get/unget</li>
  </ol>
</div>

**CONTENTS:**
* Do not remove this line (it will not be displayed)
{:toc}

&nbsp;&nbsp;&nbsp;&nbsp;
## Readings
Please note the advised readings of "Brief C++ Late Objects" - Cay Horstmann:
1. Monday: Review chapter 6 as needed
1. Wednesday: 8.1, 8.2
1. Friday: 8.2

&nbsp;&nbsp;&nbsp;&nbsp;
## Background

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
    myTextFile.close( );
    return 0;
}
{% endhighlight %}

RECALL: the `open()` function requires a correct path to the file. If the `myTextFile.txt` isn't there then we will see a print out: `Could not open file.`



&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz
 {% include uc.html caption='check back later' %}

<!-- (due unkown at 9am)
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

Please complete your "pre-quiz" for the week on Canvas. This is due Monday morning at 9am. Here is a link to the quiz for Spring 2025: <a href="TODO">Recitation TODO Pre-quiz</a>
</div> -->

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 1
The program below intends to prints average of the scores. Identify the error(s) in the code below, and write the correct line(s).

```cpp
    #include <iostream>
    #include <string> 
    using namespace std;
    int main()
    {
        int size = 6;
        double scores[size] = {85.4, 90.3, 100, 89, 74.5, 95.0, 82.3};
        double sum = 0;
        for(int i = 0; i < size; i++)
        {
            sum += scores[i];
        }
        int avg = sum / 6.0;
        cout << "Average = " << avg << endl;
        return 0; 
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 2
The program below displays transpose of a given matrix. The transpose of a matrix is simply a flipped version of the original matrix by switching its rows with its columns. Identify the error(s) in the code below, and write the correct line(s).

```cpp
    #include <iostream>
    using namespace std;
    
    // Function to calculate the transpose of a matrix
    double transposeMatrix(int matrix[][3], int n, int m) 
    { 
        for (int i = 0; i < n; i++)
        {
            for (int j = i + 1; j < m; j++)
            {
                temp = matrix[i][j];
                matrix[i][j] = matrix[j][i];
                matrix[j][i] = temp;
            }
        }
        return matrix;
    } 
    
    int main() 
    {
        const int rows = 3;
        const int cols = 3;
        int originalMatrix[rows][cols] = 
        {
            {1, 1, 1},
            {2, 2, 2},
            {3, 3, 3}
        };
    
        // Calculate the transpose matrix using the function
        int result[rows][cols] = transposeMatrix(originalMatrix[3][3], rows, cols);
    
        // Display the transpose matrix
        cout << "Transpose Matrix:" << endl;
        for (int i = 0; i < rows; i++) 
        {
            for (int j = 0; j < cols; j++) 
            {
                cout << result[i][j] << " ";
            }
            cout << endl;
        }
    
        return 0;
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 3
The program below tries to print all the items specified in the item array. Identify the error(s) in the code below, and write the correct line(s).

```cpp
    #include <iostream>
    using namespace std;
    
    int main()
    {
        int N = 3;
        char item[] = {"book", "pen", "pencil", "eraser"};
    
        //printing all the items
        for (int i = 0; i < N; i++)
        {
            cout << "The item list has " << items[j] << endl;
        }
        return 0;
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error- Problem 4
The program below prints the strings that have length equal to 4. Identify the error(s) in the code below, and write the correct line(s).

```cpp
    #include <iostream>
    #include <string>
    using namespace std;
    
    int main() 
    {
        const int N = 6;
        string animals[N] = {"lion", "cat", "bear", "dog", "elephant", "fox"};
        for (int i = 0; i < N; i++) 
        {
            if (animals.length()[i] == 4)
            {
                cout << animals[i] << endl;
            }
        }
        return 0;
    }
```

&nbsp;&nbsp;&nbsp;
### Recitation Matrix Sum - Problem 5
The sum of two matrices is found by adding together corresponding entries in each matrix, as shown above. (For example, the numbers at (row 1, column 1) of each matrix are added together to get the (row 1, column 1) number of the sum matrix.)

Write a function that accepts two 2x3 integer arrays as input parameters and displays the sum matrix (displayed in 2 rows). Example header:

`void matrixSum(int a[2][3], int b[2][3])`

Then, create a main() function that asks the user to input the values for each matrix one row at a time. Store these in two arrays, and pass them to matrixSum. Example output (red is user input)

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Enter values for matrix 1, one row at a time:</p>
<p><strong style="color:red;">1 2 3</strong></p>
<p><strong style="color:red;">4 5 6</strong></p>
Enter values for matrix 2, one row at a time:
<p><strong style="color:red;">2 4 6</strong></p>
<p><strong style="color:red;">8 10 12</strong></p>
The sum is:
<p><strong style="color:green;">3 6 9</strong></p>
<p><strong style="color:green;">12 15 18</strong></p>
</div>

#### Recitation Matrix Sum - Problem 5.a.: Algorithm
Write out the steps you would use to solve this problem by hand as pseudocode. 

#### Recitation Matrix Sum - Problem 5.b.: Implementation
Translate your pseudocode into a C++ program to solve the above code, verify that your program works as expected.

&nbsp;&nbsp;&nbsp;
### Recitation Coding Telephone

For this activity, you will need to break into groups of approximately 6-8. The basic idea of the game is simple: We will give you some starting piece of code, with a short region of the code marked for "Coding Telephone". The first person in your group will have to translate the code entirely to comments, leaving no actual code in that region behind. They will pass this comment file on to the second person in your group, who will translate the comments back into code. Then the next person will translate the code to comments, so on and so forth until everyone in your group has participated. Then you will attempt to compile your code and run it, and see what happens. Think of it like the game Telephone, but with code.

The only person who should view this <a href="/spring-2025-web/assets/files/codingTelephone.cpp" download>starting code</a> is the first person in your group. Make sure to keep the code secret at each stage so others cannot see it. You will each have five minutes to translate your code. During the time you are not coding, you are welcome to work on the other questions in this recitation assignment. 



Once your group has completed the game, work together to answer the following questions:

Did your final code compile? If not, what error did it fail with? If this is an easy to fix error, fix it and move on to the next question.

If your code compiled, did it run? If not, what error did it fail with? If so, what did it print?

Compile and run the original code, and compare it with the code you ended with. How did it change? Where were some areas of miscommunication?

**Submit your answers to these questions along with your final Telephone code for this problem on Canvas.**

&nbsp;&nbsp;&nbsp;&nbsp;
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
&nbsp;&nbsp;&nbsp;&nbsp;
## Homework

**Warning: You are not allowed to use global variables for this homework.**

All function names, return types, and parameters must precisely match those shown. You may not use pass by reference or otherwise modify the function prototypes. You are welcome to create additional functions that may help streamline your code. 

&nbsp;&nbsp;&nbsp;
### Most Popular Word

A word is said to be most popular if it occurs more frequently than any other word. Write a function named `mostPopularWord()` that finds the most popular word in an array and prints the word, its frequency, and the indices where it was found. You may assume there's always one correct answer, and the array will be non-empty. If it has equal occurrence, then we always consider the most recent one.

Note: You do not need sorting to solve this.

{% highlight c++ %}
void mostPopularWord(string words[], const int WORDS_SIZE)
{
    // ...
}
{% endhighlight %}

| **Function:**  | `mostPopularWord(string[], const int)`|
| **Purpose:**  | Print the word with the highest frequency, its count, and its index positions in the array. |
| **Parameters:** | **string** <tt>words</tt>: Array of words <br />  **const int** <tt>WORDS\_SIZE</tt>: The size of word array |
| **Return value:** | - The function should print the word with the highest frequency, its count, and its index positions in the array. <br />  - The function doesn't return any value to the main function. |
| **Error Handling/ Boundary Conditions:** |  - If two or more words have the same frequency, the word that appears last will be considered the most popular; see <span style="color:red">Test code 2</span> below <br /> - You may assume the words[] array is always non-empty. |

**Example:** 

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of mostPopularWord() is included

int main()
{
    const int WORDS_SIZE = 4;
    string words[WORDS_SIZE] = {"mail", "text", "spam", "spam"};
    mostPopularWord(words, WORDS_SIZE);
    return 0;
}

// OUTPUT
// The most popular word: spam
// Frequency: 2
// Found at pos: 2 3
{% endhighlight %}



**For Question 1, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste mostPopularWord() and any helper function(s) to the answer box!** 

<span style="color:red">Test code 1:</span>
{% highlight c++ %}
const int WORDS_SIZE = 5;
string words[WORDS_SIZE] = {"hello", "world", "hello", "world", "hello"};
{% endhighlight %}
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>The most popular word: hello</p>
<p>Frequency: 3</p>
<p>Found at pos: 0 2 4</p>
</div>


<span style="color:red">Test code 2:</span>
{% highlight c++ %}
const int WORDS_SIZE = 5;
string words[WORDS_SIZE] = {"apple", "corn", "corn", "apple", "lettuce"};
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>The most popular word: apple</p>
<p>Frequency: 2</p>
<p>Found at pos: 0 3</p>
</div>

<span style="color:red">Explanation:</span> The last word that appeared with a frequency of 2 is "apple" at index 3. Therefore, based on our rules, that is the word that will be displayed instead of "corn". 


&nbsp;&nbsp;&nbsp;
### Fitness Statistics

Bob recently started a daily fitness routine to improve his overall health. Every day, he tracks the number of steps he takes, and after a few weeks of consistent effort, he now wants to analyze his data to gain some insights into his progress. 

To help him, Bob needs two(2) functions written in C++ that will allow him to understand his fitness journey better.

**Function 1:**  Bob is curious about how his total step count has increased over time. This function will calculate the cumulative sum of his daily step count, showing him the total distance he's covered since he started tracking.

{% highlight c++ %}
void stepCountCumulativeSum( int daily_steps[], 
                             const int NUM_DAYS, 
                             int cumulative_steps[] )
{
    // ...
}
{% endhighlight %}


| **Function:**  | `stepCountCumulativeSum( int[], const int, int[])` |
| **Purpose:**  | Calculates the cumulative sum of the daily step counts and records the running total in the `cumulative_steps` array. The cumulative sum represents the total number of steps Bob has taken up to each respective day, providing a running total of his overall progress. The function should not print anything. |
| **Parameters:** | **int** <tt>daily_steps[]</tt>: array of Bob's daily step count. <br /> **const int** <tt>NUM_DAYS</tt>: Size of `daily_steps` array and `cumulative_steps` array<br />**int** <tt>cumulative_steps[]</tt>: Array to be filled with Bob's cumulative step count. |
| **Return value:** |  The function doesn't return any value. |


**Example:** 
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of stepCountCumulativeSum() is included

int main()
{
    const int NUM_DAYS = 5;
    int daily_steps[NUM_DAYS] = {5000, 4000, 5000, 2000, 4000};
    int cumulative_steps[NUM_DAYS];
    stepCountCumulativeSum(daily_steps, NUM_DAYS, cumulative_steps);
    // We are printing the contents of the cumulative_steps array here.
    return 0;
}


// OUTPUT
// 5000
// 9000
// 14000
// 16000
// 20000
{% endhighlight %}




{% highlight c++ %}
const int NUM_DAYS = 3;
int daily_steps[NUM_DAYS] = {10000, 2000, 6000};
int cumulative_steps[NUM_DAYS];
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>10000</p>
<p>12000</p>
<p>18000</p>
</div>

<span style="color:red">Test code 2:</span>

{% highlight c++ %}
const int NUM_DAYS = 4;
int daily_steps[NUM_DAYS] = {4000, 2000, 8000, 3000};
int cumulative_steps[NUM_DAYS];
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>4000</p>
<p>6000</p>
<p>14000</p>
<p>17000</p>
</div>

&nbsp;&nbsp;&nbsp;

**Function 2:** Bob is also interested in how consistent he has been with his daily steps. This function will calculate the mean of his daily step count and return the deviation, showing him which days he was above or below his regular activity level.

{% highlight c++ %}
 double stepCountDeviation( int daily_steps[ ], 
                            const int NUM_DAYS, 
                            const int OPTIMAL_STEP_COUNT )
{
    // ...
}
{% endhighlight %}



| **Function:** | `stepCountDeviation( int[], const int, const int )` |
| **Purpose:** | Calculates the mean of daily step counts and returns the deviation <br /> **deviation =  mean - optimal step count** <br /> The function should not print anything. |
| **Parameters:** | **int** <tt>daily_steps[]</tt>: array of Bob's daily step count. <br /> **const int** <tt>NUM_DAYS</tt>: Size of `daily_steps` array <br /> **const int** <tt>OPTIMAL_STEP_COUNT</tt>: Desired step count per day. |
| **Return value:** |  The function will return a `double`, which is the calculated deviation |


**Example:**

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of stepCountDeviation() is included

int main()
{
    const int NUM_DAYS = 5;
    int daily_steps[NUM_DAYS] = {5000, 4000, 5000, 2000, 4000};
    const int OPTIMAL_STEP_COUNT = 5000;
    double deviation = stepCountDeviation(daily_steps, NUM_DAYS, OPTIMAL_STEP_COUNT);
    // We are printing the deviation up to 3 decimal places
    cout << fixed << setprecision(3) << deviation << endl;
    return 0;
}

// OUTPUT:
// -1000.000
{% endhighlight %}


<span style="color:red">**Explanation:**</span> 
1. `mean` = (5000 + 4000 + 5000 + 2000 + 4000)/5 = 4000
1. `deviation `= `mean` - `OPTIMAL_STEP_COUNT` = 4000 - 5000 = -1000


**For Question 2, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste stepCountCumulativeSum(),  stepCountDeviation(), and any helper function(s) to the answer box!** 


<span style="color:red">Test code 1:</span>
{% highlight c++ %}
const int NUM_DAYS = 3;
int daily_steps[NUM_DAYS] = {10000, 2000, 6000};
const int OPTIMAL_STEP_COUNT = 5000;
{% endhighlight %}
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>1000.000</p>
</div>


<span style="color:red">Test code 2:</span>
{% highlight c++ %}
const int NUM_DAYS = 4;
int daily_steps[NUM_DAYS] = {4000, 2000, 8000, 3000};
const int OPTIMAL_STEP_COUNT = 750;
{% endhighlight %}
<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>3500.000</p>
</div>

&nbsp;&nbsp;&nbsp;
### Normal Heart Rate

As a pediatrician, you need to monitor newborns' heart rates, which should fall between 70 and 190 bpm. To simplify this task, write a function printNormalHeartRates() that takes two arrays: one with patient names and another with their heart rates. The function will print the names of patients with normal heart rates.


 {% highlight c++ %}
 void printNormalHeartRates(string patients[], 
        int heart_rate[], 
        const int NUM_PATIENTS)
 {
    // ...
 }
{% endhighlight %}

| **Function:** | printNormalHeartRates (string, int, int) |
| **Purpose:**  | Prints out the patients with normal heart rates. Where normal heart rate is between 70 and 190, both inclusive. You may assume that both `patients[]` and `heart_rate[]` arrays will be the same size. |
| **Parameters:** | **string** <tt>patients[]</tt>: Array of strings which contains the patient's names.  <br /> **int** <tt>heart_rate[]</tt>: Array of int which contains their heart rate  <br />  **const int** <tt>NUM_PATIENTS</tt>: An integer that gives the number of elements in the patient and heart rate arrays |
| **Return value:** | - The function doesn't return any value. <br /> - Your function should print out all patients whose heart rate is within the range |
| **Error handling/ Boundary conditions:** | - You may assume that the `patients[]` array and `heart_rate[]` array are non-empty <br /> - You may also assume that the size of the `patients[]` array and `heart_rate[]` array are always equal |

**Example:** 
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of printNormalHeartRates() is included

int main() 
{
    
    string patients[3] = {"Jamie", "Sebastien", "Shaun"};
    int heart_rate[3] = {90, 70, -12};
    
    printNormalHeartRates(patients, heart_rate, 3);
        
    return 0;
}

// OUTPUT
// Jamie 90
// Sebastien 70
{% endhighlight %}

**For Question 3, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste printNormalHeartRates() and any helper function(s) to the answer box!** 

<span style="color:red">Test code 1:</span>

{% highlight c++ %}
string patients[4] = {"Joe", "Jack", "Amy", "Bob"};
int heart_rate[4] = {70, 80, 190, 100};
printNormalHeartRates(patients, heart_rate, 4);
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Joe 70</p>
<p>Jack 80</p>
<p>Amy 190</p>
<p>Bob 100</p>
</div>

<span style="color:red">Test code 2:</span>

{% highlight c++ %}
string patients[6] = {"Chloe Kim", "Rene Rinnekangas", "Shaun White", "A", "B", "C"};
int heart_rate[6] = {190, 70, 191, 69, 71, 189};
printNormalHeartRates(patients, heart_rate, 6);
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Chloe Kim 190</p>
<p>Rene Rinnekangas 70</p>
<p>B 71</p>
<p>C 189</p>
</div>



&nbsp;&nbsp;&nbsp;
### Best Time to Buy and Sell a House

Flipping is a real estate strategy that involves buying homes and selling them for a profit in a short period of time. You want to maximize your profit by choosing a single day to buy a house and choosing a different day in the future to sell that house.


{% highlight c++ %}
int maxProfit( int prices[], const int NUM_MONTHS )
{
// ...
}
{% endhighlight %}

| **Function:** | `maxProfit(int[], const int)` |
| **Purpose:** | Find the maximum profit achieved from buying and selling a house. The function should not print anything. |
| **Parameters:** | **int** <tt>prices[]</tt>: Array of prices of the house every month <br /> **const int** <tt>NUM_MONTHS</tt>: The size of prices array |
| **Return value:** |  It should return the maximum profit achieved through one house flip. |
| **Error handling/Boundary conditions:** | - Return 0 if no profit can be achieved. <br /> - You may assume that the <tt>prices[]</tt> array is always non-empty |

**Example:** 
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of maxProfit() is included

int main()
{
    const int NUM_MONTHS = 6;
    int prices[NUM_MONTHS] = {700000, 100000, 500000, 300000, 600000, 400000};
    int profit = maxProfit(prices, NUM_MONTHS);
    cout << "Maximum profit: " << profit << endl;
    return 0;
}

// OUTPUT
// Maximum Profit: 500000
{% endhighlight %}

<span style="color:red">Explanation:</span> 
1. Buy on month 2 (price = 100000) and sell on month 5 (price = 600000)
1. profit = 600000-100000 = 500000.
1. Note: Buying on month 2 and selling on month 1 is not allowed because you must buy before you sell.


**For Question 4, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste maxProfit() and any helper function(s) to the answer box!**  

<span style="color:red">Test code 1:</span>

{% highlight c++ %}
const int NUM_MONTHS = 5;
int prices[NUM_MONTHS] = {700000, 600000, 400000, 300000, 100000};
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Maximum Profit: 0</p>
</div>

<span style="color:red">Explanation:</span> In this case, no profitable transactions are possible, and the max profit = 0.

<span style="color:red">Test code 2:</span>
{% highlight c++ %}
const int NUM_MONTHS = 6;
int prices[NUM_MONTHS] = {700000, 300000, 400000, 100000, 400000, 100000};
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Maximum Profit: 300000</p>
</div>

<span style="color:red">Explanation:</span> Buy on month 4 (price = 100000) and sell on month 5 (price = 400000), profit = 400000-100000 = 300000.



&nbsp;&nbsp;&nbsp;
### Splitting a String


<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color: #ff2222; border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 
Be advised that this funciton will likely be used again in future assignments.
</div>

**HINT**: use `stringstream`.

**PROTIP**: compile using `-Wsign-compare` e.g. if saved to file named <tt>foo.cpp</tt>, use 

{% highlight sh %}
g++ -Wall -Werror -Wpedantic -Wsign-compare foo.cpp
{% endhighlight %}

&nbsp;

When you're processing data, it's useful to break up a text string into pieces using a delimiter. Write a function `split()` that takes a string, splits it at every occurrence of a delimiter, and then populates an array of strings with the split pieces, up to the provided maximum number of pieces.


 {% highlight c++ %}
 int split( string input_string, 
            char separator, 
            string arr[], 
            const int ARR_SIZE )
 {
    // ...
 }
 {% endhighlight %}

| **Function:** | `split( string, char, string[], const int )` |
| **Purpose:**  | Break a text string into pieces using the given delimiter and populate each piece in the array. The function does not print anything. |
| **Parameters:** | **string** <tt>input_string</tt>: The text string containing data separated by a delimiter <br /> **char** <tt>separator</tt>: The delimiter marking the location where the string should be split up <br /> **string** <tt>arr[]</tt>: The array that will be used to store the input text string's individual string pieces <br /> **const int** <tt>ARR_SIZE</tt>: The number of elements that can be stored in the array |
| **Return value:** | - The function returns an `int`, the number of pieces the input text string is split into. <br /> - Populate `arr[]` with the all the element. |
| **Error Handling/ Boundary Conditions:** | - Return `1` if the delimiter character is not found. Place the entire string in the array as the first element <br />        - Return `-1` if the string is split into more pieces than the size of the array. Fill the array with as many pieces of the split string as possible. <br />        - Return `0` if an empty string is provided. |



**Example:** 
               
{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of split() is included

void printArray(string arr[], const int NUM_ELEMENTS)
{
    for (int i=0; i < NUM_ELEMENTS; i++)
    {
        cout << "arr["<< i << "]:" << arr[i] << endl;
    }   
}

int main()
{
    string input_string = "ABCDEFG";
    char separator = ' ';
    const int ARR_SIZE = 3;
    string arr[ARR_SIZE];
    // num_splits is the value returned by split
    int num_splits = split(input_string, separator, arr, ARR_SIZE);
    cout << "Function returned value: " << num_splits << endl;
    if(num_splits != -1) 
    {
        printArray(arr, num_splits); 
    } 
    else 
    {
        printArray(arr, ARR_SIZE);
    }
}

// OUTPUT:
// Function returned value: 1
// arr[0]:ABCDEFG
{% endhighlight %}




**For Question 5, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste split() and any helper function(s) to the answer box!**


<span style="color:red">Test code 1:</span>
{% highlight c++ %}
string testcase = "RST,UVW,XYZ";
char separator = ',';
const int ARR_SIZE = 3;
string arr[ARR_SIZE];
// num_splits is the value returned by split
int num_splits = split(testcase, separator, arr, ARR_SIZE);
cout << "Function returned value: " << num_splits << endl;
for (int i=0; i < ARR_SIZE; i++){
  cout << "arr["<< i << "]:" << arr[i] << endl;
}
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Function returned value: 3</p>
<p>arr[0]:RST</p>
<p>arr[1]:UVW</p>
<p>arr[2]:XYZ</p>
</div>



<span style="color:red">Test code 2:</span>
{% highlight c++ %}
string testcase = "Bangkok,Berlin,Birmingham,Bogota,Busan,Baton Rouge,Beaumont,Boise,Budapest";
char separator = ',';
const int ARR_SIZE = 5;
string arr[ARR_SIZE];
// num_splits is the value returned by split
int num_splits = split(testcase, separator, arr, ARR_SIZE);
cout << "Function returned value: " << num_splits << endl;
for (int i=0; i < ARR_SIZE; i++){
  cout << "arr["<< i << "]:" << arr[i] << endl;
}
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>Function returned value: -1</p>
<p>arr[0]:Bangkok</p>
<p>arr[1]:Berlin</p>
<p>arr[2]:Birmingham</p>
<p>arr[3]:Bogota</p>
<p>arr[4]:Busan</p>
</div>

<span style="color:red">Explanation:</span>The string can be split into more pieces than the size of the array; thus, we returned -1 and filled the array with as many pieces as possible.






&nbsp;&nbsp;&nbsp;
### School Exam Scores

You’re helping your teacher analyze student exam scores across 10 subjects. Each row represents a student’s scores in these subjects. Your task is to identify the first student whose average score falls below a defined threshold. Write a function `minAverg` that returns the index of the first student with an average score below the threshold.


 {% highlight c++ %}
 int minAverg( int scores[][10], 
               const int NUM_STUDENTS, 
               double threshold )
 {
    // ...
 }
 {% endhighlight %}

| **Function:** | `minAverg( int, int, double )` |
| **Purpose:**  | A function to return the index of a student whose average score is less than or equal to the threshold. |
| **Parameters:** | **int** <tt>scores[][10]</tt>: A 2D integer array with 10 columns for storing the scores for each of the 10 subjects <br /> **const int** <tt>NUM\_STUDENTS</tt>: An integer number of rows for each student <br /> **double** <tt>threshold</tt>: A floating number threshold for low average score. |
| **Return value:** |  The function returns an `int` representing the index of the first student with a low average score that is less than or equal to the threshold. |
| **Error handling/Boundary conditions:** | - The function returns `-1` if there is no average score that is less than or equal to the threshold <br /> - You may assume that the `score[][]` array is non-empty |

**Example:** 

{% highlight c++ %}
// Assume the proper libraries are included
// Assume the proper implementation of minAverg() is included

int main()
{
    int scores[2][10] = {
         {80, 90, 85, 95, 88, 82, 75, 89, 91, 87},  
         {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}          
    };
    cout << "returned student index: " <<  minAverg(scores, 2, 10.0);
    return 0;
}

// OUTPUT:
// returned student index: 1
{% endhighlight %}
   

**For Question 6, develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste minAverg() and any helper function(s) to the answer box!** 

<span style="color:red">Test code 1:</span>

{% highlight c++ %}
int scores[3][10] = {
      {10, 1, 1, 1, 1, 1, 1, 1, 1, 1},
      {2, 2, 2, 2, 2, 2, 2, 2, 2, 20},  
      {3, 3, 3, 3, 3, 30, 3, 3, 3, 3}
};
cout << "returned student index: " <<  minAverg(scores, 2, 25);
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>returned student index: 0</p>
</div>

<span style="color:red">Test code 2:</span>

{% highlight c++ %}
int scores[4][10] = {
    {50, 60, 55, 65, 70, 60, 58, 62, 55, 65}, 
    {70, 80, 75, 85, 90, 65, 78, 82, 88, 74},
    {10, 20, 15, 25, 12, 30, 18, 22, 17, 15},  
    {100, 110, 105, 115, 120, 90, 108, 102, 114, 104},
};
cout << "returned student index: " <<  minAverg(scores, 5, 40);
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>returned student index: 2</p>
</div>


<span style="color:red">Test code 3:</span>
{% highlight c++ %}
int scores[5][10] = { 
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 10, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
};
cout << "returned student index: " << minAverg(scores, 5, 9);
{% endhighlight %}

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
<p>returned student index: 0</p>
</div>












{% comment %}
left for postarity this was commented out in the pdf... maybe a spring question?
% &nbsp;&nbsp;&nbsp;
### Super Bowl Watch Party

% Your family loves the Super Bowl. Every year, your family hosts three watch parties: your grandparents have one at their house, your parents have one at their house, and your uncle has one at his house. You and your friends all want to watch the event together, but you are all in different locations. You want to figure out how far each individual is from each of the watch parties. You are given two arrays of coordinates; one array shows the city coordinates of the watch parties, and one shows the coordinates of your friends.


% \begin{table}[H]
%     \centering
%     \begin{tabular}{|c|c|c|}
%     \hline
%          Watch Party City Locations& x& y\\ \hline
%     City 1& 2& 10
% \\ \hline
%     City 2& 5& 8
% \\ \hline
%     City 3& 1& 2\\\hline
%     \end{tabular}
% \end{table}

% \begin{table}[H]
%     \centering
%     \begin{tabular}{|c|c|c|}
%     \hline
%          Individual Locations& x& y
% \\ \hline
%     Person 1& 2& 10
% \\ \hline
%     Person 2& 2& 5
% \\ \hline
%     Person 3& 8& 4
% \\ \hline
%     Person 4& 5& 8\\ \hline
%     Person 5& 1& 2\\ \hline
%     \end{tabular}
% \end{table}
% You want to fill in a table of distances between the watch parties and your friends. This requires comparing the location of a particular watch party ($p2$ in the below equation) with the location of a particular friend ($p1$ in the below equation):

% $distance(p1, p2) = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$

% These distances will then be used to fill a table of all the distances. From the above input coordinates, the distance matrix obtained is:

% \begin{table}[H]
%     \centering
%     \begin{tabular}{|c|c|c|c|}
%     \hline
%          & City 1 & City 2 & City 3 \\ \hline
%     Person 1 & 0.00 & 3.61 & 8.06 \\ \hline
%     Person 2 & 5.00 & 4.24 & 3.16 \\ \hline
%     Person 3 & 8.49 & 5.00 & 7.28 \\ \hline
%     Person 4 & 3.61 & 0.00 & 7.21 \\ \hline
%     Person 5 & 8.06 & 7.21 & 0.00 \\ \hline
%     \end{tabular}
% \end{table}
% The first value is calculated as $d(person1, city1) = \sqrt{(2 - 2)^2 + (10 - 10)^2} = 0.00$

% The second value is calculated as $d(person1, city2) = \sqrt{(5 - 2)^2 + (8 - 10)^2} = 3.61$ and so on. 

% Function specifications
% \begin{longtable}[H]{|p{1.7in}|p{4.0in}|} \hline
%         **Function:** \newline 
%         \mintinline[breaklines=true]{c++}{calculateDistanceMatrix( double[], double[], double[],  const int,  const int,  const int,  const int)} & \mintinline[breaklines=true]{c++}{void calculateDistanceMatrix( double distance[][3], double individual_locations[][2], double city_locations[][2], const int I_ROWS,  const int I_COLS,  const int C_ROWS,  const int C_COLS)}
%         \\ \hline
%         **Purpose:**  & Constructs the distance matrix using individual locations and city locations.\\ \hline
%         **Parameters:** &  `double distance[][3]`: Empty distance matrix of size I\_ROWS x C\_ROWS. \newline
%         `double individual_locations[][2]`: Coordinates for clues of size I\_ROWS x I\_COLS \newline
%         `double city_locations[][2]`: Coordinates for regions of size C\_ROWS x C\_COLS\newline
%         `const int I_ROWS`:  Number of rows for individual\_locations[][]\newline
%         `const int I_COLS`: Number of columns for individual\_locations[][], will be 2 for this question.\newline
%         `const int C_ROWS`: Number of rows for city\_locations[][], will be 3 for this question.\newline
%         `const int C_COLS`: Number of columns for city\_locations[][], will be 2 for this question.
% \\ \hline
%         **Return value:** &  The function doesn't return any value. \newline 
%        The function should not print anything. \newline
%        The function fills out the distance matrix using individual locations and city locations. \\ \hline
%         **Example:** & 
%         \begin{example}
%         \begin{minted}[breaklines=true]{c++}

% // Assume the proper libraries are included
% // Assume the proper implementation of calculateDistanceMatrix() is included

% int main()
% {
%     const int I_ROWS = 5;
%     const int I_COLS = 2;
%     const int C_ROWS = 3;
%     const int C_COLS = 2;
%     double individual_locations[I_ROWS][I_COLS] = { {2, 10}, {2, 5}, {8, 4}, {5, 8}, {1, 2} };
%     double city_locations[C_ROWS][C_COLS] = { {2, 10}, {5, 8}, {1, 2} };
%     double distance[I_ROWS][C_ROWS];
%     calculateDistanceMatrix(distance, individual_locations, city_locations, I_ROWS, I_COLS, C_ROWS, C_COLS);
%     for (int i = 0; i < I_ROWS; i++)
%     {
%         for (int j = 0; j < C_ROWS; j++)
%         {
%             cout << fixed << setprecision(2) << distance[i][j] << " ";
%         }
%         cout << endl;
%     }
%     return 0;
% }
%         {% endhighlight %}
%         \end{example}

%         <div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
% 0.00	3.61	8.06 \newline
% 5.00	4.24	3.16 \newline
% 8.49	5.00	7.28 \newline
% 3.61	0.00	7.21 \newline
% 8.06	7.21	0.00
%         </div>
%              \\ \hline
% \end{longtable}


% Develop and validate your solution in VS Code. Once you are happy with your solution, go to coderunner on Canvas and paste the whole program into the answer box! 
% <div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
% Test code:
% {% highlight c++ %}
% const int I_ROWS = 3;
% const int I_COLS = 2;
% const int C_ROWS = 3;
% const int C_COLS = 2;
% double individual_locations[I_ROWS][I_COLS] = { {2, 10}, {8, 4}, {5, 8} };
% double city_locations[C_ROWS][C_COLS] = { {2, 10}, {5, 8}, {1, 2} };
% double distance[I_ROWS][C_ROWS];
% {% endhighlight %}
% Output:
% {% highlight c++ %}
% 0.00 3.61 8.06
% 8.49 5.00 7.28
% 3.61 0.00 7.21
% {% endhighlight %}
% </div>

% <div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
% Test code:
% \begin{minted}[breaklines=true]{c++}
% const int I_ROWS = 4;
% const int I_COLS = 2;
% const int C_ROWS = 3;
% const int C_COLS = 2;
% double individual_locations[I_ROWS][I_COLS] = { {2, 1}, {2, 3}, {4, 4}, {5, 8} };
% double city_locations[C_ROWS][C_COLS] = { {1, 2}, {3, 6}, {5, 8} };
% double distance[I_ROWS][C_ROWS];
% {% endhighlight %}
% Output:
% {% highlight c++ %}
% 1.41 5.10 7.62
% 1.41 3.16 5.83
% 3.61 2.24 4.12
% 7.21 2.83 0.00
% {% endhighlight %}
% </div>

% <div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
% Test code:
% \begin{minted}[breaklines=true]{c++}
% const int I_ROWS = 5;
% const int I_COLS = 2;
% const int C_ROWS = 3;
% const int C_COLS = 2;
% double individual_locations[I_ROWS][I_COLS] = { {2, 10}, {2, 5}, {8, 4}, {5, 8}, {1, 2} };
% double city_locations[C_ROWS][C_COLS] = { {0, 0}, {5, -1}, {-1, -2} };
% double distance[I_ROWS][C_ROWS];
% {% endhighlight %}
% Output:
% {% highlight c++ %}
% 10.20 11.40 12.37
% 5.39 6.71 7.62
% 8.94 5.83 10.82
% 9.43 9.00 11.66
% 2.24 5.00 4.47
% {% endhighlight %}
% </div>

{% endcomment %}

