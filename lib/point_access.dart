
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serveme/pages/home_screen.dart';

class HotSpot extends StatelessWidget {
  const HotSpot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      TheThreeConts(),
                      TheThreeConts(),
                      TheThreeConts(),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: (){}, child: const Text("Sing Up")),
                      ),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.deepOrange,
                          ),
                          onPressed: (){
                            Get.off(() => ScreenHome() );
                          }, child: const Text("Start Order")
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TheThreeConts extends StatelessWidget {
  const TheThreeConts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.black12,
            blurRadius: 6,
            blurStyle: BlurStyle.normal,
          )
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          const Text('To Day Gifts'),
          SizedBox(height: 5,),
          Row(children:  [Text("40"),SizedBox(width: 15,),Icon(Icons.now_wallpaper)],)
        ],
      ),
    );
  }
}