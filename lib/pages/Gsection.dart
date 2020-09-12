import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/exercices/exoGS.dart';
import 'package:jilnajah/lessonupload/uploadlessonGS.dart';
import 'package:jilnajah/pages/video10.dart';
import 'package:jilnajah/pages/video6.dart';
import 'package:jilnajah/pages/video7.dart';
import 'package:jilnajah/pages/video8.dart';
import 'package:jilnajah/pages/video9.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';

class secondannecollege extends StatefulWidget {
  @override
  _secondannecollegeState createState() => _secondannecollegeState();
}

class _secondannecollegeState extends State<secondannecollege> {
  Future getlesson2cma()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2cma").getDocuments();
    return qn.documents;
  }
  Future getlesson2cphy()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2cphy").getDocuments();
    return qn.documents;
  }

  Future getlesson2csvt()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2csvt").getDocuments();
    return qn.documents;
  }
  Future getlesson2cfr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2cfr").getDocuments();
    return qn.documents;
  }
  Future getlesson2carab()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2carab").getDocuments();
    return qn.documents;
  }
  Future getlesson2cei()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2cei").getDocuments();
    return qn.documents;
  }
  Future getlesson2chg()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2chg").getDocuments();
    return qn.documents;
  }
  Future getlesson2ceng()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("lessons2ceng").getDocuments();
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
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: Text("Matiers",
            style: TextStyle(
                fontSize: 25,
                    color: Colors.black,
            ),),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius:BorderRadius.circular(50),
              color: Colors.deepOrange,
            ),
            indicatorColor: Colors.white,

            tabs: <Widget>[
              Text("Math",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              Text("Les activités ",
                style: TextStyle(
                    fontSize: 25
                ),),
              Text("Francaise",
                style: TextStyle(
                    fontSize: 25
                ),),
              Text("Arabic",
                style: TextStyle(
                    fontSize: 25
                ),),
              Text("E.islamic",style: TextStyle(
                  fontSize: 25
              ),),


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
                            builder: (context) => exo8pmath(),
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
                            builder: (context) => MyVideo6(),
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
                            future: getlesson2cma(),
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
                            builder: (context) => lesson2cm(),
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
                            builder: (context) => exo8pac(),
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
                              Image.asset("assets/images/physics.png",
                                width: 100, ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:  (){
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => MyVideo7(),
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
                            future: getlesson2cphy(),
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
                            builder: (context) => lesson2cphy(),
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
                            builder: (context) => exo8par(),
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
                              Image.asset("assets/images/rna.png",
                                width: 100, ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:  (){
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => MyVideo8(),
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
                            future: getlesson2csvt(),
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
                            builder: (context) => lesson2csvt(),
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
                            builder: (context) => exo8pei(),
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
                              Image.asset("assets/images/france.png",
                                width: 100, ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:  (){
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => MyVideo9(),
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
                            future: getlesson2cfr(),
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
                            builder: (context) => lesson2cfr(),
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
                            builder: (context) => exo8pea(),
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
                              Image.asset("assets/images/arabic.png",
                                width: 100, ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:  (){
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => MyVideo10(),
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
                            future: getlesson2carab(),
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
                            builder: (context) => lesson2carb(),
                          ));
                        }
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),

      ),

    );
  }
}