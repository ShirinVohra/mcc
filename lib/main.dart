import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jupygenix/api.dart';
import 'package:jupygenix/db/db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = MyDatabase();
    return MultiProvider(
      providers: [
        Provider.value(value: MyDatabase()),
        Provider.value(value: db.userDao),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroScreen(),
      ),
    );
  }
}
