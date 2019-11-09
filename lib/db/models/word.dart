import 'package:firebase_database/firebase_database.dart';

class Word {
  String _name;

  Word(this._name);
  String get name => _name;

  Word.fromSnapshot(DataSnapshot snapshot) {
    _name = snapshot.value['name'];
  }
}