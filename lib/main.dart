import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_parking_mobile/screens/overview_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
        runApp(const MyApp());
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 7, 125, 138),
        ),
      ),
      themeMode: ThemeMode.light,
      home: OverviewPage(),
    );
  }
}
