
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:serveme/pages/panier.dart';

import '../controller/local/controller_local.dart';
import '../controller/theme/theme.dart';
import '../sqflite_folder/dbase.dart';






class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  Litedb litedb = Litedb();

  List<Map>? res;

  getlocalstorage() async{
    res = await litedb.read("foods");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getlocalstorage();
  }


  int quantity = 1;

  ControllerLocal localcontroler = Get.put(ControllerLocal());

  Themes themecontroller = Get.put(Themes());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/oioi.png"),
                backgroundColor: Colors.white30,
              ),
              accountName: Text("EmailEx@gmail.com", style: TextStyle(color: Colors.black),), 
              accountEmail: Text("Last Name", style: TextStyle(color: Colors.black),)
            ),
            Container(
              child: Column(
                children: const [
                  ListTile(
                    title: Text("My List"),
                    subtitle: Text("List of product favorits"),
                    trailing: Icon(Icons.shopping_bag),
                  ),
                  ListTile(
                    title: Text("Account"),
                    subtitle: Text("Clients space & accounts"),
                    trailing: Icon(Icons.account_box_rounded),
                  ),
                  ListTile(
                    title: Text("Admin Account"),
                    subtitle: Text("Change & Modefy content"),
                    trailing: Icon(Icons.admin_panel_settings),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          onPressed: (){
                            localcontroler.changeLang("fr");
                          }, child: Text("Franch")),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          onPressed: (){
                            localcontroler.changeLang("en");
                          }, child: Text("English")),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 1,),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: CircleAvatar(radius: 30,backgroundColor: Colors.black,)),
                        ),
                        Text("Themes"),
                        GestureDetector(
                          onTap: () {
                            Themes.changethemetoDark();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 1,),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: CircleAvatar(radius: 30,backgroundColor: Colors.black12,)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.logout_sharp), label: Text("Sign Out")),
                  )
                ],
              ),
            )
          ],
        ),
        // semanticLabel: "none",
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[
          SliverAppBar(
            // foregroundColor: Colors.black,
            // backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: (){
                Get.to(() => const Panier());
              }, icon: const Icon(Icons.shopping_bag_outlined)),
              IconButton(onPressed: ()async{
                // int ok = await litedb.delete("foods", "id = 29");
                // int ok1 = await litedb.delete("foods", "id = 43");
                // int ok2 = await litedb.delete("foods", "id = 44");


              }, icon: const Icon(Icons.person)),
            ],
            expandedHeight: MediaQuery.of(context).size.height - 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("1".tr,style: const TextStyle(color: Colors.black),),
              collapseMode: CollapseMode.pin,
              background: SvgPicture.asset("assets/five.svg"),
            ),
            pinned: true,
          )
        ],
        body: Container(
          // color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: res == null ? 0 : res!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  // color: Colors.white
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              res == null
                              ? const CircleAvatar(backgroundColor: Colors.red,)
                              : Container(
                                child: Text(res![index]['name'],style: TextStyle(color: Colors.black38,fontSize: 19, fontStyle: FontStyle.italic),),
                              ),
                                SizedBox(height: 15,),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                // color: Colors.white,
                                  boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 5,
                                        color: Colors.black38,
                                      ),
                                    ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: NumberStepper(
                                        stepRadius: 15,
                                        stepPadding: 0.2,
                                        stepColor: Colors.grey[200],
                                        lineColor: Colors.amber,
                                        numbers: const [1,2,3,4,5],
                                        onStepReached: (index) {
                                          quantity = index + 1;
                                        },
                                      ),
                                    ),
                                    Expanded(flex:1,child: IconButton(onPressed: (){
                                      Get.snackbar("Panier", "Chaclate Noid is Add");
                                      // print(litedb.read("foods"));"products", {"name": "setron", "price": 12}
                                        // print(res![index]["id"]);
                                    }, icon: const Icon(Icons.shopping_bag_outlined))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: SvgPicture.asset(res![index]["imgfood"],fit: BoxFit.contain,width: 170,height: 170,),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}





