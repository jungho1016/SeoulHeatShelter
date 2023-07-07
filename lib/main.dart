import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoulheatshelter/presentation/main/main_screen.dart';

import 'presentation/detail/detail_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => DetailViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
