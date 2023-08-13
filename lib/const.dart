import 'package:flutter/material.dart';

import 'detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: ListView(
      children: [
      AnimatedContainer(
      decoration: isDrawerOpen
          ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      )
          : BoxDecoration(color: Colors.white),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child:
                Text("DOLL STORE",style: TextStyle(fontSize: 15,letterSpacing: 1,height: 5)),
              ),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),

              ]),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[400],
                          ),
                          hintText: 'Search doll',
                          hintStyle: TextStyle(
                              letterSpacing: 1, color: Colors.grey[400]),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon:
                          Icon(Icons.tune_sharp, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: catMapList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetails(catDetailsMap: catMapList[index],)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            height: 230,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: (index % 2 == 0) ? Colors.green[200] : Colors.pink[200] ,
                                          borderRadius: BorderRadius.circular(20),

                                        ),
                                        margin: EdgeInsets.only(top: 40),
                                      ),
                                      Align(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Hero(
                                                tag: 'pet${catMapList[index]['id']}',
                                                child: Image.asset(catMapList[index]['imagePath'])),
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 65, bottom: 20),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              catMapList[index]['name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21.0,
                                                color: Colors.grey[600],
                                              ),
                                            ),

                                          ],
                                        ),

                                        Text(
                                          catMapList[index]['Price']+ ' rupees',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            SizedBox(
                                              width: 3,
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      )  ])
    ));

  }
}
List<Map> catMapList = [
  {"id":0,"name":'Lilly',"imagePath":'assets/toy.jpg',
    "Price":'500'},
  {"id":1,"name":'moon',"imagePath":'assets/toy1.jpg',
    "Price":'600',},
  {"id":2,"name":'Bee',"imagePath":'assets/toy2.webp',
    "Price":'10000',},
  {"id":3,"name":'BLUE',"imagePath":'assets/toy3.jpg',
 "Price":'25000'},
  {"id":4,"name":'Shimmer',"imagePath": 'assets/toy4.jpg',"Price":'700',},
  {"id":5,"name":'Oreo',"imagePath":'assets/toy5.jpg',"Price":'399'
   },
  {"id":6,"name":'Sola',"imagePath":'assets/toy6.jpg',
   "Price":'600',
  },
  {"id":7,"name":'Ace',"imagePath":'assets/toy7.jpg',
    "Price":'12000',},

];
