// home_bloc.dart

import 'dart:async';
import 'package:JournalApp/services/authentication_api.dart';
import 'package:JournalApp/services/db_firestore_api.dart';
import 'package:JournalApp/models/journal.dart';

class HomeBloc {
  final DbApi dbApi;
  final AuthenticationApi authenticationApi;

  //// Controllers
  // Add journal entry
  final StreamController<List<Journal>> _journalController =
      StreamController<List<Journal>>.broadcast();
  Sink<List<Journal>> get _addListJournal => _journalController.sink;
  Stream<List<Journal>> get listJournal => _journalController.stream;

  // Delete journal entry
  final StreamController<Journal> _journalDeleteController =
      StreamController<Journal>.broadcast();
  Sink<Journal> get deleteJournal => _journalDeleteController.sink;

  HomeBloc(this.dbApi, this.authenticationApi) {
    _startListeners();
  }

  void dispose() {
    _journalController.close();
    _journalDeleteController.close();
  }

  void _startListeners() {
    // Retrieve Firestore Journal Records as List<Journal> not DocumentSnapshot
    authenticationApi.getFirebaseAuth().currentUser().then((user) {
      dbApi.getJournalList(user.uid).listen((journalDocs) {
        _addListJournal.add(journalDocs);
      });
      _journalDeleteController.stream.listen((journal) {
        dbApi.deleteJournal(journal);
      });
    });
  }
}
