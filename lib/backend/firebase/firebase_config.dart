import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCangRwJtmoL46Zftvt8wbUctJpRDgNats",
            authDomain: "todo-xq05fp.firebaseapp.com",
            projectId: "todo-xq05fp",
            storageBucket: "todo-xq05fp.appspot.com",
            messagingSenderId: "463394249820",
            appId: "1:463394249820:web:a2d5bf65efc6f1b7575a99"));
  } else {
    await Firebase.initializeApp();
  }
}
