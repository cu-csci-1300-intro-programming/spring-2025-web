
&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 1 
The code snippet below is supposed to determine if a variable stores a value that is greater than, less than, or equal to 8. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
    int num = 6;

    if (num > 8) {
        cout << "The number is greater than 8." ;
    }
    else if (num = 8) {
        cout << "The number is equal to 8."; 
    }
    else {
        cout << "The number is less than 8.";
    }

    return 0; 
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 2
The code snippet below is supposed to determine if a variable stores a value for an angle that is obtuse, right, or acute. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
    int angle = 120;
    if (x>90) { 
        cout<<"It is an obtuse angle." ;
    }
    elif(x=90) {
        cout<<"It is a right angle.";
    }
    else{
        cout<<"It is an acute angle.";
    }
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 3
The code snippet below is supposed to determine if a variable stores a value that is equal to zero or not. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
    int num = 7;

    if (num) { 
        cout << "The number is zero.";
    }
    else {
        cout << "The number is not zero.";
    }

    return 0; 
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 4
The code snippet below is supposed to determine if a variable stores a value that is equal to zero or not. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
    int num = 0;

    else {
        cout << "This is the 'else' block.";
    }
    if (num == 0) {
        cout << "The number is zero.";
    }
    else {
        cout << "The number is not zero.";
    }

    return 0; 
}
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 5
The following code snippet is expected to accept a user provided integer and then state whether that number is even or odd. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
 #include <iostream>
 using namespace std;
 
 int main()
 {
     int num;
     cout << "Provide an integer:" << endl;
     cin >> num;

     if (num/2){
         cout << "The number is even." << endl;
     }
     else {
         cout << "The number is odd." << endl;
     }
 
     return 0; 
 }
{% endhighlight %}

&nbsp;&nbsp;&nbsp;
### Recitation Spot The Error - Problem 6
The following code snippet is expected to accept a user provided character and then state whether the corresponding grade passes or not. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
 #include <iostream>
 using namespace std;
 
 int main()
 {
     char grade;
     cout << "Provide a grade (A, B, C, D, or F):" << endl;
     cin >> grade;

     if (grade == 'A' || 'B' || 'C'){
         cout << "This is a passing grade." << endl;
     }
     else if (grade == 'D'){
         cout << "This grade passes with conditions." << endl;
     }
     else {
         cout << "This is a failing grade." << endl;
     }
 
     return 0; 
 }
{% endhighlight %}


&nbsp;&nbsp;&nbsp;
### Recitation Step Tracking App - Problem 7
Your goal is to walk 10,000 steps every day but you aren't great at remembering to do it! So you decide to create a step tracking app that tracks your steps every day and will alert you based on how much you walked for the day. The program first asks how many steps you walked that day and then displays a message based on whether you have hit your goal for the day. Next, it will also tell you how many steps you have left to walk.

The following are the possible messages you will get based on your intake:

1. If you've walked 5,000 steps or less, then you get: 
1. `You have not walked much today! Get those steps in! You have X steps left to walk.`
1. If you’ve walked more than 5,000 steps but less than 10,000 steps, you get: 
1. `You're doing great, over half way there! You still have X steps left to walk.`
1. If you've walked 10,000 steps or more, you get:
1. `You've hit your goal for the day! Great job getting exercise!`


Note that **X** is the amount of steps left after subtracting how far you have walked. 

Here is a sample run <span style="color:red">with user input noted</span>:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;"> 

  <p>How many steps have you taken today?</p>

  <p><span style="color:red">3000</span></p>

  <p>You have not walked much today! Get those steps in! You have 7000 steps left to walk.</p>
</div>

&nbsp;&nbsp;
#### Recitation Step Tracking App - Problem 7.a.: algorithm
Write an algorithm in pseudocode for the program above.

&nbsp;&nbsp;
#### Recitation Step Tracking App - Problem 7.b.: examples
Imagine how a sample run of your program would look like. Write at least two examples.

&nbsp;&nbsp;
#### Recitation Step Tracking App - Problem 7.c.: boundary conditions
Identify the values that you must test for. We call these values "boundary conditions".

&nbsp;&nbsp;
#### Recitation Step Tracking App - Problem 7.d.: implementation
Implement your solution in C++ using VS Code. Revise your solution, save, compile and run it again. Are you getting the expected result and output? Keep revising until you do. Make you sure you test for the values used in your sample runs, and for the boundary conditions. 
