import 'package:copy/Component/Cart%20Compolent/CartScreenOne/Cart%20Screen%20One.dart';
import 'package:copy/Component/Cart%20Compolent/CartScreenTwo/Cart%20Screen%20Two.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../Component/Button/Button.dart';
import '../../../../State/Cart State/Cart State.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                const SizedBox(
                  width: 208,
                ),
                Text(
                  "Cart",
                  style: GoogleFonts.roboto(fontSize: 21),
                ),
                Text(
                  "(${provider.Cart.length})",
                  style: GoogleFonts.roboto(fontSize: 15),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.removeAllCart();
                    provider.calculate();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.trashCan,
                    size: 19,
                  )),
              const SizedBox(
                width: 20,
              ),
            ],
            centerTitle: true,
          ),
          body: provider.Cart.isEmpty
              ? const CartScreenOne()
              : Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider.Cart.length,
                            itemBuilder: (context, index) {
                              return CartScreenTwo(
                                index: index,
                                image: provider.Cart[index]["Image"],
                                name: provider.Cart[index]["name"],
                                price:
                                    provider.Cart[index]["price"].toString(),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "SubTotal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("\$ " + "${provider.Total}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Flat rate",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    "\$ " + "0.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tex",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("\$ " + "0.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("\$ " + "${provider.Total}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ButtoN(
                                onClick: () {},
                                title: "Proceed to Chackout",
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ));
    });
  }
}
