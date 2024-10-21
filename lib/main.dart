import 'package:flame/Screens/HomePage.dart';
import 'package:flame/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'utils/Constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Constants constants=Constants();
  await Hive.initFlutter();
  await Hive.openBox(constants.databaseName);
  await Hive.openBox(constants.categoriesDb);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: containerColor
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
