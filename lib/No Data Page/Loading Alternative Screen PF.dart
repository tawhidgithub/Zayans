import 'package:flutter/material.dart';

import '../Component/ProfileALT.dart';

class L0dingPF extends StatelessWidget {
  const L0dingPF({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(child: ProfileALTCON(highT: 150,)),
            SizedBox(height: 20,),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),
            SizedBox(
              height: 30,
            ),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),
            Expanded(child: ProfileALTCON(highT: 80,)),


          ],
        ),
      ),
    );
  }
}
