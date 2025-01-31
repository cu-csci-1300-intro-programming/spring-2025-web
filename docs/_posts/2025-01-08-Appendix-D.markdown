---
layout: post
title:  "Appendix D: Debuger Guide"
date:   2025-01-10 12:58:53 -0700
categories: jekyll update
---

## Debugger Installation

A debugger is an incredibly powerful tool you can use to help find issues with your code and fix them. It allows you to do step-by-step examination of your code, inspecting variable values at different points, and understanding how your code actually runs when it is executed.

* Do not remove this line (it will not be displayed)
{:toc}

&nbsp;
&nbsp;
&nbsp;
### Windows Installation

Windows users will use a debugger called gdb to debug their C++ code. This program has been installed with your compiler in homework0. The steps below will demonstrate the process of setting up the debugger in VSCode on Windows.

&nbsp;
&nbsp;
#### Step 1: Open Code Directory with VS Code

Begin by opening VS Code. Open the folder containing your code. For demonstration purposes, we will be using the "csci1300" folder located in Desktop. Once you have navigated to the target folder and selected it, click "Select Folder" on the lower right corner of the folder selection dialog. You should see something resembling the image below. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_1.png' alt='Black display sates Visual studio code followed by editing evolved. subheadings start, recent, recommended, walkthroughs' caption='' %}



&nbsp;
&nbsp;
#### Step 2: Open A File to Debug 

If you already have a cpp file in this folder, double click that file in the left pane. In this demonstration, we will be creating a new cpp file named `hello\_world.cpp`. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_2.png' alt='same image from previous step but hello_world.cpp is available and highlighted in the left dropdown' caption='' %}


The sample code we will be using is as follows. This code declares a string variable named "message" and prints it to the terminal.

{% highlight c++ %}
#include <iostream>
using namespace std;

int main()
{
    string message = "Let's Debug!";
    cout << message << endl;
    return 0;
}
{% endhighlight %} 

Copy the sample code into `hello\_world.cpp` and save the file. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_3.png' alt='text highlighting of the c plus plus code stated above' caption='' %}

&nbsp;
&nbsp;
#### Step 3: Click "Run and Debug"

Go to the debugging pane by clicking on the icon in the red square. Then click "Run and Debug". 

{% include img.html src='windowsDebuggerSetup/debugger_windows_4.png' alt='Far left a red square is drawn onto the image of a play button with a small bug on the left corner' caption='' %}


&nbsp;
&nbsp;
#### Step 4: Select Debugging Option

After clicking "Run and Debug", a dialog will appear as shown below.
Select `C++ (GDB/LLDB)` 

{% include img.html src='windowsDebuggerSetup/debugger_windows_5.png' alt='dropdown states C++ (GDB/LLDB) followed by C++(Windows)' caption='' %}

Another dialog will show up as shown below.
Select the option that contains `C:\msys64\mingw64\bin\g++.exe`

{% include img.html src='windowsDebuggerSetup/debugger_windows_6.png' alt='C/C++: g++.ege buiild and debug active file is highlighted in dropdown' caption='' %}


The result will be as shown below. For the dialog at the bottom right corner of the screen click "Not now". 

{% include img.html src='windowsDebuggerSetup/debugger_windows_7.png' alt='bottom of screen loads many yellow and blue lines talking about loaded and thread' caption='' %}


Click "TERMINAL" in the center of the screen. You will see the message in the terminal "Let's Debug!". At this point you have successfully setup and ran your debugger in VSCode. To make the debugger to the same compilation flags that we use, we will have to edit a configuration file called "tasks.json". 

{% include img.html src='windowsDebuggerSetup/debugger_windows_8.png' alt='In the lower screen section red drawing boxes the word TERMINAL' caption='' %}

Navigate back to the file explorer pane by clicking the first icon on the left pane. There will be a folder with the name ".vscode" created for you. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_9.png' alt='along left panel the image of two files has a red box drawn around it' caption='' %}


Click the folder to view the files inside. You will find "tasks.json" inside. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_10.png' alt='second left panell highlights dot vscode and expands to show tasks dot json' caption='' %}


Open "tasks.json". This is the configuration of your debugging task which include compilation commands. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_11.png' alt='a large json file is loaded left squigly brace quote tasks quote collon left square bracket and so on' caption='' %}

