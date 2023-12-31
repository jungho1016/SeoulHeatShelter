import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoulheatshelter/data/repository_impl/location_repository_impl.dart';
import 'package:seoulheatshelter/data/repository_impl/shelter_repository_impl.dart';
import 'package:seoulheatshelter/domain/use_case/current_location_to_shelter_use_case.dart';
import 'package:seoulheatshelter/presentation/main/main_screen.dart';

import 'presentation/detail/detail_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => DetailViewModel(CurrentLocationTShelter(
          LocationRepositoryImple(), ShelterRepositoryImpl())),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Pretendard",
      ),
      home: const MainScreen(),
    );
  }
}
