import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screen/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_to_do_list/auth/main_page.dart';
import 'package:flutter_to_do_list/firebase_options.dart';
import 'package:flutter_to_do_list/screen/splashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