Add the values `-Wall`, `-Werror` and `-Wpedantic` in the `args` section as shown below. Save the file after you have completed editing. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_12.png' alt='args key now has additional element dash Wall dash Werror dash Wpedantic, double-u is always captialized here' caption='' %}


&nbsp;
&nbsp;
#### Step 5: Adding breakpoints

Breakpoints are line or specific code that we want to inspect. Once a breakpoint is reached during runtime, the program will pause for you to inspect the value of each variable. Once you are done inspecting that particular point, you may continue the program by pressing continue.

Navigate back to your cpp file by clicking the tab of you file at the center top of the screen. To add a breakpoint, hover your mouse over the line number of your code that you would like to inspect. The image below is selecting line 7. After clicking, the red dot will not disappear when you move your mouse away.


**Selecting line of code**
{% include img.html src='windowsDebuggerSetup/debugger_windows_13.png' alt='mouse hovers near the line marked 7 a light red circle appears' caption='' %}

*comapred to* **Breakpoint added to line of code**
{% include img.html src='windowsDebuggerSetup/debugger_windows_14.png' alt='the mouse is gone, a bright red circle is present' caption='' %}


Now we can run the debugger by navigating to the debugging pane and clicking "Run and Debug" as in step 3 and 4. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_15.png' alt='The debugging pane is selected noted as the far left play button with a small bug is in a brighter white color' caption='' %}


Notice that our program pauses at the line the breakpoint was added. There is also a list of variables on the left pane. For this instance, the variable "message" is being shown with the value "Let's Debug!". This is very useful when we have many variables in our program. 

{% include img.html src='windowsDebuggerSetup/debugger_windows_16.png' alt='the line cout greater-than greater-than messages greater-than greater-than endl semi-colon is now highlighted' caption='' %}


The menu to control the execution of your program looks like this:

{% include img.html src='windowsDebuggerSetup/debugger_windows_17.png' alt='6 buttons first blue a vertical line followed be a trangle. second blue a dot with a arrow rotating along its top. third blue a dot with an arrow pointing down. forth blue a dot with an arrow pointing up. fifth green a left handed rotating arrow. sixth red a square' caption='' %}


The buttons, left to right, are as follows:

1. Continue: go until the next breakpoint is encountered
1. Step Over: go to the next line, skipping the details of functions
1. Step Into: go to the next line, if necessary jumping into a function that is called
1. Step Out: jump to the end of the function your are in, returning to wherever that function was called from
1. Restart: start the program over from the beginning
1. Stop: quit debugging

Most of the time you can do most of your debugging with just the Continue and the Step Over buttons as long as you have put breakpoints at all the points of your code you care about.

&nbsp;
&nbsp;
&nbsp;
### Mac Installation

MacOS users will use a debugger called lldb to debug their C++ code.

&nbsp;
&nbsp;
#### Step 1: Make a File

Write this code into a new file called `hello\_world.cpp`.

{% highlight c++%}
#include <iostream>
using namespace std;

int main()
{
    string message = "Let's Debug!";
    cout << message << endl;
    return 0;
}
{% endhighlight %}

&nbsp;
&nbsp;
#### Step 2: Instal lldb

This is probably already installed on your computer. Lets double check and install it if we need to. 

Open a terminal in vscode by clicking "Terminal > New Terminal" in your top bar.  In your terminal type:

{% highlight bash %}
lldb
{% endhighlight %}

If it is installed you will see something like below.

{% include img.html src='macDebuggerSetup/debugger_mac_1.png' alt='left of prompt now reads left-paren lldb right-paren' caption='' %}


You can exit this program by typing

{% highlight bash %}
exit
{% endhighlight %}

If it is not installed, your mac should prompt you if you want to install it. Say yes and go through the install. Verify it is installed by typing lldb in your terminal again and seeing the above screenshot.

&nbsp;
&nbsp;
#### Step 3: Install VSCode Extension: CodeLLDB

Open the extensions tab on the left of VS Code and Search "CodeLLDB" and click install for the top result shown below.

{% include img.html src='macDebuggerSetup/debugger_mac_2.png' alt='codellbd is typed into the extentions seach window' caption='' %}

