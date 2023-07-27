import 'package:online_cake_shop/models/cake_data.dart';

abstract class FavouriteState {}

class FavouriteStateLoading extends FavouriteState {}

class FavouriteStateLoaded extends FavouriteState {
  final List<CakeData> favouriteItemList;

  FavouriteStateLoaded(this.favouriteItemList);
}