import 'package:carousel_slider/carousel_slider.dart';
import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../API call/API Model/API Model.dart';
import '../../../State/Cart State/Cart State.dart';
import '../../../State/Details State/Details state.dart';

class Details extends StatefulWidget {
  Details({
    super.key,
    required this.text,
    required this.Image,
    required this.tag,
    required this.price,
    required this.rating,
    required this.name,
    required this.brand,
    required this.description,
    required this.instack,
    this.iMage,
  });

  final text;
  List<String> Image = [];
  String? iMage;
  final String tag;
  final int rating;
  final String name;
  final int price;
  final String brand;
  final description;
  final dynamic instack;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Consumer<DetailsState>(
                    builder: (context, provider, child) {
                      return Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: widget.Image?.length ?? 1,
                            itemBuilder: (context, index, realindex) {
                              final SingelImage = widget.Image == null || widget.Image!.isEmpty
                                  ?widget.iMage ==null || widget.iMage!.isEmpty ?  "https://www.shutterstock.com/image-vector/picture-vector-icon-no-image-600nw-1350441335.jpg":widget.iMage
                                  : widget.Image![index];
                              return BuildImg(SingelImage!);
                            },
                            options: CarouselOptions(
                                scrollDirection: Axis.horizontal,
                                aspectRatio: 16 / 5,
                                height: 500,
                                viewportFraction: 1,
                                autoPlay: false,
                                autoPlayInterval: Duration(seconds: 3),
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reson) {
                                  provider.setonPageChange(index);
                                }),
                          ),
                          Positioned(
                              bottom: 20,
                              left: 20,
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  "${provider.onPageChange}" +
                                      "/" +
                                      "${widget.Image!.length - 1}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                              ))
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      children: [
                                    TextSpan(
                                      text: widget.tag,
                                    ),
                                    TextSpan(
                                      text: " |",
                                    ),
                                  ],
                                      style: GoogleFonts.roboto(
                                          color: AppColors.primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300))),
                              Row(
                                children: [
                                  RatingBar.builder(
                                      direction: Axis.horizontal,
                                      minRating: 1,
                                      initialRating:
                                          widget.rating - 1.toDouble(),
                                      itemSize: 20,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          Icons.star_outline,
                                          color: AppColors.RatingIconColor,
                                        );
                                      },
                                      onRatingUpdate: (rating) {}),
                                  Text(
                                    "(${widget.rating})",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              widget.name,
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ " + widget.price.toString(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w300),
                              ),
                              widget.instack == 0
                                  ? Text("out of stock",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.red))
                                  : Text(
                                      "in stock",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.green),
                                    ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Container(
                              child: Text(
                                widget.description,
                                style: GoogleFonts.roboto(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discription",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text(">",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Addition Information",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text(">",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reviews",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text(">",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<CartProvider>(builder: (context, provider, child) {
                    return InkWell(
                      onTap: () {
                        provider.addtoCart(
                            widget.name,
                            widget.price,
                            1,
                            widget.Image == null || widget.Image!.isEmpty
                                ? "https://www.shutterstock.com/image-vector/picture-vector-icon-no-image-600nw-1350441335.jpg"
                                : widget.Image![1]);
                        provider.calculate();
                      },
                      child: Ink(
                        height: 60,
                        width: 215,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text("Add to Cart",
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                      ),
                    );
                  }),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      height: 60,
                      width: 215,
                      decoration: BoxDecoration(
                          color: AppColors.ButtonColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Bye Now",
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BuildImg(String singleImage) {
    return Container(
      child: Image.network(
        singleImage,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
