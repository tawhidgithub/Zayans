import 'package:copy/Colors/Colors.dart';
import 'package:copy/Model/Free%20Shipping/Free%20Shipping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Model/Category Product/Category Product.dart';
import '../../../State/Home Screen How Much Item State/Home Screen How Much Item State.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          mainAxisExtent: 450,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final productName = Free_Shipping().free_Shipping_List[index]["name"];
          final productImage =
              Free_Shipping().free_Shipping_List[index]["image"];
          final productPrice =
              Free_Shipping().free_Shipping_List[index]["price"];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 400,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 230,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.asset(
                              productImage,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 2,
                            right: 2,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  size: 25,
                                  color: Colors.black,
                                ))),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                backgroundColor: AppColors.ContainerBackColor,
                                onPressed: () {},
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: GoogleFonts.roboto(
                                fontSize: 19, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "৳ " + productPrice,
                            style: GoogleFonts.roboto(
                                fontSize: 19, fontWeight: FontWeight.w400),
                          ),
                          RatingBar.builder(
                              itemSize: 20,
                              initialRating: 0,
                              minRating: 1,
                              itemCount: 5,
                              direction: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star_border_outlined,
                                  color: AppColors.RatingIconColor,
                                );
                              },
                              onRatingUpdate: (rating) {}),
                          SizedBox(
                            height: 20,
                          ),
                          ChangeNotifierProvider(
                            create: (context) =>
                                Home_Screen_How_Much_Item_State(),
                            child: Consumer<Home_Screen_How_Much_Item_State>(
                              builder: (context, provider, child) {
                                return Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey.shade600),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            provider.setremoveCount();
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20,
                                          )),
                                      Text(
                                        provider.Count.toString(),
                                        style: GoogleFonts.roboto(fontSize: 18),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            provider.setAddCount();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
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
