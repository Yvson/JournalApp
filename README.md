# JournalApp (Android Version)
This app was originally created by Marco L. Napoli (@JediPixels) in his book entitled "Beginning Flutter: A Hands On Guide To App Development" and slightly modified by me.



## Basic requirements
If you want to try to run this app by your own, you should follow the steps below.

### Create a new Firebase Project
Go to [Firebase](https://console.firebase.google.com) and create a new project. Important things to do:
1) Download the `google-services.json` file and replace the one found in `\JournalApp\android\app` by the downloaded one.
2) Go to the Authentication tab on the Firebase console and enable the Email/Password option.
3) Go to the Database and create one. For the Security Rules, choose "Start in locked mode" and paste the following code:

```rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /journals/{document=**} {
      allow read, write: if resource.data.uid == request.auth.uid;
      allow create: if request.auth.uid != null;
    }
  }
}
```
### Setting build.gradle

1) Open the file `\JournalApp\android\app\build.gradle`

2) In the line 41, replace the Android Package Name (in double quotes)  `applicationId "com.domainname.journal"` with the one you chose in the firebase project configuration.

## Screens
Login Page

![LoginPage][]

Home Page

![HomePage][]

Add/Edit Page

![AddEditEntryPage][]

## [Architecture Diagram](https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/Journal.drawio)
BLoC Pattern + Provider (InheritedWidget) + Firebase (Data Service)
![Journal][]




[LoginPage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/loginPage.png
[HomePage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/homePage.png
[AddEditEntryPage]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/addEditEntryPage.png
[Journal]: https://github.com/Yvson/JournalApp/blob/master/ArchitectureScreens/Journal.png
