---
layout: post
title:  "Appendix A: Software Installation Guide"
date:   2025-01-10 12:58:53 -0700
categories: jekyll update
---

## VS Code Set Up

* Do not remove this line (it will not be displayed)
{:toc}


&nbsp;
&nbsp;
&nbsp;
### Windows Installation
**Important**: Before proceeding with this document, make sure that you have run Windows Update within your Windows 10 or 11 environment. You must have the latest updates installed. 

&nbsp;
&nbsp;
#### Step 1: Install VS Code
1. Go to the VS code download page, and download for Windows.
    1. {% include img.html src='windowsVSCodeSetup/image6.png' alt='windows downloads page. black.' caption='' %}
1. Run the installer and accept all of the default settings.
1. Click on Install and wait for Visual Studio Code to finish installing, then close the installer.

&nbsp;
&nbsp;
#### Step 2: Installing MinGW
This section is based on [this guide from Microsoft](https://code.visualstudio.com/docs/cpp/config-mingw)

MinGW is a Windows C/C++ compiler tool set that will allow us to compile our C/C++ code into a .exe file.

1. First install [MinGW](https://github.com/msys2/msys2-installer/releases/download/2023-05-26/msys2-x86_64-20230526.exe)
1. Open the installer and choose the Defaults for all settings.
1. At the end of the installation run msys2 and then run the following command:
    1. {% include img.html src='windowsVSCodeSetup/image8.png' alt='MSYS2 Setup white' caption='' %}
    1. (Shift + Insert is the paste shortcut in MSYS2’s terminal)
    1. `pacman -S --needed base-devel`
    1. `mingw-w64-x86_64-toolchain`
    1. {% include img.html src='windowsVSCodeSetup/image7.png' alt='image of a terminal' caption='' %}
1. Press enter when prompted to install all of the default packages, then press Y to confirm the install. This will take 1 to 5 minutes to finish. Once the install completes you can close msys2.
1. Now we need to add msys2 to window’s PATH variable. Press the Windows key and begin typing  “Edit environment variables for your account” until you see this option.
1. {% include img.html src='windowsVSCodeSetup/image10.png' alt='image of a white web environment' caption='' %}
1. Now Select the “PATH” variable and click edit, in the window that opens click “New” and enter the following path for the default installation location of Msys2.
1. `C:\msys64\mingw64\bin`
1. {% include img.html src='windowsVSCodeSetup/image9.png' alt='image of multiple interactable boxes' caption='' %}

&nbsp;
&nbsp;
#### Step 3: Adding VS code extensions

1. After you Reboot open VScode and select the extensions tab. (5th from the top), and search for "C++". We need to install the "C/C++" and "C/C++ Extension Pack" both from Microsoft.
1. {% include img.html src='windowsVSCodeSetup/image12.png' alt='Far left bottom boxes plugin icon, shows C++ written into search bar' caption='' %}
1. Select the extension then click on install, these will provide Syntax Highlighting and other useful tools when working in C++
1. {% include img.html src='windowsVSCodeSetup/image11.png' alt='C/C++ v1.12.4 microsoft 39M+ downloads, 498 reviews' caption='' %}
1. {% include img.html src='windowsVSCodeSetup/image14.png' alt='C/C++ Extension Pack v1.3.0 microsoft 11M+ downloads 24 reviews' caption='' %}

&nbsp;
&nbsp;
#### Step 4: Check your work Hello World
Get the hello world program working. If you are reading this for recitation 1, you will need to follow directions from your TA to submit your work as proof that VSCode is working on your personal computer.

&nbsp;
&nbsp;
&nbsp;
### Mac Installation

&nbsp;
&nbsp;
#### Step 1: Installing VS Code

1. Go to [VS code download page](https://code.visualstudio.com/Download) , and download for Mac.
1. {% include img.html src='macVSCodeSetup/image3.png' alt='windows icon, linux penguin icon, or apple icon' caption='' %}
1. After the download has finished, unzip the folder by double-clicking on it.
1. {% include img.html src='macVSCodeSetup/image5.png' alt='finder window with an expanded dropdown' caption='' %}
1. Now you can see the “Visual Studio Code” application. Drag and drop this icon to the “Applications” folder of your computer. 
1. {% include img.html src='macVSCodeSetup/image4.png' alt='finder window' caption='' %}
1. Double click on the ”Visual Studio Code” icon to launch the application. (You might need to right click and select “open” if you cannot launch the program). Next, select the ”New Terminal” option to open the terminal window.
1. {% include img.html src='macVSCodeSetup/image7.png' alt='VSCode black with Terminal option from top navigation expanded' caption='' %}
1. Install C/C++ extension. In the toolbar on the left hand side of the screen click on the bottom icon for Extensions. Search for C/C++ and click install.
1. {% include img.html src='macVSCodeSetup/image6.png' alt='left navigation of plugins expanded with @recommended typed into the search bar' caption='' %}



&nbsp;
&nbsp;
#### Step 2: Install g++
1. Open a Terminal window.(One way is to press Command+Space, type Terminal in the search field, and press the Return key.)
1. In the Terminal window type `g++` and press the Return key. We will see an alert box like this:
1. {% include img.html src='macVSCodeSetup/image9.png' alt='a white terminal overlaid with error box stating The `g++` commmand requires the command line developer tools.  install button is highlighted.' caption='' %}
1. Choose Install to get only the command line tools unless you want to learn Xcode.
    1. Xcode can be installed later from the App Store.
    1. After installation, type `g++` in the Terminal, press the Return key, and verify the terminal prints the message, "no input files".
    1. `$ g++`
        1. see expected error `clang: error: no input files`
    1. {% include img.html src='macVSCodeSetup/image8.png' alt='white terminal typed g++ and returned error' caption='' %}

&nbsp;
&nbsp;
#### Step 3: Check your work Hello World
Get the hello world program working. If you are reading this for recitation 1, you will need to follow directions from your TA to submit your work as proof that VSCode is working on your personal computer.

&nbsp;
&nbsp;
#### Step 4: Install XCode
Please install XCode on your computer now. This is done via the App Store. The download take a while. Having this ready and up to date prevents issues down the road.

