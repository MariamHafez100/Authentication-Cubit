import 'package:flutter/material.dart';

class ProductTabView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,crossAxisSpacing: 6,mainAxisSpacing: 8
        ), itemBuilder: (context, index) {
          return Container(
            //height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.blue),
              //border: Border.all(color: Colors.grey),
              // borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset("assets/images/salal.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
               // SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("zft"),
                      Text("itran"),
                      Text("nela"),
                      //SizedBox(height: 3),
                      Row(
                        children: [
                          Text('Review  (4.6)'),
                          Icon(Icons.star,size: 16),
                          Spacer(),

                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
        itemCount: 10,
        ),
      ),
    );
  }

}