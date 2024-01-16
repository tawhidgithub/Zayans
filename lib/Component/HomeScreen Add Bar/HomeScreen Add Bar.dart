import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Model/Product/Product.dart';
import '../../State/Home Header Slider State/Home Header Slider State.dart';

class HomeScreen_Add_Bar extends StatefulWidget {
  const HomeScreen_Add_Bar({super.key});

  @override
  State<HomeScreen_Add_Bar> createState() => _HomeScreen_Add_BarState();
}

class _HomeScreen_Add_BarState extends State<HomeScreen_Add_Bar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Home_Header_Slider_State(),
      child: Consumer<Home_Header_Slider_State>(
        builder: (context, provide, child) {
          return Stack(children: [
            CarouselSlider.builder(
              itemCount: Product().ProductImg.length,
              options: CarouselOptions(
                  aspectRatio: 16 / 5,
                  height: 220,
                  viewportFraction: 1,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 2),
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    provide.setIndex(index);
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
                effect: ScaleEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  activeDotColor: Colors.white,
                  dotColor: Colors.black


                ),
              ),
            )
          ]);
        },
      ),
    );
  }

  Widget BuildImage(String selectedimage, int index) {
    return Container(
      width: 500,
      margin: EdgeInsets.symmetric(horizontal: 20),
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
