import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreenOne extends StatelessWidget {
  const CartScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Center(
          child: Container(
            height: 230,
            width: 230,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                
                colors: [
                Color(0xfffad4db),
                Colors.white,
                
              ])
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                FaIcon(FontAwesomeIcons.cartShopping,size: 35,color: AppColors.ButtonColor,),
        
        
              ]),
            ),
            
          ),
        ),
        
        Container(
          margin: const EdgeInsets.only(top: 500),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Text("Cart",style: GoogleFonts.roboto(fontSize: 28,fontWeight: FontWeight.w400),),
              const SizedBox(height: 20,),
              Text("Your cart is currently empty.",style: GoogleFonts.roboto(color: Colors.grey.shade500),),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: (){},
                splashColor: Colors.grey.shade500.withOpacity(0.5),
                
                
                child: Ink(
                  height: 65,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColors.ButtonColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text("Return to Shop",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)),
                ),
              )
            ],
          ),
        )
        
        
        
        ],
      
      
      );
  }
}