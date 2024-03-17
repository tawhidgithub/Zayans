import 'package:flutter/material.dart';

class adminThreedScreen extends StatelessWidget {
  const adminThreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: [
          Expanded(child:
          ListView.builder(
            itemCount: 2,
              itemBuilder: (context,index){
            return InkWell(
              onTap: (){},
                child: ListTile());
          }))
        ],
      ),
    );
  }
}
