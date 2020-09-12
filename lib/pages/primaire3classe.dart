import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jilnajah/exercices/exo3p.dart';
import 'package:jilnajah/lessonupload/uploadlesson3p.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:jilnajah/videoprimaire/vid13.dart';
import 'package:jilnajah/videoprimaire/vid14.dart';
import 'package:jilnajah/videoprimaire/vid15.dart';
import 'package:jilnajah/videoprimaire/vid16.dart';
import 'package:jilnajah/videoprimaire/vid17.dart';
import 'package:jilnajah/videoprimaire/vid18.dart';

import 'package:provider/provider.dart';

class pri3c extends StatefulWidget {
  @override
  _pri3cState createState() => _pri3cState();
}

class _pri3cState extends State<pri3c> {

  Future getlesson3ac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3ac").getDocuments();
    return qn.documents;
  }
  Future getlesson3fr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3fr").getDocuments();
    return qn.documents;
  }

  Future getlesson3ma()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3ma").getDocuments();
    return qn.documents;
  }
  Future getlesson3aarabe()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3ar").getDocuments();
    return qn.documents;
  }
  Future getlesson3eduis()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3ei").getDocuments();
    return qn.documents;
  }
  Future getlesson3eduar()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons3ea").getDocuments();
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
                              builder: (context) => exo3pmath(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid13(),
                            ));
                          },

                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                        color: Colors.blueAccent,
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
                              future: getlesson3ma(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3m(),
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
                              builder: (context) => exo3pac(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid14(),
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
                        color: Colors.blueAccent,
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
                              future: getlesson3ac(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3ac(),
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
                              builder: (context) => exo3par(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors:[Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid15(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors:[Colors.lightBlueAccent,Colors.blue],
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
                        color: Colors.blueAccent,
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
                              future: getlesson3aarabe(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3ar(),
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
                              builder: (context) => exo3pei(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid16(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                        color: Colors.blueAccent,
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
                              future: getlesson3eduis(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3ei(),
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
                              builder: (context) => exo3pea(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid17(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                        color: Colors.blueAccent,
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
                              future: getlesson3eduar(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3ea(),
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
                              builder: (context) => exo3pfr(),
                            ));
                          },

                          child: Container(
                            margin: EdgeInsets.only(left: 20,right:5,top: 10 ),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => vid18(),
                            ));
                          },
                          child: Container(

                            margin: EdgeInsets.only(left:20,top: 10),
                            height: 200,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                        color: Colors.blueAccent,
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
                              future: getlesson3fr(),
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
                                                colors: [Colors.lightBlueAccent,Colors.blue],
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
                              builder: (context) => lesson3fr(),
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