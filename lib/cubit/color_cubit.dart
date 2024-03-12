import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit(super.initialState);

  void changeColor(Color color) {
    emit(color);
  }
}
