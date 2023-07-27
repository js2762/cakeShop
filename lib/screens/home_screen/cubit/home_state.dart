import 'package:online_cake_shop/models/cake_data.dart';

abstract class HomeState {}

//enum HomeState {initial, gained, lost}
class HomeStateLoading extends HomeState {}

class HomeStateLoaded1 extends HomeState {
  final List<Map<String, String>> itemList1;

  HomeStateLoaded1(this.itemList1);
}

class HomeStateLoaded2 extends HomeState {
   List<CakeData> itemList2;

  HomeStateLoaded2(this.itemList2);
}
