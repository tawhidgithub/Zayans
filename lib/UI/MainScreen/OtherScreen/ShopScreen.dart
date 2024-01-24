import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../State/Shop state/Shop state.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      _searchFocus.unfocus();
                      provider.setFocus(false);
                    },
                  ),
                  title: Container(
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                    SizedBox(
                      width: 20,
                    )
                  ],
                )
              : AppBar(
                  toolbarHeight: 70,
                  title: Container(
                    height: 55,
                    width: 400,
                    child: TextFormField(
                      focusNode: _searchFocus,
                      onTap: () {
                        provider.setFocus(true);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: "Search Product",
                          hintStyle: GoogleFonts.roboto(fontSize: 15),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                          ))),
                    ),
                  ),
                  actions: [
                    Icon(Icons.shopping_cart_checkout),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
          body: provider.Focus
              ? SingleChildScrollView(
                  child: Container(
                    height: 1000,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    height: 1000,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ),
        ),
      );
    });
  }
}
