import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/lessonupload/uploadannonce.dart';
import 'package:jilnajah/primairelesson/lessonviewer.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';

class Annonce extends StatefulWidget {
  @override
  _AnnonceState createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  bool isteacher=false;
  Future getannonce()async{
    var firestore =Firestore.instance;
    QuerySnapshot qn= await firestore.collection("annonce").getDocuments();
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    currentuser _currentuser = Provider.of<currentuser>(context ,listen:false );
    if (_currentuser.getcurrentuser.isteacher=='true') {
      setState(() {
        isteacher=true;
      });

    }
    return Scaffold(
      appBar: AppBar(

        title: Text('Les Annonces ',
          style: TextStyle(
            fontSize: 23,
            color: Colors.black
          ),),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body:
      SafeArea(
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: getannonce(),
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
              Visibility(
                visible: isteacher,
                child: OpenContainer(
                  openBuilder: (context,_){
                    return uploadannonce();
                  },
                  closedBuilder: (context,VoidCallback openContainer){
                    return  FloatingActionButton(
                        backgroundColor: Colors.amberAccent,

                        onPressed: openContainer);
                  },
                  closedColor: Colors.transparent,
                  openColor: Colors.transparent,
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: Duration(milliseconds: 1000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}