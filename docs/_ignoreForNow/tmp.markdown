
&nbsp;&nbsp;&nbsp;&nbsp;

## Recitation

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

The code snippet below is supposed to classify shapes based on the number of sides into specific categories (triangle, quadrilateral, pentagon, or a general polygon). Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
int sides = 6;

    if (sides < 2) {
        cout << "Invalid input! A polygon must have at least 3 sides." << endl;
    }
    else if (sides == 3) {
        cout << "It is a triangle." << endl;
    }
    else if (sides == 4) {
        cout << "It is a quadrilateral." << endl;
    }
    else if (sides = 5) {
        cout << "It is a pentagon." << endl;
    }
    else {
        cout << "It is a general polygon." << endl;
    }

    return 0;

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

The code snippet below is supposed to determine if a variable stores a value that is smaller than, equal to or larger than zero. Identify the error(s) in the code below, and write the correct line(s).

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
int num = 0;

    if (num<0) {
        cout << "The number is less than zero.";
    }
    else {
        cout << "The number is zero.";
    }
    else if (num>0) {
        cout << "The number is greater than zero.";
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

     if (num%2){
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

### Recitation Hydration Tracking App - Problem 7

Your goal is to drink 7 glasses of water every day, but you often forget to stay hydrated! So you decide to create a hydration tracking app that monitors your water consumption each day and provides feedback on your progress. The program first asks how many glasses of water you drank that day and then displays a message based on your intake. Additionally, it calculates and tells you how many glasses you are left to drink to hit your goal.

The following are the possible messages you will get based on your intake:

1. If you drank 3 glasses or less, you get:
1. `You are falling behind! Drink more water! You have X glasses left to drink.`
1. If you drank more than 3 glasses but less than 7 glasses, you get:
1. `You're doing well! Keep it up! You still have X glasses left to drink`
1. If you drank 7 glasses or more, you get:
1. `Congratulations! You've hit your water goal for the day! Stay hydrated!`

Note that **X** is the number of glasses left to drink left after subtracting how much water you have drunk already.

Here is a sample run <span style="color:red">with user input noted</span>:

<div markdown="ol" style="margin-bottom: 10px; margin-top: 10px; overflow: hidden; color: #ffffff; background-color:rgb(6, 6, 6); border-color: #bce8f1; padding: 15px; border: 1px solid transparent; border-radius: 4px;">

  <p>How many glasses of water have you had today?</p>

  <p><span style="color:red">3</span></p>

  <p>You are falling behind! Drink more water! You have 4 glasses left to drink.</p>
</div>

&nbsp;&nbsp;

#### Recitation Hydration Tracking App - Problem 7.a.: algorithm

Write an algorithm in pseudocode for the program above.

&nbsp;&nbsp;

#### Recitation Hydration Tracking App - Problem 7.b.: examples

Imagine how a sample run of your program would look like. Write at least two examples.

&nbsp;&nbsp;

#### Recitation Hydration Tracking App - Problem 7.c.: boundary conditions

Identify the values that you must test for. We call these values "boundary conditions".

&nbsp;&nbsp;

#### Recitation Hydration Tracking App - Problem 7.d.: implementation

Implement your solution in C++ using VS Code. Revise your solution, save, compile and run it again. Are you getting the expected result and output? Keep revising until you do. Make you sure you test for the values used in your sample runs, and for the boundary conditions.

&nbsp;&nbsp;&nbsp;&nbsp;