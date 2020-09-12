import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/lessonupload/uplexo4p.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';

class exo4pmath extends StatefulWidget {
  @override
  _exo4pmathState createState() => _exo4pmathState();
}

class _exo4pmathState extends State<exo4pmath> {

  Future getexercice4p()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4pm").getDocuments();
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



    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4p(),
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
                      builder: (context) => exo4pm(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class exo4pac extends StatefulWidget {
  @override
  _exo4pacState createState() => _exo4pacState();
}

class _exo4pacState extends State<exo4pac> {

  Future getexercice4pac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4pac").getDocuments();
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4pac(),
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
                      builder: (context) => uexo4pac(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class exo4par extends StatefulWidget {
  @override
  _exo4parState createState() => _exo4parState();
}

class _exo4parState extends State<exo4par> {

  Future getexercice4par()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4par").getDocuments();
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4par(),
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
                      builder: (context) => uexo4par(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class exo4pei extends StatefulWidget {
  @override
  _exo4peiState createState() => _exo4peiState();
}

class _exo4peiState extends State<exo4pei> {

  Future getexercice4pei()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4pei").getDocuments();
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4pei(),
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
                      builder: (context) => uexo4pei(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class exo4pea extends StatefulWidget {
  @override
  _exo4peaState createState() => _exo4peaState();
}

class _exo4peaState extends State<exo4pea> {

  Future getexercice4pea()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4pea").getDocuments();
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4pea(),
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
                      builder: (context) => uexo4pea(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class exo4pfr extends StatefulWidget {
  @override
  _exo4pfrState createState() => _exo4pfrState();
}

class _exo4pfrState extends State<exo4pfr> {

  Future getexercice4pfr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices4pfr").getDocuments();
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Center(
                child:IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.close,color: Colors.white,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.tealAccent],
                ),
              ),
              child: Center(
                child: Text(" <<La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.>> Albert.Einstein",
                  style: TextStyle(
                      fontSize: 25
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Exercices",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                )
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: getexercice4pfr(),
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
                      builder: (context) => uexo4pfr(),
                    ));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}