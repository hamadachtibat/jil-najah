import 'package:flutter/material.dart';
import 'package:jilnajah/pages/primaire2classe.dart';
import 'package:jilnajah/pages/primaire3classe.dart';
import 'package:jilnajah/pages/primaire4classe.dart';
import 'package:jilnajah/pages/primaire5classe.dart';
import 'package:jilnajah/pages/primaire6classe.dart';
import 'package:jilnajah/primairelesson/primaire1classe.dart';

class primairelist extends StatefulWidget {
  @override
  _primairelistState createState() => _primairelistState();
}

class _primairelistState extends State<primairelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text("choisisiez votre classe",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true ,
      ),

      body: Stack(
        children: <Widget>[
          SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap:  (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri1c(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30,left: 20,right: 10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.lightGreenAccent,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("1 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri2c(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30,left: 10,),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.pinkAccent,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("2 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri3c(),
                        ));
                      },
                      child: Container(

                        margin: EdgeInsets.only(top: 20,left: 20,right: 10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.cyan,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("3 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri4c(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20,left: 10,),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.orangeAccent,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("4 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri5c(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20,left: 20,right: 10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.red,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("5 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => pri6c(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20,left: 10,),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.purpleAccent,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/images/jilnajah.jpeg",
                              width:50 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("6 PRIMAIRE "),
                                SizedBox(height: 10,),
                                Image.asset("assets/images/kids.png",
                                  width:70 ,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
