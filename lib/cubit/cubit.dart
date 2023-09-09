import 'dart:convert';
import 'package:counter/cubit/state.dart';
import 'package:counter/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/azkar_model.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counternum = 0;
  bool vibrate = true;
  void changev() {
    vibrate ? null : HapticFeedback.vibrate();
    emit(CounterPlusState(counternum));
  }

  void plus() {
    counternum++;
    vibrate ? HapticFeedback.vibrate() : null;
    emit(CounterPlusState(counternum));
  }

  void zero() {
    counternum = 0;
    vibrate ? HapticFeedback.vibrate() : null;

    emit(CounterzeroState(counternum));
  }

  void modee() {
    dTheme ? false : true;
    emit(CounterChangeModeState());
  }

  Future<List<AzkarM>> getData() async {
    String jsonData = await rootBundle.loadString('assets/myjson/azkar.json');
    List<AzkarM> jsonList = [];
    List<dynamic> myJsonDecode = json.decode(jsonData) as List<dynamic>;

    for (var e in myJsonDecode) {
      jsonList.add(AzkarM.fromMap(e));
    }
    emit(CounterGetDataState());
    return jsonList;
  }
}
