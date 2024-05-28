abstract class HomeScreenStates {}
class HomeScreenInitalState extends HomeScreenStates{}
class ChangeBottomNavigationBarState extends HomeScreenStates{}
class HomeTabInitialState extends HomeScreenStates{}
class HomeLoadingState extends HomeScreenStates{
  String? loadingText;
  HomeLoadingState({required this.loadingText});
}
class HomeErrorState extends HomeScreenStates{
  String? errorText;
  HomeErrorState({required this.errorText});
}
class HomeSuccState extends HomeScreenStates{
  ///responce
  // CategoryOrBrandsResponceEntity categoryResponceEntity;
  // HomeTabSuccState({required this.categoryResponceEntity});
}

