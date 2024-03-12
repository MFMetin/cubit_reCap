import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickers_task/cubit/font_cubit.dart';

class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.read<FontCubit>().changeStyle(
                      const TextStyle(
                          fontFamily: 'Roboto', fontStyle: FontStyle.italic),
                    );
              },
              child: Text(
                'Italic',
                style: context.read<FontCubit>().state,
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<FontCubit>().changeStyle(
                      const TextStyle(fontWeight: FontWeight.bold),
                    );
              },
              child: Text(
                'Bold',
                style: context.read<FontCubit>().state,
              ),
            )
          ],
        ),
      ),
    );
  }
}
