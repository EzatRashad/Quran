import 'package:counter/data/local_data.dart';
import 'package:counter/models/verses_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/quran_api.dart';
import '../../models/quran_model.dart';
import 'get_quran_state.dart';

class GetQuranCubit extends Cubit<GetQuranState> {
  GetQuranCubit() : super(GetQuranInitial());
  static GetQuranCubit get(context) => BlocProvider.of(context);

  ChapterModel? cm;
  void getChapterData() async {
    emit(QuranLoadingStates());
    await DioHelper.getData(
      url: 'chapters',
      query: {
        'language': 'ar',
      },
    ).then((value) {
      cm = ChapterModel.fromJson(value.data);

      emit(QuranGetSuccessDataStates());
    }).catchError((error) {
      //print("ErrorChapter is : $error");
      emit(QuranGetErrorDataStates(error.toString()));
    });
  }

  VersesModel? versesModel;
  String? t;

  List v = [];
  getVersesData({required int chapterId, required int versesCount}) async {
    emit(VersesLoadingStates());
    final localSura = await DataManager.getData(chapterId.toString());
    if (localSura != null) {
      t = localSura;
      emit(VersesGetSuccessDataStates());
      return;
    }

    await DioHelper.getData(
      url: 'quran/verses/indopak',
      query: {'language': 'ar', 'chapter_number': chapterId},
    ).then((value) async {
      versesModel = VersesModel.fromJson(value.data);

      for (int i = 0; i < versesCount; i++) {
        final num = (i + 1).toString().toFarsi();
        v.add('${versesModel!.verses![i].textIndopak}\uFD3f$num\uFD3E');
      }
      t = v.join('');
      await DataManager.saveData(chapterId.toString(), t);
      emit(VersesGetSuccessDataStates());
    }).catchError((error) {
      //print("ErrorVerse is : $error");

      emit(VersesGetErrorDataStates(error.toString()));
    });
  }
}

extension ToFarsiNumber on String {
  String toFarsi() {
    const Map<String, String> numbers = {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    };

    return replaceAllMapped(
      RegExp('[0-9]'),
      (match) => numbers[this[match.start]]!,
    );
  }
}
