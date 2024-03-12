import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickers_task/cubit/age_cubit.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AgeCubit, Duration>(
              builder: (context, state) {
                return Text(
                  'Your age is: ${state.inDays ~/ 365}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  context.read<AgeCubit>().changeAge(selectedDate);
                }
              },
              child: Text('Select your birth date'),
            ),
          ],
        ),
      ),
    );
  }
}
