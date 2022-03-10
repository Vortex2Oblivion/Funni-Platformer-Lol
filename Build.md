THESE INSTRUCTIONS ARE FOR COMPILING THE GAME'S SOURCE CODE!!!

IF YOU WANT TO COMPILE THE GAME YOURSELF, CONTINUE READING!!!

Installing the Required Programs
First you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple).

Install Haxe
Install HaxeFlixel after downloading Haxe
You can use the library install scripts in the building folder if you want.

Other installations you'd need is the additional libraries, a fully updated list will be in Project.xml in the project root. Currently, these are all of the things you need to install:

flixelw

Compiling game
Once you have all those installed, it's pretty easy to compile the game. You just need to run 'lime test html5 -debug' in the root of the project to build and run the HTML5 version.

To run it from your desktop (Windows, Mac, Linux) it can be a bit more involved. For Linux, you only need to open a terminal in the project directory and run 'lime test linux -debug' and then run the executable file in export/release/linux/bin. For Windows, you need to install Visual Studio Community 2019. While installing VSC, don't click on any of the options to install workloads. Instead, go to the individual components tab and choose the following:

MSVC v142 - VS 2019 C++ x64/x86 build tools
Windows SDK (10.0.17763.0)
This will install about 22GB of crap, but once that is done you can open up a command line in the project's directory and run lime test windows -debug. Once that command finishes (it takes forever even on a higher end PC), you can run the game from the .exe file under export\release\windows\bin As for Mac, 'lime test mac -debug' should work, if not the internet surely has a guide on how to compile Haxe stuff for Mac.

Also, if you're building 32 bit, then you have to remove a specific line in the Project.xml file in the source code. It says where it is, just know that to build it 32 bit, you have to remove that line and then do lime test windows -debug -32.

Totally didnt steal this from leather engine lol.