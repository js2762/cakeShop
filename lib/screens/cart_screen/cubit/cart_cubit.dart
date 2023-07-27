import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_cake_shop/models/cake_data.dart';
import 'package:online_cake_shop/screens/cart_screen/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateLoading());

  List<Map<String, dynamic>> cartItemList = [];
  List<Map<String, dynamic>> searchResults = [];
  TextEditingController searchControllerCartItem = TextEditingController();
  bool isVisible = false;

  void addToCart(Map<String, dynamic> itemMap) {
    bool isExist = false;
    for (var i = 0; i < cartItemList.length; i++) {
      if ((cartItemList[i]['itemData'] as CakeData).name ==
          (itemMap['itemData'] as CakeData).name) {
        cartItemList[i] = itemMap;
        isExist = true;
        break;
      }
    }
    if (!isExist) {
      cartItemList.add(itemMap);
    }
    // cartItemList.add(itemMap);
    // print(cartItemList);
    emit(CartStateLoaded(cartItemList));
  }

  void toggleVisibility(){
    isVisible = !isVisible;
    //print(isVisible);
    emit(CartStateLoaded(cartItemList));
  }

  // void fetchCartItems(){
  //   emit(CartStateLoaded(cartItemList));
  // }

  void searchedElement(String value){
   //searchResults.clear();
    if(value.isNotEmpty){
      searchResults = cartItemList.where((element) =>(element['itemData'] as CakeData).name!.toLowerCase().contains(value.toLowerCase())).toList();
    }else if(value == ''){
      searchResults = cartItemList;
    }
    emit(CartStateLoaded(searchResults));
  }

  void removeFromCart(String name){
    // cartItemList2.removeAt(index);
    // cartItemList = cartItemList2;
    //print(cartItemList);
    cartItemList.removeWhere((element) => element['itemData'].name == name);
    emit(CartStateLoaded(cartItemList));
  }
}
