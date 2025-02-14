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
    <li> SPWI: what about structs?!
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

{% comment %}


&nbsp;&nbsp;&nbsp;&nbsp;
## Background
%write section on printing to file
&nbsp;&nbsp;&nbsp;
### File Output
We discussed reading from a file last week. Here, we will show how we can write to a file. First, you define an `ofstream` variable and open the file you would like to write to. Then you can write to the output file using the same operation you used with `cout`, `<<`, and `endl`.

\begin{example}
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
\end{example}

The output.txt will have the following content:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">
writing a sentence to the output file\\
you can also write the content of the variable
</div>

&nbsp;&nbsp;&nbsp;&nbsp;
## PreQuiz

\begin{problem}
    What are file streams? How many major steps are involved in working with a file in C++?
\end{problem}

\begin{problem}
    The program needs to print all the contents of the file `log.txt` present in the current folder.
\end{problem}

{% highlight c++ %}
#include<iostream>
#include<fstream>
using namespace std;

int main() 
{
    // make an input file stream from the file name given above.
    ifstream file_in("log.txt"); 
    string text;  
    while(______________) // FILL IN THIS LINE
    {      
        cout << text << endl;
    }
    //close the file
    ________________; // FILL IN THIS LINE
    return 0;
}
{% endhighlight %}


\begin{problem}
    The program needs to write all the contents of the file input.txt to the file output.txt. Assume that both these files are present in the current folder.
\end{problem}

{% highlight c++ %}
#include<iostream>
#include<fstream>
using namespace std;

int main() 
{
    // make an input file stream from the file input.txt.
    _________________; // FILL IN THIS LINE
    // make an output file stream to the file output.txt.
    _________________; // FILL IN THIS LINE
    string text; 

    // read the text from the input file stream.
    while(getline(file_in, text))
    {
        file_out << text << endl;
    }
    return 0;
}
{% endhighlight %}

\begin{problem}
    The program below takes in cities and their coordinates from a file and prints them one at a time to the screen. The cities and coordinates are stored in a file called `cities.txt`, which looks something like:

\begin{verbatim}
London
51.5072 N 0.1276 W
New Delhi
28.6139 N 77.2090 E
Cairo
30.0444 N 31.2357 E
Sydney
33.8688 S 151.2093 E
\end{verbatim}


The program loops through every line in the file. If the line starts with a letter we know it must be a city name. If it doesn't, it must be a coordinate line. Fill in the blanks appropriately.
\end{problem}

{% highlight c++ %}
#include<iostream>
#include<fstream>
using namespace std;

int main(){
    ifstream file_in;
    file_in.open("cities.txt");
    double latitude = 0, longitude = 0;
    char north_or_south, east_or_west;
    char peek;
    string cityName;

    while (!file_in.fail()){
        // Peek at the next character
        file_in.get(peek);
        // Put the character back into the stream
        ________________; //FILL IN THIS LINE
        if (_____________________){ //FILL IN THIS LINE
            getline(file_in, cityName);
        }
        else{
            file_in >> ________________ >> north_or_south >> longitude >> _______________; //FILL IN THIS LINE
            file_in.get(peek); //this line clears the new line character at the end of a coordinate line
            cout << cityName << " is located at " << latitude  << north_or_south;
            cout << ", " << longitude << east_or_west << endl;
        }
    }
}

{% endhighlight %}

&nbsp;&nbsp;&nbsp;&nbsp;
## Recitation

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

% no homework this week
{% endcomment %}
