# JournalApp
This app was originally created by Marco L. Napoli (@JediPixels) in his book entitled "Beginning Flutter: A Hands On Guide To App Development" and slightly modified by me.



## Basic requirements
If you want to try to run this app by your own, you should follow the steps below.

### Create a new Firebase Project


### Replace google-services.json


### Setting build.gradle

1) Open the file `\JournalApp\android\app\build.gradle`

2) In the line 41, replace the Android Package Name (double quotes)  `applicationId "com.domainname.journal"` with the oen you chose in the firebase project configuration.

## Screens
Login Page, Home Page, and Add/Edit Page respectively.
![LoginPage][]      
![HomePage][]
![AddEditEntryPage][]
## Architecture Diagram
BLoC Pattern + Provider (InheritedWidget) + Firebase (Data Service)
![Journal][]



## 

[LoginPage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/LoginPage.png
[HomePage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/HomePage.png
[AddEditEntryPage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/AddEditEntryPage.png
[Journal]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/Journal.png
