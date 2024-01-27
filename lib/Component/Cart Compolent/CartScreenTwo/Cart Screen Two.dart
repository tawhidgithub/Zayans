import 'package:copy/State/Cart%20State/Cart%20State.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreenTwo extends StatelessWidget {
  CartScreenTwo(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.index});

  final price;
  final String image;
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,provider,child){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.8, color: Colors.grey.shade300)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipRRect(child: Image.network(image,fit: BoxFit.fitHeight,)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 60,
                        width: 200,
                        child: Text(name,style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500),)),
                  ],
                ),
                Positioned(
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$ " + price,style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 30,
                      ),
                      ChangeNotifierProvider(
                        create: (_) => CartState(),
                        child: Consumer<CartState>(
                            builder: (context, provider, child) {
                              return Container(
                                height: 40,
                                width: 106,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey.shade600),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          provider.setCountDecrease();
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 15,
                                        )),
                                    Text(
                                      provider.Count.toString(),
                                      style: GoogleFonts.roboto(fontSize: 15),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          provider.setCountIncrase();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                        )),
                                  ],
                                ),
                              );
                            }),
                      ),
                      IconButton(
                          onPressed: () {
                            provider.removetoCart(index);

                          },
                          icon: FaIcon(
                            FontAwesomeIcons.trashCan,
                            size: 15,
                            color: Colors.grey.shade500,
                          ))
                    ],
                  ),
                )],
            ),
          ),
        ),
      );
    });
  }
}
