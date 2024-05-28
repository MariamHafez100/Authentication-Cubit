import '../../../../domain/enities/CategoryEntity.dart';

abstract class HomeTabStates{}
class HomeTabInitialState extends HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{
  String? loadingText;
  HomeTabLoadingState({required this.loadingText});
}
class HomeTabErrorState extends HomeTabStates{
  String? errorText;
  HomeTabErrorState({required this.errorText});
}
class HomeTabSuccState extends HomeTabStates{
  ///responce
  CategoryOrBrandsResponceEntity categoryResponceEntity;
  HomeTabSuccState({required this.categoryResponceEntity});
}
