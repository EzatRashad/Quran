
abstract class GetQuranState {}

 class GetQuranInitial extends GetQuranState {}
 class QuranLoadingStates extends GetQuranState{}
class QuranGetSuccessDataStates extends GetQuranState{}
class QuranGetErrorDataStates extends GetQuranState{
  late final String error;
  QuranGetErrorDataStates(this.error);
}


 class VersesLoadingStates extends GetQuranState{}
class VersesGetSuccessDataStates extends GetQuranState{}
class VersesGetErrorDataStates extends GetQuranState{
  late final String error;
  VersesGetErrorDataStates(this.error);
}