&nbsp;
&nbsp;
#### Step 4: Click the "Run and Debug" Tab

If this is the first time you are using this tab, it will look like this:

{% include img.html src='macDebuggerSetup/debugger_mac_3.png' alt='The triangle with a lady-bug is a brighter white, the next pannel reads open a file, run and debug and contains more information in white and blue text.' caption='' %}

Press "create a launch.json file", and then choose the second option "LLDB".

{% include img.html src='macDebuggerSetup/debugger_mac_4.png' alt='LLDB is highlighted' caption='' %}

This should open a new file called "launch.json".

{% include img.html src='macDebuggerSetup/debugger_mac_5.png' alt='file lauch-dot-json is open and highlighted it begins with gree text Use IntelliSense to learn about possible attributes...' caption='' %}


Delete everything in this file and replace it with:

{% highlight bash %}
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "a.out debug",
            "program": "${workspaceFolder}/a.out",
            "args": [ ],
            "cwd": "${workspaceFolder}"
        }
    ]
}
{% endhighlight %}

Save the file with "Command + S" or "File > Save".

&nbsp;
&nbsp;
#### Step 5: Add Breakpoints to your Code

The red dot to the left of line 6 is a 'breakpoint'. Add your own by hovering your mouse just to the left of the line number you want to add a breakpoint to.

{% include img.html src='macDebuggerSetup/debugger_mac_6.png' alt='The dot next to line six is bright red' caption='' %}

&nbsp;
&nbsp;
#### Step 6: Compile Your Code with -g

In your terminal type

{% highlight bash %}
g++ -Wall -Wpedantic -Werror -std=c++17 -g hello_world.cpp
{% endhighlight %}

Note we have added the flag `-g` which tells the compiler to do extra stuff so we can debug the program. You should now see an `a.out` file and an `a.out.dSYM` folder.

{% include img.html src='macDebuggerSetup/debugger_mac_7.png' alt='title Explorer section 1300CS expandes to folder dot-vscode folder a-dot-out-dot-dSYM-forward-slash-Contents file a.out file hello_world.cpp' caption='' %}

&nbsp;
&nbsp;
#### Step 7: Press the "Run and Debug" tab

This is the sideways triangle with a lady-bug on it.

{% include img.html src='macDebuggerSetup/debugger_mac_8.png' alt='The sidways triangle with lady-bug is in a brighter white' caption='' %}


&nbsp;
&nbsp;
#### Step 8: Press the "a.out" Green Triangle Button

You are now debugging!

{% include img.html src='macDebuggerSetup/debugger_mac_9.png' alt='the line 6 string message equals quote lets debug! quote is highlighted in yellow a marker is left of the word Lets' caption='' %}

&nbsp;
&nbsp;
#### Step 9: Control Your Program Live

Your program will have paused at the first breakpoint it encountered, highlighting the line it is stuck on. Use the control panel to slowly walk through your code execution. The control panel looks like this:

{% include img.html src='macDebuggerSetup/debugger_mac_10.png' alt='6 buttons first blue a vertical line followed be a trangle. second blue a dot with a arrow rotating along its top. third blue a dot with an arrow pointing down. forth blue a dot with an arrow pointing up. fifth green a left handed rotating arrow. sixth red a square' caption='' %}

The buttons, left to right, are:

1. Continue: go until the next breakpoint is encountered
1. Step Over: go to the next line, skipping the details of functions
1. Step Into: go to the next line, if necessary jumping into a function that is called
1. Step Out: jump to the end of the function your are in, returning to wherever that function was called from
1. Restart: start the program over from the beginning
1. Stop: quit debugging

Most of the time you can do most of your debugging with just the Continue and the Step Over buttons as long as you have put breakpoints at all the points of your code you care about.

&nbsp;
&nbsp;
#### What Should I Look For?

The most important two pieces of information you get from debugging is 1. What lines of code are being executed when I run it and 2. What are the values of my variables during execution.

For 1. you can see this in the main .cpp file with the active line being highlighted yellow.

For 2. you can see this in the left panel where all of your in-scope variables will be listed with their value. You can see how their value changes as you step through the program execution.

{% include img.html src='macDebuggerSetup/debugger_mac_11.png' alt='purple message colon orange quote Let apostrophe s debug Exclamation point quote' caption='' %}
