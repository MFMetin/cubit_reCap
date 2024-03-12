import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<TextStyle> {
  FontCubit()
      : super(
          const TextStyle(),
        );

  void changeStyle(TextStyle textStyle) {
    emit(textStyle);
  }
}
