import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Model/Product/Product.dart';
import '../../../State/Home Header Slider State/Home Header Slider State.dart';
import '../../../State/Home Page Controller/Home Controller.dart';

class HomeScreen_Add_Bar extends StatefulWidget {
  const HomeScreen_Add_Bar({super.key});

  @override
  State<HomeScreen_Add_Bar> createState() => _HomeScreen_Add_BarState();
}

class _HomeScreen_Add_BarState extends State<HomeScreen_Add_Bar> {
  homeScreenController homePageController = Get.put(homeScreenController());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Home_Header_Slider_State(),
      child: Consumer<Home_Header_Slider_State>(
        builder: (context, provide, child) {
          return StreamBuilder(
              stream: homePageController.reference.onValue,
              builder: (context, snapshot) {
                if (snapshot != null && snapshot.hasData) {
                  dynamic data = snapshot.data!.snapshot.value;

                  if(data is List){
                    List <dynamic> dataList=data.cast<dynamic>();
                    return Stack(children: [
                      CarouselSlider.builder(
                        itemCount: dataList.length,
                        options: CarouselOptions(
                            aspectRatio: 16 / 5,
                            height: 220,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              provide?.setIndex(index);
                            }),
                        itemBuilder: (context, index, realindex) {
                          final selectedimage = Product().ProductImg[index];

                          return BuildImage(selectedimage, index);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 230,
                        right: 200,
                        child: AnimatedSmoothIndicator(
                          activeIndex: provide.Index,
                          count: dataList.length,
                          effect: const ScaleEffect(
                              dotHeight: 6,
                              dotWidth: 6,
                              activeDotColor: Colors.white,
                              dotColor: Colors.black),
                        ),
                      )
                    ]);
                  }
                  return Stack(children: [
                    CarouselSlider.builder(
                      itemCount: Product().ProductImg.length,
                      options: CarouselOptions(
                          aspectRatio: 16 / 5,
                          height: 220,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            provide?.setIndex(index);
                          }),
                      itemBuilder: (context, index, realindex) {
                        final selectedimage = Product().ProductImg[index];

                        return BuildImage(selectedimage, index);
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      left: 230,
                      right: 200,
                      child: AnimatedSmoothIndicator(
                        activeIndex: provide.Index,
                        count: Product().ProductImg.length,
                        effect: const ScaleEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            activeDotColor: Colors.white,
                            dotColor: Colors.black),
                      ),
                    )
                  ]);


                } else {
                  return Stack(children: [
                    CarouselSlider.builder(
                      itemCount: Product().ProductImg.length,
                      options: CarouselOptions(
                          aspectRatio: 16 / 5,
                          height: 220,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            provide?.setIndex(index);
                          }),
                      itemBuilder: (context, index, realindex) {
                        final selectedimage = Product().ProductImg[index];

                        return BuildImage(selectedimage, index);
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      left: 230,
                      right: 200,
                      child: AnimatedSmoothIndicator(
                        activeIndex: provide.Index,
                        count: Product().ProductImg.length,
                        effect: const ScaleEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            activeDotColor: Colors.white,
                            dotColor: Colors.black),
                      ),
                    )
                  ]);
                }
              });
        },
      ),
    );
  }

  Widget BuildImage(String selectedimage, int index) {
    return Container(
      width: 500,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset( 
            selectedimage,
            fit: BoxFit.cover,
          )),
    );
  }
}
