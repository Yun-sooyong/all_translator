import 'package:all_translator/screens/home_screen.dart';
import 'package:all_translator/screens/result_screen.dart';
import 'package:all_translator/screens/splash_screen.dart';
import 'package:all_translator/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //
  //WidgetsFlutterBinding.ensureInitialized();

  //SystemChrome.restoreSystemUIOverlays(SystemUiOverlayStyle.light, );
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  // main run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'All-translator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
        ).copyWith(scaffoldBackgroundColor: foregroundColor),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen()
        //const SplashScreen(),
        );
  }
}
