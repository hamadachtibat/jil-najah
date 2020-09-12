import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/lessonupload/uploaexoGS.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';

class exo8pmath extends StatefulWidget {
  @override
  _exo8pmathState createState() => _exo8pmathState();
}

class _exo8pmathState extends State<exo8pmath> {

  Future getexercice8p()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pm").getDocuments();
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
                      future: getexercice8p(),
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
                      builder: (context) => exo8pm(),
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
class exo8pac extends StatefulWidget {
  @override
  _exo8pacState createState() => _exo8pacState();
}

class _exo8pacState extends State<exo8pac> {

  Future getexercice8pac()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pac").getDocuments();
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
                      future: getexercice8pac(),
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
                      builder: (context) => uexo8pac(),
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
class exo8par extends StatefulWidget {
  @override
  _exo8parState createState() => _exo8parState();
}

class _exo8parState extends State<exo8par> {

  Future getexercice8par()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8par").getDocuments();
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
                      future: getexercice8par(),
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
                      builder: (context) => uexo8par(),
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
class exo8pei extends StatefulWidget {
  @override
  _exo8peiState createState() => _exo8peiState();
}

class _exo8peiState extends State<exo8pei> {

  Future getexercice8pei()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pei").getDocuments();
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
                      future: getexercice8pei(),
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
                      builder: (context) => uexo8pei(),
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
class exo8pea extends StatefulWidget {
  @override
  _exo8peaState createState() => _exo8peaState();
}

class _exo8peaState extends State<exo8pea> {

  Future getexercice8pea()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pea").getDocuments();
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
                      future: getexercice8pea(),
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
                      builder: (context) => uexo8pea(),
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
class exo8pfr extends StatefulWidget {
  @override
  _exo8pfrState createState() => _exo8pfrState();
}

class _exo8pfrState extends State<exo8pfr> {

  Future getexercice8pfr()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pfr").getDocuments();
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
                      future: getexercice8pfr(),
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
                      builder: (context) => uexo8pfr(),
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
class exo8phg extends StatefulWidget {
  @override
  _exo8phgState createState() => _exo8phgState();
}

class _exo8phgState extends State<exo8phg> {

  Future getexercice8phg()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8phg").getDocuments();
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
                      future: getexercice8phg(),
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
                      builder: (context) => uexo8phg(),
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
class exo8pen extends StatefulWidget {
  @override
  _exo8penState createState() => _exo8penState();
}

class _exo8penState extends State<exo8pen> {

  Future getexercice8pen()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("exercices8pen").getDocuments();
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
                      future: getexercice8pen(),
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
                      builder: (context) => uexo8pen(),
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