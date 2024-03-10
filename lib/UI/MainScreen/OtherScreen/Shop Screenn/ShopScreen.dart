import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../Component/ShopComponent/ShopHeader.dart';
import '../../../../Data/ShopData/ShopData.dart';
import '../../../../State/Shop state/Shop state.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    // for responsive
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Create a instance of the Shop Data Class for fetch data from it
    ShopData shopData = ShopData();

    // Create a instance of the Shop State2 class for State Management

    ShopState2 shopState2 = Get.put(ShopState2());

    return Consumer<shop_state>(builder: (context, provider, index) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          provider.setFocus(false);
        },
        child: Scaffold(
          appBar: provider.Focus
              ? AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 70,
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      _searchFocus.unfocus();
                      provider.setFocus(false);
                    },
                  ),
                  title: SizedBox(
                    height: 55,
                    width: 400,
                    child: TextFormField(
                      focusNode: _searchFocus,
                      onTap: () {
                        provider.setFocus(true);
                      },
                      decoration: InputDecoration(
                          hintText: "Search Product",
                          hintStyle: GoogleFonts.roboto(fontSize: 15),
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                )
              : AppBar(
                  toolbarHeight: 70,
                  title: InkWell(
                    onTap: () {
                      provider.setFocus(true);
                    },
                    child: Container(
                      height: 55,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Search Product",
                            style: GoogleFonts.roboto(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: const [
                    Icon(Icons.shopping_cart_outlined),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
          body: provider.Focus
              ? SingleChildScrollView(
                  child: Container(
                    height: height * 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                )
              : SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const ShopHeader(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(

                          width: width * .25,
                          height: height * 1,
                          child: ListView.builder(
                              itemCount: shopData.ShopName.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    shopState2.setIndex(index);
                                  },
                                  child:Obx(() {
                                    return  AnimatedContainer(
                                      duration: const Duration(milliseconds: 400),
                                      decoration:  BoxDecoration(
                                        color: shopState2.index==index?Colors.grey.shade200:Colors.white,
                                          border: Border(
                                              left:shopState2.index==index?const BorderSide(
                                                  color: AppColors.primaryColor,
                                                  width: 2) :const BorderSide())),
                                      height: 60,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              "${shopData.ShopName[index]}",
                                              style:shopState2.index==index? GoogleFonts.roboto(color: AppColors.primaryColor):GoogleFonts.roboto(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              }),
                        ),
                        // secend container
                       Obx(() {
                         return  Container(
                           width: width * .75,
                           height: height * 1,
                           child: shopData.ShopScreen[shopState2.index.toInt()],
                         );
                       })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      );
    });
  }
}
