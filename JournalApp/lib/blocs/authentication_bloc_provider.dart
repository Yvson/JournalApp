// authentication_bloc_provider.dart
import 'package:flutter/material.dart';
import 'package:JournalApp/blocs/authentication_bloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;

  const AuthenticationBlocProvider(
      {Key key, Widget child, this.authenticationBloc})
      : super(key: key, child: child);

  static AuthenticationBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: AuthenticationBlocProvider));
  }

  @override
  bool updateShouldNotify(AuthenticationBlocProvider old) =>
      authenticationBloc != old.authenticationBloc;
}
