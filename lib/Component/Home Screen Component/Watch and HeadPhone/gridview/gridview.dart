
import 'package:copy/Colors/Colors.dart';
import 'package:copy/Model/Free%20Shipping/Free%20Shipping.dart';
import 'package:copy/State/Cart%20State/Cart%20State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../API call/API Call/Secend API Call.dart';
import '../../../../State/Home Screen How Much Item State/Home Screen How Much Item State.dart';
import '../../Details Screen/details screen.dart';

class GridViewItemForWH extends StatelessWidget {
  const GridViewItemForWH({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<secendAPICall>(builder: (context, provider, child) {
      return FutureBuilder(
          future: provider.getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 500,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                  Image: [],
                                  iMage: provider.productLIst[index].image.toString(),
                                  text:provider.productLIst[index].id.toString(),
                                  tag: provider.productLIst[index].category.toString(),
                                  brand: "Unnone",
                                  description:provider.productLIst[index].description.toString(),
                                  instack: true,
                                  name: provider.productLIst[index].title.toString(),
                                  price: provider.productLIst[index].price!.toInt(),
                                  rating: provider.productLIst[index].rating!.rate!.toInt(),


                                )));
                      },
                      child: Column(
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
                                          child: Image.network(
                                            provider
                                                .productLIst[index].image
                                                .toString(),
                                            height: 50,
                                            fit: BoxFit.fitHeight,
                                          )),
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
                                          height: 40,
                                          width: 40,
                                          child: Consumer<CartProvider>(builder: (context,providerCart,child){
                                            return FloatingActionButton(
                                              heroTag: "btn1$index",
                                              backgroundColor: AppColors.ButtonColor,
                                              onPressed: () {
                                                providerCart.addtoCart(
                                                    provider.productLIst[index].title.toString(),
                                                    provider.productLIst[index].price!.toInt(),
                                                    1,
                                                    provider.productLIst[index].image.toString());

                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            );
                                          },),
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
                                        provider.productLIst[index].title.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        "৳ " +
                                            provider.productLIst[index].price
                                                .toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      RatingBar.builder(
                                          itemSize: 20,
                                          initialRating:provider.productLIst![index].rating!.rate!.toDouble(),
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
                                        child: Consumer<
                                            Home_Screen_How_Much_Item_State>(
                                          builder: (context, provider, child) {
                                            return Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          Colors.grey.shade600),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
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
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 18),
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
                      ),
                    );
                  });
            }
          });
    });
  }
}
