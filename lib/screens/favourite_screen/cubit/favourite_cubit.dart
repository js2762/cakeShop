import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_cake_shop/models/cake_data.dart';
import 'package:online_cake_shop/screens/favourite_screen/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState>{
  FavouriteCubit() : super(FavouriteStateLoading());

  List<CakeData> favouriteItemList = [];
  List<CakeData> searchResults = [];
  TextEditingController searchControllerFavouriteItem = TextEditingController();
  bool isVisible = false;

  void addToFavourite(CakeData itemData) {
    bool isExist = false;
    for (var i = 0; i < favouriteItemList.length; i++) {
      if (favouriteItemList[i].name == itemData.name) {
        favouriteItemList.removeAt(i);
        isExist = true;
        break;
      }
    }
    if (!isExist) {
      favouriteItemList.add(itemData);
    }
    // cartItemList.add(itemMap);
    // print(cartItemList);
    emit(FavouriteStateLoaded(favouriteItemList));
  }

  void toggleVisibility(){
    isVisible = !isVisible;
    //print(isVisible);
    emit(FavouriteStateLoaded(favouriteItemList));
  }

  void searchedElement(String value){
    //searchResults.clear();
    if(value.isNotEmpty){
      searchResults = favouriteItemList.where((element) =>(element.name)!.toLowerCase().contains(value.toLowerCase())).toList();
    }else if(value == ''){
      searchResults = favouriteItemList;
    }
    emit(FavouriteStateLoaded(searchResults));
  }

  void removeFromFavourite(String name){
    // favouriteItemList2.removeWhere((element) => element.name == name);
    // favouriteItemList = favouriteItemList2;
    favouriteItemList.removeWhere((element) => element.name == name);
   // searchResults.removeWhere((element) => element.name == name);
   // print(searchResults);
    //print(cartItemList);
    emit(FavouriteStateLoaded(favouriteItemList));
  }
}

