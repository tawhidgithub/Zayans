import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API call/API Call/API Call.dart';
import 'API call/API Call/Secend API Call.dart';
import 'State/Details State/Details state.dart';
import 'UI/Splash Screen/Splash Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => API_Call()),
        ChangeNotifierProvider(create: (_) => secendAPICall()),
        ChangeNotifierProvider(create: (_) => DetailsState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
