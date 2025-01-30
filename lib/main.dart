import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/app_module.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyB62qjgrtv_mXEHiYvqAFjasMR9eyFm4Ug',
    appId: '1:560497112468:android:96e0be3e0eb847d3058b81',
    messagingSenderId: 'sendid',
    projectId: 'todo-list-provider-5107d',
    storageBucket: 'todo-list-provider-5107d.firebasestorage.app',
  )
  );

  runApp(AppModule());
}
