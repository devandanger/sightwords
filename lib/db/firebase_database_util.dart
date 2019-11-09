import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
//import 'package:sightwords/db/models/word.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _wordsRef;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    _wordsRef = FirebaseDatabase.instance.reference().child('words');

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  DatabaseError getError() {
    return error;
  }

  DatabaseReference getWords() {
    return _wordsRef;
  }

  // add(Word word) async {
  //   final TransactionResult transactionResult =
  //       await _counterRef.runTransaction((MutableData mutableData) async {
  //     mutableData.value = (mutableData.value ?? 0) + 1;

  //     return mutableData;
  //   });

  //   if (transactionResult.committed) {
  //     _userRef.push().set(<String, String>{
  //       "name": "" + user.name,
  //       "age": "" + user.age,
  //       "email": "" + user.email,
  //       "mobile": "" + user.mobile,
  //     }).then((_) {
  //       print('Transaction  committed.');
  //     });
  //   } else {
  //     print('Transaction not committed.');
  //     if (transactionResult.error != null) {
  //       print(transactionResult.error.message);
  //     }
  //   }
  // }

  // void delete(Word user) async {
  //   await _userRef.child(user.id).remove().then((_) {
  //     print('Transaction  committed.');
  //   });
  // }

  // void update(Word word) async {
  //   await _userRef.child(word.id).update({
  //     "name": "" + word.name
  //   }).then((_) {
  //     print('Transaction  committed.');
  //   });
  // }

  void dispose() {
    _messagesSubscription.cancel();
  }
}