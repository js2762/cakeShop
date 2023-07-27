import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_cake_shop/models/cake_data.dart';
import 'package:online_cake_shop/resources/app_colors.dart';
import 'package:online_cake_shop/resources/app_images.dart';
import 'package:online_cake_shop/screens/home_screen/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateLoading());

  int selectedIndex = 0;
  List<Map<String, String>> myList1 = [
    {'name': 'Cakes', 'imagePath': AppImages.weddingCakeIcon},
    {'name': 'Pastry', 'imagePath': AppImages.strawberryCakeIcon},
    {'name': 'Cup-Cake', 'imagePath': AppImages.cupCakeIcon},
    {'name': 'Ice-Cream Cake', 'imagePath': AppImages.iceCreamIcon},
  ];
  List<CakeData> myList2 = [
    CakeData(
      name: 'Princess Birthday Cake',
      imagePath: AppImages.princessCake,
      price: 250.60,
      flavour: 'Strawberry',
      rating: 4.5,
      bgColor: AppColors.lightPinkBackGroundColor,
      color: Colors.pinkAccent,
      description:
      "The Princess cake is a regal treat fit for royalty. It boasts layers of moist sponge cake filled with luscious layers of jam and rich vanilla custard. Adorned with a velvety blanket of pastel-colored marzipan, the cake is elegantly shaped into a dome, resembling a princess's crown. A delicate dusting of powdered sugar adds a touch of enchantment. With its exquisite taste and enchanting appearance, the Princess cake is a dreamy indulgence that will transport you to a fairytale realm with every bite.",
      favouriteStatus: false,
    ),
    CakeData(
      name: 'Birthday Cake',
      imagePath: AppImages.yellowCake,
      price: 450.20,
      flavour: 'Mango',
      rating: 4.2,
      bgColor: const Color.fromARGB(255, 246, 233, 136),
      color: const Color.fromARGB(255, 213, 192, 13),
      description:
      "The birthday cake is a celebratory delight that brings joy to any special occasion. It is a decadent masterpiece with layers of moist cake, generously frosted with creamy buttercream. The cake can be customized to suit personal preferences, with options ranging from classic flavors like chocolate or vanilla to more adventurous choices like red velvet or funfetti. Topped with colorful sprinkles and adorned with candles, the birthday cake is a symbol of love and celebration. Whether it's a simple sheet cake or an elaborately decorated tiered masterpiece, this cake is the perfect centerpiece for a memorable birthday celebration.",
      favouriteStatus: false,
    ),
    CakeData(
      name: 'Barbie Doll Cake',
      imagePath: AppImages.barbieCake,
      price: 840.20,
      flavour: 'Creamy',
      rating: 4.8,
      bgColor: AppColors.lightPinkBackGroundColor,
      color: Colors.pinkAccent,
      description:
      "The Barbie Doll cake is a whimsical and enchanting creation that combines the joy of baking with the magic of childhood. This cake features a Barbie doll as the centerpiece, with her flowing gown made from layers of moist cake. The cake is expertly carved and sculpted to create the shape of a flowing dress, which is then frosted and decorated with vibrant colors and intricate details. The Barbie doll becomes the star of the show as she is surrounded by a delectable cake that captures the imagination and brings smiles to faces. It is a delightful treat for birthday parties and any celebration where a touch of wonder is desired.",
      favouriteStatus: false,
    ),
    CakeData(
      name: 'Wedding Cake',
      imagePath: AppImages.weddingCake,
      price: 280.60,
      flavour: 'Creamy',
      rating: 4.4,
      bgColor: const Color.fromARGB(255, 209, 199, 239),
      color: Colors.deepPurple,
      description:
      "The wedding cake is a grand and elegant centerpiece that symbolizes the union of two souls in matrimony. It is a multi-tiered masterpiece, meticulously crafted with layers of moist cake and sumptuous fillings. The cake is adorned with intricate designs, delicate piping, and exquisite fondant work, showcasing the couple's unique style and theme. Often embellished with beautiful sugar flowers, pearls, or other decorative elements, the wedding cake exudes romance and sophistication. It is a sweet finale to the celebration, inviting guests to indulge in its heavenly flavors and creating lasting memories of a joyous occasion.",
      favouriteStatus: false,
    ),
  ];

  void fetchList1() {

    emit(HomeStateLoaded1(myList1));
  }

  void fetchList2() {
    emit(HomeStateLoaded2(myList2));
  }

  void selectCategory(int index) {
    // if (state is HomeStateLoaded1) {
    //   selectedIndex = index;
    //   //print(selectedIndex);
    //   emit(HomeStateLoaded1((state as HomeStateLoaded1).itemList1));
    // }
    selectedIndex = index;
    emit(HomeStateLoaded1(myList1));
  }

  void updateFavouriteStatus(int index){
    // if (state is HomeStateLoaded2){
    //   List<CakeData> updatedItemList2 = (state as HomeStateLoaded2).itemList2;
    //   updatedItemList2[index].favouriteStatus = !(updatedItemList2[index].favouriteStatus as bool);
    //   //(state as HomeStateLoaded2).itemList2 = updatedItemList2;
    //   emit(HomeStateLoaded2(updatedItemList2));
    // }
    List<CakeData> updatedList = List.from(myList2);
    updatedList[index].favouriteStatus = !(updatedList[index].favouriteStatus as bool);
    emit(HomeStateLoaded2(updatedList));
  }

  void updateFavouriteStatus2(String name){
    for (var element in myList2) {
      if(element.name == name){
        element.favouriteStatus = false;
      }
    }
    emit(HomeStateLoaded2(myList2));
  }
}
