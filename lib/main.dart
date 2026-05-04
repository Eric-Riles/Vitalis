import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/login_page.dart';
import 'firebase_options.dart'; // Import the generated file


void main() async{
 WidgetsFlutterBinding.ensureInitialized(); 

  // 3. Lock to specific orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
            fontFamily: 'Dropline',
          ),
          home: LoginPage(),
        );
      }
    );
  }
}