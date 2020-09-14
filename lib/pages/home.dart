import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jilnajah/pages/jilnajahphotos.dart';
import 'package:jilnajah/pages/prescolaire.dart';
import 'package:jilnajah/pages/primaire.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:jilnajah/src/index.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

import '../main.dart';
import 'annonces.dart';
import 'contactus.dart';



class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text("choissisez votre niveau",
        style: TextStyle(
            color: Colors.black
        ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.video_call,
          size: 30,),

              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=> IndexPage(),
                ));
              }
          )
        ],
      ),
      body:
      SingleChildScrollView(

        child: Column(
          children: <Widget>[
            SizedBox(height:30),
            Center(
              child: Stack(
                children: <Widget>[
                  OpenContainer(

                    openBuilder: (context,_){
                      return Annonce();
                    },
                    closedBuilder: (context, VoidCallback openContainer){
                      return GestureDetector(
                        onTap:  openContainer,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.white,Colors.red],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent,
                                  blurRadius: 12,
                                  offset: Offset(0,6),
                                )
                              ]
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset("assets/images/jilnajah.jpeg"),
                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("LES ANNONCES ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Nunito",
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(height:16),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on,color: Colors.white,size: 20,),
                                      Text(" JIL NAJAH ",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    closedColor: Colors.amber,
                    transitionType: ContainerTransitionType.fadeThrough,
                    transitionDuration: Duration(milliseconds: 1000),
                  ),
                ],
              ),
            ),
            SizedBox(height:30 ),
            OpenContainer(
              openBuilder: (context,_){
                return prescolaire();
              },
              closedBuilder: (context, VoidCallback opencontainer){
                return GestureDetector(
                  onTap:  opencontainer,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: [Colors.white,Colors.tealAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            blurRadius: 12,
                            offset: Offset(0,6),
                          )
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/images/jilnajah.jpeg"),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("PRESCOLAIRE ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Nunito",
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(height:16),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,color: Colors.white,size: 20,),
                                Text("JIL NAJAH ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),

                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              closedColor: Colors.amber,
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 1000),
            ),
            SizedBox(height:30 ),
            OpenContainer(
              openBuilder: (context,_){
                return primairelist();

              },
              closedColor: Colors.amber,
              closedBuilder: (context,VoidCallback opencontainer){
                return GestureDetector(
                  onTap:  opencontainer ,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: [Colors.white,Colors.lightGreenAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal ,
                            blurRadius: 12,
                            offset: Offset(0,6),
                          )
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset("assets/images/jilnajah.jpeg"),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center ,
                          children: <Widget>[
                            Text("PRAIMAIRE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Nunito",
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(height:16),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,color: Colors.white,size: 20,),
                                Text(" JIL NAJAH  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 1000),
            ),
            SizedBox(height:10 ),

            SizedBox(height: 10,),

          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.amber,
          items: <Widget>[

            IconButton(
              icon: Icon(
                  Icons.home),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => homepage(),
                ));
              },
            ),
            IconButton(
              icon: Icon(
                  Icons.camera_alt),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => najahphoto(),
                ));
              },
            ),
            IconButton(
              icon: Icon(
                  Icons.add_location),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => ContactPage(),
                ));
              },
            ),
            IconButton(
              icon: Icon( Icons.close),
              onPressed: () async {
                currentuser _currentuser=Provider.of<currentuser>(context,listen: false);
                if(await _currentuser.signout()== true){
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => ourroot(),
                  ));
                }
              },
            ),
          ]
      ),
    );
  }
}
