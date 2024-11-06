import 'package:flutter/material.dart';
import 'package:biomark/routes/routes.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // Initialize Hive for web
  await Hive.initFlutter();

  // Open a box (a collection in Hive)
  await Hive.openBox('userBox');

  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RouteHandler();
  }
}
