
import 'package:ecommerce/ui/Home/cubit/homeScreenStates.dart';
import 'package:ecommerce/ui/Home/cubit/homeScreenViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
      return Scaffold(
        bottomNavigationBar:
        Container(
          decoration: BoxDecoration(
            color: Color(0xff004182),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),

          child: BottomNavigationBar(
            onTap: (index){
              viewModel.changeBottomNavigationBar(index);
            },
            // currentIndex: selected,
            // onTap: (index) {
            //   selected = index;
            //   setState(() {});
            // },
            type: BottomNavigationBarType.fixed, // Add this line
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon:
                  viewModel.selectedIndex == 0?
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
              child: Icon(Icons.home,color: Color(0xff004182)),):
                  Icon(Icons.home),
                label: ""

              ),
              BottomNavigationBarItem(icon:
              viewModel.selectedIndex == 1?
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                child: Icon(Icons.category_rounded,color: Color(0xff004182)),):
              Icon(Icons.category_rounded),label: ""),

              BottomNavigationBarItem(icon:
              viewModel.selectedIndex == 2?
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                child: Icon(Icons.heart_broken,color: Color(0xff004182)),):
              Icon(Icons.heart_broken),label: ""),

              BottomNavigationBarItem(icon:
              viewModel.selectedIndex == 3?
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                child: Icon(Icons.person,color: Color(0xff004182)),):
              Icon(Icons.person),label: ""),


            ],
          ),
        ) ,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.13,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/up.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            gapPadding: 10,
                              borderSide:
                              BorderSide(color: Color(0xff004182), width: 10),
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          hintText: "What do you search for?",
                          prefixIcon: Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                    //Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Icon(Icons.shopping_cart,color: Color(0xff004182),)
                  ],
                ),
              ),
            ],
          ),
        ),
        body: viewModel.tabs[viewModel.selectedIndex]
      );
    },);

  }
}
