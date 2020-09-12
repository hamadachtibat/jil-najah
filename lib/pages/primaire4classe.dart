import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jilnajah/exercices/exo4p.dart';
import 'package:jilnajah/lessonupload/uploadlesson4p.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:jilnajah/videoprimaire/vid19.dart';
import 'package:jilnajah/videoprimaire/vid20.dart';
import 'package:jilnajah/videoprimaire/vid21.dart';
import 'package:jilnajah/videoprimaire/vid22.dart';
import 'package:jilnajah/videoprimaire/vid23.dart';
import 'package:jilnajah/videoprimaire/vid24.dart';
import 'package:provider/provider.dart';

class pri4c extends StatefulWidget {
  @override
  _pri4cState createState() => _pri4cState();
}

class _pri4cState extends State<pri4c> {

  Future getlesson4ac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4ac").getDocuments();
    return qn.documents;
  }
  Future getlesson4fr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4fr").getDocuments();
    return qn.documents;
  }

  Future getlesson4ma()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4ma").getDocuments();
    return qn.documents;
  }
  Future getlesson4aarabe()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4ar").getDocuments();
    return qn.documents;
  }
  Future getlesson4eduis()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4ei").getDocuments();
    return qn.documents;
  }
  Future getlesson4eduar()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons4ea").getDocuments();
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
                              builder: (context) => exo4pmath(),
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
                              builder: (context) => vid19(),
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
                              future: getlesson4ma(),
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
                              builder: (context) => lesson4m(),
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
                              builder: (context) => exo4pac(),
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
                              builder: (context) => vid20(),
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
                              future: getlesson4ac(),
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
                              builder: (context) => lesson4ac(),
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
                              builder: (context) => exo4par(),
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
                              builder: (context) => vid21(),
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
                              future: getlesson4aarabe(),
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
                              builder: (context) => lesson4ar(),
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
                              builder: (context) => exo4pei(),
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
                              builder: (context) => vid22(),
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
                              future: getlesson4eduis(),
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
                              builder: (context) => lesson4ei(),
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
                              builder: (context) => exo4pea(),
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
                              builder: (context) => vid23(),
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
                              future: getlesson4eduar(),
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
                              builder: (context) => lesson4ea(),
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
                              builder: (context) => exo4pfr(),
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
                              builder: (context) => vid24(),
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
                              future: getlesson4fr(),
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
                              builder: (context) => lesson4fr(),
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