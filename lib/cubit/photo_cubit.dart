import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoCubit extends Cubit<File?> {
  PhotoCubit() : super(null);

  void setPhoto(File newPhoto) {
    emit(newPhoto);
  }
}
