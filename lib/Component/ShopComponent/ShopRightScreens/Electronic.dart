import "package:copy/Component/ShopComponent/Shop%20Filter%20Screen/PC%20Filter/Electronic%20Filter.dart";
import"package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../Shop Filter Screen/PC Filter/PC Filter.dart";

class ElectonicScreen extends StatelessWidget {
  const ElectonicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Show All",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "(0)",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  Get.to(const ElectornicFilter());
                },
                child: Text(
                  "Show All",
                  style: GoogleFonts.roboto(color: Colors.grey.shade500),
                ))
          ],
        ),
      ),
    );
  }
}
