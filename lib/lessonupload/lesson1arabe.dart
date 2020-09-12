import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/services/crud.dart';
import 'package:random_string/random_string.dart';
class lesson1arabe extends StatefulWidget {
  @override
  _lesson1arabeState createState() => _lesson1arabeState();
}

class _lesson1arabeState extends State<lesson1arabe> {

  Crudmethods crudmethods=new Crudmethods();


  bool isloading=false;
  File filepdf;
  Future getPDF()async{
    filepdf =await FilePicker.getFile(type: FileType.any);
  }
  uploadpdf()async{
    if (filepdf!=null) {
      setState(() {
        isloading=true;
      });
      StorageReference storageReference =  FirebaseStorage.instance.ref().child("lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task= storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String,String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata1arabe(lessondata).then((result){
        Navigator.pop(context);
      });
    }  else{print('error');}
  }
  TextEditingController _titrecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25), ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment:Alignment.center,
          child: CircularProgressIndicator(),
        ):
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.file_upload,
                          size: 30,),
                        SizedBox(width: 20,),
                        Text("Upload Le Document",
                          style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _titrecontroller,
                          decoration: InputDecoration(
                              hintText: 'Entrez le titre du document',
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric( horizontal: 20,)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 70,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,

                  child: RaisedButton(
                    onPressed:(){
                      uploadpdf();
                    } ,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save_alt,
                          size: 30,
                          color: Colors.black,),
                        SizedBox(width: 10,),
                        Text('Sauvgarder le Doc',
                          style: TextStyle(fontSize: 25,
                              color: Colors.black),

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
class lesson1eduis extends StatefulWidget {
  @override
  _lesson1eduisState createState() => _lesson1eduisState();
}

class _lesson1eduisState extends State<lesson1eduis> {

  Crudmethods crudmethods=new Crudmethods();


  bool isloading=false;
  File filepdf;
  Future getPDF()async{
    filepdf =await FilePicker.getFile(type: FileType.any);
  }
  uploadpdf()async{
    if (filepdf!=null) {
      setState(() {
        isloading=true;
      });
      StorageReference storageReference =  FirebaseStorage.instance.ref().child("lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task= storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String,String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata1eduis(lessondata).then((result){
        Navigator.pop(context);
      });
    }  else{print('error');}
  }
  TextEditingController _titrecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25), ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment:Alignment.center,
          child: CircularProgressIndicator(),
        ):
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.file_upload,
                          size: 30,),
                        SizedBox(width: 20,),
                        Text("Upload Le Document",
                          style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _titrecontroller,
                          decoration: InputDecoration(
                              hintText: 'Entrez le titre du document',
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric( horizontal: 20,)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 70,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,

                  child: RaisedButton(
                    onPressed:(){
                      uploadpdf();
                    } ,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save_alt,
                          size: 30,
                          color: Colors.black,),
                        SizedBox(width: 10,),
                        Text('Sauvgarder le Doc',
                          style: TextStyle(fontSize: 25,
                              color: Colors.black),

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
class lesson1eduar extends StatefulWidget {
  @override
  _lesson1eduarState createState() => _lesson1eduarState();
}

class _lesson1eduarState extends State<lesson1eduar> {

  Crudmethods crudmethods=new Crudmethods();


  bool isloading=false;
  File filepdf;
  Future getPDF()async{
    filepdf =await FilePicker.getFile(type: FileType.any);
  }
  uploadpdf()async{
    if (filepdf!=null) {
      setState(() {
        isloading=true;
      });
      StorageReference storageReference =  FirebaseStorage.instance.ref().child("lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task= storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String,String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata1eduar(lessondata).then((result){
        Navigator.pop(context);
      });
    }  else{print('error');}
  }
  TextEditingController _titrecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25), ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment:Alignment.center,
          child: CircularProgressIndicator(),
        ):
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.file_upload,
                          size: 30,),
                        SizedBox(width: 20,),
                        Text("Upload Le Document",
                          style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _titrecontroller,
                          decoration: InputDecoration(
                              hintText: 'Entrez le titre du document',
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric( horizontal: 20,)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 70,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,

                  child: RaisedButton(
                    onPressed:(){
                      uploadpdf();
                    } ,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save_alt,
                          size: 30,
                          color: Colors.black,),
                        SizedBox(width: 10,),
                        Text('Sauvgarder le Doc',
                          style: TextStyle(fontSize: 25,
                              color: Colors.black),

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
class lesson1fr extends StatefulWidget {
  @override
  _lesson1frState createState() => _lesson1frState();
}

class _lesson1frState extends State<lesson1fr> {

  Crudmethods crudmethods=new Crudmethods();


  bool isloading=false;
  File filepdf;
  Future getPDF()async{
    filepdf =await FilePicker.getFile(type: FileType.any);
  }
  uploadpdf()async{
    if (filepdf!=null) {
      setState(() {
        isloading=true;
      });
      StorageReference storageReference =  FirebaseStorage.instance.ref().child("lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task= storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String,String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata1fr(lessondata).then((result){
        Navigator.pop(context);
      });
    }  else{print('error');}
  }
  TextEditingController _titrecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25), ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment:Alignment.center,
          child: CircularProgressIndicator(),
        ):
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.file_upload,
                          size: 30,),
                        SizedBox(width: 20,),
                        Text("Upload Le Document",
                          style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _titrecontroller,
                          decoration: InputDecoration(
                              hintText: 'Entrez le titre du document',
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric( horizontal: 20,)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 70,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,

                  child: RaisedButton(
                    onPressed:(){
                      uploadpdf();
                    } ,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save_alt,
                          size: 30,
                          color: Colors.black,),
                        SizedBox(width: 10,),
                        Text('Sauvgarder le Doc',
                          style: TextStyle(fontSize: 25,
                              color: Colors.black),

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}