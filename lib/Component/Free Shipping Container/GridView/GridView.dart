import 'package:flutter/material.dart';

import '../../../Model/Category Product/Category Product.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),

        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2, mainAxisSpacing: 20,crossAxisSpacing:10,mainAxisExtent: 400,),
        itemCount: 4,
        itemBuilder: (context, index) {


        final productName=CategoryProduct().CategoryName[index];
        final productImage=CategoryProduct().CategoryImage[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,

                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(productImage,height: 50,),
                    )
                  ],
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
            ],
          );
        });
  }
}
