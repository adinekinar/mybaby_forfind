import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_baby/home_screen.dart';
import 'package:my_baby/widgets/user_pref_state.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await UserPrefState.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Baby',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'inter'
      ),
      home: const HomeScreen(),
    );
  }
}

