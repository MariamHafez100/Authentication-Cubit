import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/domain/enities/CategoryEntity.dart';
import 'package:ecommerce/ui/Home/homeTab/cubit/homeTabStates.dart';
import 'package:ecommerce/ui/Home/homeTab/cubit/home_tab_ViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget{
  HomeTabViewModel viewModel =
  HomeTabViewModel(getAllCategoriesUseCase: injectGetAllCatgoryUseCase(),barndsUseCase:injectBrandsUseCase());
  // CategoryEntity categoryEntity;
  // HomeTab({required this.categoryEntity});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: viewModel..getCategory()..getBrands(),
      builder: (context, state) =>
        viewModel.categories.isEmpty && viewModel.brands.isEmpty ?
            Center(child: CircularProgressIndicator(color: Colors.black,)) :
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                child: ImageSlideshow(
                  /// Width of the [ImageSlideshow].
                  width: double.infinity,

                  /// Height of the [ImageSlideshow].
                  height: 200,

                  /// The page to show when first creating the [ImageSlideshow].
                  initialPage: 0,

                  /// The color to paint the indicator.
                  indicatorColor: Color(0xff004182),
                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.white,

                  /// The widgets to display in the [ImageSlideshow].
                  /// Add the sample image file into the images folder
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/sale8.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/salal.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/sale2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],

                  /// Called whenever the page in the center of the viewport changes.
                  onPageChanged: (value) {
                    //print('Page changed: $value');
                  },

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 5000,

                  /// Loops back to first slide.
                  isLoop: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:12,left: 8,right: 10,bottom: 9),
                child: Row(
                  children: [
                    Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("VIEW ALL➡️",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                height: 250,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2

                ), itemBuilder:(context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        //child: Image.asset("assets/images/salal.jpg"),
                        backgroundImage: NetworkImage(viewModel.categories[index].image??""),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Text(viewModel.categories[index].name??"",
                          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                      )
                    ],
                  );
                },
                  itemCount: viewModel.categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:12,left: 8,right:10,bottom: 9),
                child: Row(
                  children: [
                    Text("BRANDS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("VIEW ALL➡️",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                height: 250,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2

                ), itemBuilder:(context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        //child: Image.asset("assets/images/salal.jpg"),

                        backgroundImage: NetworkImage(viewModel.brands[index].image??""),
                        maxRadius: 30,
                        //foregroundColor: Colors.black,
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      SizedBox(height: 10,),
                      Text(viewModel.brands[index].name??"",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 18,decoration: TextDecoration.underline,
                               decorationStyle: TextDecorationStyle.double ,backgroundColor: Colors.white12))
                    ],
                  );
                },
                  itemCount: viewModel.brands.length,
                  scrollDirection: Axis.horizontal,
                ),
              )

            ],
          ),
        )
    ,);

      SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0,left: 8.0),
            child: ImageSlideshow(
              /// Width of the [ImageSlideshow].
              width: double.infinity,

              /// Height of the [ImageSlideshow].
              height: 200,

              /// The page to show when first creating the [ImageSlideshow].
              initialPage: 0,

              /// The color to paint the indicator.
              indicatorColor: Color(0xff004182),
              /// The color to paint behind th indicator.
              indicatorBackgroundColor: Colors.white,

              /// The widgets to display in the [ImageSlideshow].
              /// Add the sample image file into the images folder
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/sale8.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/salal.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/sale2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],

              /// Called whenever the page in the center of the viewport changes.
              onPageChanged: (value) {
                //print('Page changed: $value');
              },

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 5000,

              /// Loops back to first slide.
              isLoop: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:12,left: 8,right: 8,bottom: 9),
            child: Row(
              children: [
                Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                Spacer(),
                Text("VIEW ALL",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            height: 200,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2

            ), itemBuilder:(context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    //child: Image.asset("assets/images/salal.jpg"),
                    backgroundImage: AssetImage('assets/images/salal.jpg'),
                  ),
                  Text("HELLO")
                ],
              );
            },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:12,left: 8,right: 8,bottom: 9),
            child: Row(
              children: [
                Text("BRANDS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                Spacer(),
                Text("VIEW ALL",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            height: 200,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2

            ), itemBuilder:(context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    //child: Image.asset("assets/images/salal.jpg"),
                    backgroundImage: AssetImage('assets/images/salal.jpg'),
                    maxRadius: 30,
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text("HELLO")
                ],
              );
            },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          )

        ],
      ),
    );
  }

}