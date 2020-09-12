import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jilnajah/exercices/exo6p.dart';
import 'package:jilnajah/lessonupload/uploadlesson6p.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:jilnajah/videoprimaire/vid31.dart';
import 'package:jilnajah/videoprimaire/vid32.dart';
import 'package:jilnajah/videoprimaire/vid33.dart';
import 'package:jilnajah/videoprimaire/vid34.dart';
import 'package:jilnajah/videoprimaire/vid35.dart';
import 'package:jilnajah/videoprimaire/vid36.dart';
import 'package:provider/provider.dart';

class pri6c extends StatefulWidget {
  @override
  _pri6cState createState() => _pri6cState();
}

class _pri6cState extends State<pri6c> {

  Future getlesson6ac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6ac").getDocuments();
    return qn.documents;
  }
  Future getlesson6fr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6fr").getDocuments();
    return qn.documents;
  }

  Future getlesson6ma()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6ma").getDocuments();
    return qn.documents;
  }
  Future getlesson6aarabe()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6ar").getDocuments();
    return qn.documents;
  }
  Future getlesson6eduis()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6ei").getDocuments();
    return qn.documents;
  }
  Future getlesson6eduar()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons6ea").getDocuments();
    return qn.documents;
  }
  bool isteacher=false;

  @override
  Widget build(BuildContext context) {
    currentuser _currentuser = Provider.of<currentuser>(context ,listen:false );
    if (_currentuser.getcurrentuser.isteacher=='true') {
      setState(() {
        isteacher=true;
      });

    }

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: Text("Matiers",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black
            ),),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Text("Math",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Text("Activié scientifique",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),),
              Text("Arabe",style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
              ),),
              Text("Education islamique",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Text("Education Artistique",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Text("Francais",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6pmath(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid31(),
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6ma(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6m(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6pac(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid32(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6ac(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),


                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6ac(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6par(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid33(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6aarabe(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),


                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6ar(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6pei(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid34(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6eduis(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading.....'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),


                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6ei(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6pea(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid35(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6eduar(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),


                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6ea(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => exo6pfr(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Exercices",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/mathema.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:  (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => vid36(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightGreen,Colors.green],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Les Videos",
                                  style: TextStyle(
                                      fontSize: 25
                                  ),),
                                Image.asset("assets/images/exam.png",
                                  width: 100, ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(" Les leçons ",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: <Widget>[
                          FutureBuilder(
                              future: getlesson6fr(),
                              builder: (context,snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: Text('loading'),);
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            String passdata=snapshot.data[index].data['pdfurl'];
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> Viewpdf(),
                                                settings: RouteSettings(
                                                  arguments: passdata,
                                                )
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              gradient: LinearGradient(
                                                colors: [Colors.lightGreen,Colors.green],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(snapshot.data[index].data['titre'],
                                                style: TextStyle(
                                                    fontSize: 23
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });

                                }
                              }),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),


                    Visibility(
                      visible: isteacher,
                      child: FloatingActionButton(child: Icon(Icons.add,
                        color: Colors.purple,
                        size: 30,),
                          backgroundColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => lesson6fr(),
                            ));
                          }
                      ),
                    ),
                  ],
                ),

              ),

            ]
        ),
      ),
    );
  }
}