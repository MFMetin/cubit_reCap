import 'package:flutter_bloc/flutter_bloc.dart';

class AgeCubit extends Cubit<Duration> {
  AgeCubit()
      : super(
          const Duration(),
        );

  void changeAge(DateTime dateTime) {
    final calculatedAge = DateTime.now().difference(dateTime);

    emit(calculatedAge);
  }
}
