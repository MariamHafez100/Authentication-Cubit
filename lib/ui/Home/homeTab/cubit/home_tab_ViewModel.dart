import 'package:ecommerce/domain/enities/CategoryEntity.dart';
import 'package:ecommerce/domain/usecase/get_all_Brands_UseCase.dart';
import 'package:ecommerce/ui/Home/homeTab/cubit/homeTabStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/get_all_Brands_UseCase.dart';
import '../../../../domain/usecase/get_all_Brands_UseCase.dart';
import '../../../../domain/usecase/get_all_category_usecase.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  getAllCategoryUseCase getAllCategoriesUseCase;
  getAllBrandsUseCase barndsUseCase;
  HomeTabViewModel({required this.getAllCategoriesUseCase,required this.barndsUseCase}):super(HomeTabInitialState());

  List<CategoryOrBrandsEntity> categories = [];
  List<CategoryOrBrandsEntity> brands = [];

  getCategory()async{
    emit(HomeTabLoadingState(loadingText: "LOADING..."));
    var either =await  getAllCategoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(errorText: l.errorText));
    }, (r){
      categories = r.data??[];
      if(brands.isNotEmpty){
        emit(HomeTabSuccState(categoryResponceEntity: r));
      }
      //emit(HomeTabSuccState(categoryResponceEntity: r));
    });
  }
  getBrands()async{
    emit(HomeTabLoadingState(loadingText: "LOADING..."));
    var either =await barndsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(errorText: l.errorText));
    }, (r){
      brands = r.data??[];
      if(categories.isNotEmpty){
        emit(HomeTabSuccState(categoryResponceEntity: r));
      }
     // emit(HomeTabSuccState(categoryResponceEntity: r));
    });
  }

}