import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickers_task/cubit/color_cubit.dart';
import 'package:pickers_task/cubit/font_cubit.dart';
import 'package:pickers_task/cubit/photo_cubit.dart';
import 'package:pickers_task/cubit/age_cubit.dart';
import 'package:pickers_task/screens/age_screen.dart';
import 'package:pickers_task/screens/color_screen.dart';
import 'package:pickers_task/screens/font_screen.dart';
import 'package:pickers_task/screens/photo_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(builder: (context, state) {
      return Scaffold(
        backgroundColor: context.read<ColorCubit>().state,
        body: Center(
          child: BlocBuilder<PhotoCubit, File?>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(state),
                        radius: 50,
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 10),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.photo,
                          size: 50,
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<FontCubit, TextStyle>(
                  builder: (context, state) {
                    return Text(
                      'Name: Furkan Metin',
                      style: context.read<FontCubit>().state,
                    );
                  },
                ),
                const SizedBox(height: 10),
                BlocBuilder<AgeCubit, Duration>(
                  builder: (context, state) {
                    final ageInYears = state.inDays ~/ 365;
                    return Text(
                      'Age: $ageInYears',
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoScreen(),
                      ),
                    );
                  },
                  child: const Text('Choose Photo'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FontScreen(),
                      ),
                    );
                  },
                  child: const Text('Choose Font'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AgeScreen(),
                      ),
                    );
                  },
                  child: const Text('Choose Age'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ColorScreen(), // ColorScreen'e geçiş
                      ),
                    );
                  },
                  child: Text('Choose Color'), // Buton metni
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
