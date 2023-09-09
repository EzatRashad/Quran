import 'package:counter/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cashe.dart';


class MoodCubit extends Cubit<CounterStates> {
  MoodCubit() : super(CounterInitialState());

  // To use object in eny screen
  static MoodCubit get(context) => BlocProvider.of(context);


  // To Change the mood
  bool isdark = false;
  ThemeMode CTM = ThemeMode.dark;


  void changeMood({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(CounterChangeModeState());

    } else {
      isdark = !isdark;
      CashHelper.putData(key: 'isdark', value: isdark).then((value) {
        emit(CounterChangeModeState());
      });
    }
  }

}
