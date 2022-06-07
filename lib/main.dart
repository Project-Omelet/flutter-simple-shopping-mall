import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/models/model_auth.dart';
import 'package:simple_shopping/models/model_item_provider.dart';
import 'package:simple_shopping/screens/screen_detail.dart';
import 'package:simple_shopping/screens/screen_index.dart';
import 'package:simple_shopping/screens/screen_register.dart';
import 'package:simple_shopping/screens/screen_search.dart';
import 'package:simple_shopping/screens/screen_splash.dart';
import 'package:simple_shopping/screens/screen_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Shopping Mall',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/index': (context) => const IndexScreen(),
          '/register': (context) => const RegisterScreen(),
          '/search': (context) => const SearchScreen(),
          '/detail': (context) => const DetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
