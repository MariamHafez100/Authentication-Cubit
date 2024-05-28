import 'package:ecommerce/ui/Home/product/ProductTab.dart';
import 'package:ecommerce/ui/Home/cubit/homeScreenStates.dart';
import 'package:ecommerce/ui/Home/favouriteTab.dart';
import 'package:ecommerce/ui/Home/homeTab/HomeTabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profileTab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitalState());
  int selectedIndex =0;
  List<Widget> tabs = [
    HomeTab(),
    ProductTabView(),
    FavouriteTab(),
    ProfileTab()
  ];

  void changeBottomNavigationBar(int newSelectedIndex){
    HomeScreenInitalState;
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());

  }

}