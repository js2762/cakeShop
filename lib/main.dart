import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_cake_shop/resources/app_colors.dart';
import 'package:online_cake_shop/screens/cart_screen/cubit/cart_cubit.dart';
import 'package:online_cake_shop/screens/favourite_screen/cubit/favourite_cubit.dart';
import 'package:online_cake_shop/screens/favourite_screen/favourite_screen_view.dart';

//
import 'screens/home_screen/home_screen_view.dart';
import 'screens/home_screen/cubit/home_cubit.dart';
import 'screens/info_screen/info_screen_view.dart';
import 'screens/cart_screen/cart_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
          ..fetchList2(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Cake Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          useMaterial3: true,
        ),
        home: HomeScreenView(),
        routes: {
          HomeScreenView.routeName: (context) => HomeScreenView(),
          InfoScreenView.routeName: (context) =>
              InfoScreenView.builder(context),
          CartScreenView.routeName: (context) => const CartScreenView(),
          FavouriteScreenView.routeName: (context) => const FavouriteScreenView(),
        },
      ),
    );
  }
}
