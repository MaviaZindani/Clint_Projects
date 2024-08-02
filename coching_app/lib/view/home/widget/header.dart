import 'package:coching_app/constantce.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Well Come', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,)),
              Text('Lets learn together', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,),),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: koptionColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment:Alignment.topRight,
                    children:[
                     const Icon(Icons.notifications,color: Colors.white,),
                     Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                     )
                     ]),
                )),
                SizedBox(
                  width: 12,
                ),
             Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: koptionColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:const Icon(Icons.person,color: Colors.white,),
          )
            ],
          ),
        ],
          );
  }
}