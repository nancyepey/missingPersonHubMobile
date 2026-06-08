import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:missingpeoplehub/core/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('appBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/*void main() {
  //runApp(const MyApp());

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Missing People Hub',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      initialRoute: AppRoutes.logo,
      routes: AppRoutes.routes,
    );
  }
}
