import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickers_task/cubit/age_cubit.dart';
import 'package:pickers_task/cubit/color_cubit.dart';

import 'package:pickers_task/cubit/font_cubit.dart';
import 'package:pickers_task/cubit/photo_cubit.dart';

import 'package:pickers_task/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotoCubit(),
        ),
        BlocProvider(
          create: (context) => FontCubit(),
        ),
        BlocProvider(
          create: (context) => AgeCubit(),
        ),
        BlocProvider(
          create: (context) => ColorCubit(Colors.white),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Development Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
