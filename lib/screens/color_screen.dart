import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pickers_task/cubit/color_cubit.dart';

// Renk Seçici Ekran
class ColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Renk Gösterme Alanı
            BlocBuilder<ColorCubit, Color>(
              builder: (context, currentColor) => Container(
                width: 200,
                height: 200,
                color: currentColor,
              ),
            ),
            SizedBox(height: 20),
            // Renk Seçici Düğme
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pick a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor:
                              BlocProvider.of<ColorCubit>(context).state,
                          onColorChanged: (color) {
                            BlocProvider.of<ColorCubit>(context)
                                .changeColor(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Pick a color'),
            ),
          ],
        ),
      ),
    );
  }
}
