import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Colors/Colors.dart';

class FooterSection extends StatelessWidget {
  FooterSection({super.key});

  List<String> height = ["50", "50"];

  List Color = [
    Colors.blue,
    Colors.yellow,
  ];

  List review=[
    {
      "name":"John Deo",
      "rating":4.5,
      "review":"Seamless, user-friendly, personalized, responsive, recommended."

    },{
      "name":"Rowan Atkinson",
      "rating":4.0,
      "review":"Efficient, intuitive, personalized, responsive, recommended"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 40),
        child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.FooterBoxColor,
                    borderRadius: BorderRadius.circular(15)

                  ),
                  width: 300,
                  child: Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review[index]["review"],maxLines: 3,style: GoogleFonts.roboto(fontSize: 14),),
                        const SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          itemCount: 5,
                            itemSize: 21,
                            initialRating: review[index]["rating"],

                            itemBuilder: (context,index){
                          return const Icon(Icons.star,color: AppColors.RatingIconColor,);
                        },
                            onRatingUpdate: (rating){}),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person_outline,size: 80,),
                            const SizedBox(
                              width: 10,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(review[index]["name"],style: GoogleFonts.roboto(fontSize: 21,fontWeight: FontWeight.w400),),
                                Text("Verified Purchase",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w300),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
