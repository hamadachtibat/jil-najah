import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jilnajah/exercices/exo5p.dart';
import 'package:jilnajah/lessonupload/uploadlesson5p.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:jilnajah/videoprimaire/vid25.dart';
import 'package:jilnajah/videoprimaire/vid26.dart';
import 'package:jilnajah/videoprimaire/vid27.dart';
import 'package:jilnajah/videoprimaire/vid28.dart';
import 'package:jilnajah/videoprimaire/vid29.dart';
import 'package:jilnajah/videoprimaire/vid30.dart';
import 'package:provider/provider.dart';

class pri5c extends StatefulWidget {
  @override
  _pri5cState createState() => _pri5cState();
}

class _pri5cState extends State<pri5c> {

  Future getlesson5ac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5ac").getDocuments();
    return qn.documents;
  }
  Future getlesson5fr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5fr").getDocuments();
    return qn.documents;
  }

  Future getlesson5ma()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5ma").getDocuments();
    return qn.documents;
  }
  Future getlesson5aarabe()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5ar").getDocuments();
    return qn.documents;
  }
  Future getlesson5eduis()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5ei").getDocuments();
    return qn.documents;
  }
  Future getlesson5eduar()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons5ea").getDocuments();
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
                fontSize: 25
            ),),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Text("Math",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              Text("Activié scientifique",
                style: TextStyle(
                    fontSize: 25
                ),),
              Text("Arabe",style: TextStyle(
                  fontSize: 25
              ),),
              Text("Education islamique",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              Text("Education Artistique",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              Text("Francais",
                style: TextStyle(
                    fontSize: 25
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
                              builder: (context) => exo5pmath(),
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
                              builder: (context) => vid25(),
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
                              future: getlesson5ma(),
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
                              builder: (context) => lesson5m(),
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
                              builder: (context) => exo5pac(),
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
                              builder: (context) => vid26(),
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
                              future: getlesson5ac(),
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
                              builder: (context) => lesson5ac(),
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
                              builder: (context) => exo5par(),
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
                              builder: (context) => vid27(),
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
                              future: getlesson5aarabe(),
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
                              builder: (context) => lesson5ar(),
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
                              builder: (context) => exo5pei(),
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
                              builder: (context) => vid28(),
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
                              future: getlesson5eduis(),
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
                              builder: (context) => lesson5ei(),
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
                              builder: (context) => exo5pea(),
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
                              builder: (context) => vid29(),
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
                              future: getlesson5eduar(),
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
                              builder: (context) => lesson5ea(),
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
                              builder: (context) => exo5pfr(),
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
                              builder: (context) => vid30(),
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
                              future: getlesson5fr(),
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
                              builder: (context) => lesson5fr(),
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