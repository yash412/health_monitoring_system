import 'package:health_monitoring_system/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';

Future<void >main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize,
        builder: (context, snapshot){
      if(snapshot.hasError){
        print("Something wrong");
      }
      if(snapshot.connectionState == ConnectionState.done){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Healthcare - Doctor Consultation App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: primaryColor,
            textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.all(defaultPadding),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: textFieldBorder,
              enabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
            ),
          ),
          home: const WelcomeScreen(),
        );
      }
      return const CircularProgressIndicator();
    });
  }
}
