

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class Panier extends StatelessWidget {
  const Panier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            childAspectRatio: 0.8,
            mainAxisSpacing: 5,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1,1),
                    color: Colors.black12,
                    blurRadius: 3
                  )
                ]
              ),
              // child: const CartCommond(),
              // child: SvgPicture.asset("assets/zeimusu_Santa_and_Reindeer.svg"),
              child: Stack(
                children: [
                  SvgPicture.asset("assets/zeimusu_Santa_and_Reindeer.svg"),
                  const Positioned(
                    child: CartCommond(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartCommond extends StatelessWidget {
  const CartCommond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text("Poisseon", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Text("Quantity", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,backgroundColor: Colors.white),),
              Container(
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Text("3",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,backgroundColor: Colors.white),))
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Price", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,backgroundColor: Colors.white),),
              Container(
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Text("30\$",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 0.3),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Total", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
              Text('30 \$',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),)
            ],
          ),
        ),
        
        Container(
          alignment: Alignment.topLeft,
          child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            backgroundColor: Colors.amber[50]
          ),
          child: Text("Buy", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300,color: Colors.black),),
          ),
        )
      ],
    );
  }
}