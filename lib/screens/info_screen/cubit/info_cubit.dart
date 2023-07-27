import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCubit extends Cubit<int>{
  InfoCubit() : super(0);

  int itemCount = 0;

  void increment(){
    itemCount = itemCount + 1;
    emit(state + 1);
  }

  void decrement(){
    if(state > 0){
      itemCount = itemCount - 1;
    emit(state - 1);
    }else {
      itemCount = 0;
      emit(0);
    }
  }
}