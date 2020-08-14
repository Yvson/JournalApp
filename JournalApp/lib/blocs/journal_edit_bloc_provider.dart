// journal_edit_bloc_provider.dart
import 'package:flutter/material.dart';
import 'package:JournalApp/blocs/journal_edit_bloc.dart';

class JournalEditBlocProvider extends InheritedWidget {
  final JournalEditBloc journalEditBloc;

  const JournalEditBlocProvider({Key key, Widget child, this.journalEditBloc})
      : super(key: key, child: child);

  static JournalEditBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: JournalEditBlocProvider));
  }

  @override
  bool updateShouldNotify(JournalEditBlocProvider old) => false;
}
