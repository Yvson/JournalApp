// main.dart
import 'package:flutter/material.dart';
import 'package:JournalApp/blocs/authentication_bloc.dart';
import 'package:JournalApp/blocs/authentication_bloc_provider.dart';
import 'package:JournalApp/blocs/home_bloc.dart';
import 'package:JournalApp/blocs/home_bloc_provider.dart';
import 'package:JournalApp/services/authentication.dart';
import 'package:JournalApp/services/db_firestore.dart';
import 'package:JournalApp/pages/home.dart';
import 'package:JournalApp/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
        AuthenticationService();
    final AuthenticationBloc _authenticationBloc =
        AuthenticationBloc(_authenticationService);

    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
        initialData: null,
        stream: _authenticationBloc.user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.purple.shade100,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return HomeBlocProvider(
              homeBloc: HomeBloc(DbFirestoreService(),
                  _authenticationService), // Inject the DbFirestoreService() & AuthenticationService()
              uid: snapshot.data,
              child: _buildMaterialApp(Home()),
            );
          } else {
            return _buildMaterialApp(Login());
          }
        },
      ),
    );
  }

  MaterialApp _buildMaterialApp(Widget homePage) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple.shade50,
        bottomAppBarColor: Colors.purple,
      ),
      home: homePage,
    );
  }
}
