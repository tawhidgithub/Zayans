import 'package:copy/Colors/Colors.dart';
import 'package:copy/Model/Category%20Product/Category%20Product.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.roboto(
                    fontSize: 28, fontWeight: FontWeight.w400),
              ),
              TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Show All",
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.ShowAllTextColor)),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 9,
                      )),
                      TextSpan(
                          text: ">",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.grey)),
                    ]),
                  ))
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CategoryProduct().CategoryName.length,
                itemBuilder: (context, index) {
                  final ProductName = CategoryProduct().CategoryName[index];
                  final Productimage = CategoryProduct().CategoryImage[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        DottedBorder(
                          dashPattern: [2,3,2,3],
                          borderType: BorderType.Circle,
                          color: AppColors.primaryColor,
                          child: Container(
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            margin: const EdgeInsets.all(10),
                            width: 100,
                            height: 80,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        color: AppColors.ContainerBackColor,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                    right: 0,
                                    left: 0,
                                    child: Image.asset(
                                  Productimage,
                                  height: 60,
                                )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ProductName,
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
