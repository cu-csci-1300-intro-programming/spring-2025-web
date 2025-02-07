---
layout: post
title: "Appendix B: Formatting Guide"
date: 2025-01-09 09:00:00 -0700
categories: jekyll update
---




&nbsp;&nbsp;&nbsp;&nbsp;
## Naming Conventions
Give variables descriptive names, such as `first_name` or `homework_score`. Avoid one-letter names like `a` or `x`, except for loop counter variables such as `i`.

{% highlight c++ %}
// Poor variable names would be:
int thing = 16;
double a = 2.2;
string x = "Michael";
{% endhighlight %}

{% highlight c++ %}
// Better variable names would be:
int cups_per_gallon = 16;
double lbs_per_kilo = 2.2;
string first_name = "Michael";
{% endhighlight %}


&nbsp;&nbsp;&nbsp;&nbsp;
## Whitespace
"Whitespace" refers to all of the empty space you can use to organize your code including new lines, indentation, and extra spacing. Good whitespace usage helps reduce the strain on the reader's eyes. The compiler ignores whitespace, which allows you can place things anywhere and format them however you want. To maximize readability, there are a few guidelines for whitespace usage. 

**Indentation**: Increase your indentation by one increment of each brace "`{`" and decrease it once on each closing brace "`}`". Use Tab to increase indent and Shift+Tab to decrease indentation. You can also increase indent for multiple lines by highlighting them and pressing `CTRL+]` on Windows and `CMD+]` on Macs, and decrease the indent for multiple lines by highlighting them and pressing `CTRL+[` on Windows and `CMD+[` on Macs.

**New Lines**: You should use one blank line to separate blocks of code. You can separate sections of code based on the tasks they are meant to complete. You should also put any brackets on their own lines to help visually break up your code.

{% highlight c++ %}
// Here is a poor example of whitespace usage:
    int main(){int number = 0;
if(number < 5){
cout << "Less than 5" << endl; }else{
cout << "Greater than 5" 
                << endl;
}
number++;
}
{% endhighlight %}

{% highlight c++ %}
// Here is a better example of whitespace usage:
int main()
{
    int number = 0;
    if(number < 5)
    {
        cout << "Less than 5" << endl;
    }
    else
    {
        cout << "Greater than 5" << endl;
    }
    number++;
}
{% endhighlight %}


&nbsp;&nbsp;&nbsp;&nbsp;
## Commenting
Your code should be well-commented. Use comments to explain what you are doing, especially if you have a complex code section. These comments are intended to help other developers understand how your code works. Comments can also help you remember your own code if you have to go back and read it a week or a month after writing it. Single-line comments should begin with two forward slashes `//`. Multi-line comments begin with one forward slash and an asterisk `/* ... comments here ... */`.


{% highlight c++ %}
// Here is a single line comment:
{% endhighlight %}
{% highlight c++ %}
// Below is a multi-line comment:
/*
    Algorithm:
    Input: two numbers
    Output: sum of input numbers

    1. Ask the user to enter a number
       Save in variable number_1
    2. Ask the user to enter a number
       Save in variable number_2
    3. Compute sum
       sum = number_1 + number_2
    4. Display sum to user
*/
{% endhighlight %}

{% highlight c++ %}
// Sometimes the multi-line comment is styled like so with extra `*` this is a style choice:
/**
 *  Algorithm:
 *  Input: two numbers
 *  Output: sum of input numbers
 *
 *  1. Ask the user to enter a number
 *     Save in variable number_1
 *  2. Ask the user to enter a number
 *     Save in variable number_2
 *  3. Compute sum
 *     sum = number_1 + number_2
 *  4. Display sum to user
 */
{% endhighlight %}
