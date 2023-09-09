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
      print(value.data);

      emit(QuranGetSuccessDataStates());
    }).catchError((error) {
      print("ErrorChapter is : $error");
      emit(QuranGetErrorDataStates(error.toString()));
    });
  }

  VersesModel? versesModel;
  String? t;
  int? chapterid = 2;
  int? versescount = 286;
  List v = [];
  void getVersesData() async {
    emit(VersesLoadingStates());
    await DioHelper.getData(
      url: 'quran/verses/indopak',
      query: {'language': 'ar', 'chapter_number': chapterid},
    ).then((value) {
      versesModel = VersesModel.fromJson(value.data);

      for (int i = 0; i < versescount!; i++) {
        v.add(
            '${versesModel!.verses![i].textIndopak}\uFD3f${(i + 1).toString()}\uFD3E');
      }
      t = v.join('');
      print(value.data);

      emit(VersesGetSuccessDataStates());
    }).catchError((error) {
      print("ErrorVerse is : $error");
      print(chapterid);
      print(t);
      emit(VersesGetErrorDataStates(error.toString()));
    });
  }
}
