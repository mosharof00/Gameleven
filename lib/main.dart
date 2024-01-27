import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/data/models/item_provider.dart';
import 'package:gameleven/presentations/authScreens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        // ChangeNotifierProvider(create: (_) => CategoryItem()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gameleven',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
