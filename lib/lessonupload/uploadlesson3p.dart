import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/services/crud.dart';
import 'package:random_string/random_string.dart';

class lesson3m extends StatefulWidget {
  @override
  _lesson3mState createState() => _lesson3mState();
}

class _lesson3mState extends State<lesson3m> {

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
      Crudmethods().Aaddata3ma(lessondata).then((result){
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
class lesson3ac extends StatefulWidget {
  @override
  _lesson3acState createState() => _lesson3acState();
}

class _lesson3acState extends State<lesson3ac> {

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
      Crudmethods().Aaddata3ac(lessondata).then((result){
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
class lesson3ar extends StatefulWidget {
  @override
  _lesson3arState createState() => _lesson3arState();
}

class _lesson3arState extends State<lesson3ar> {

  Crudmethods crudmethods = new Crudmethods();


  bool isloading = false;
  File filepdf;

  Future getPDF() async {
    filepdf = await FilePicker.getFile(type: FileType.any);
  }

  uploadpdf() async {
    if (filepdf != null) {
      setState(() {
        isloading = true;
      });
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          "lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task = storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String, String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata3ar(lessondata).then((result) {
        Navigator.pop(context);
      });
    } else {
      print('error');
    }
  }

  TextEditingController _titrecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ) :
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,)
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: RaisedButton(
                    onPressed: () {
                      uploadpdf();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
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
class lesson3ei extends StatefulWidget {
  @override
  _lesson3eiState createState() => _lesson3eiState();
}

class _lesson3eiState extends State<lesson3ei> {

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
      Crudmethods().Aaddata3ei(lessondata).then((result){
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
class lesson3ea extends StatefulWidget {
  @override
  _lesson3eaState createState() => _lesson3eaState();
}

class _lesson3eaState extends State<lesson3ea> {

  Crudmethods crudmethods = new Crudmethods();


  bool isloading = false;
  File filepdf;

  Future getPDF() async {
    filepdf = await FilePicker.getFile(type: FileType.any);
  }

  uploadpdf() async {
    if (filepdf != null) {
      setState(() {
        isloading = true;
      });
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          "lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task = storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String, String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata3ea(lessondata).then((result) {
        Navigator.pop(context);
      });
    } else {
      print('error');
    }
  }

  TextEditingController _titrecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ) :
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,)
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: RaisedButton(
                    onPressed: () {
                      uploadpdf();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
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
class lesson3fr extends StatefulWidget {
  @override
  _lesson3frState createState() => _lesson3frState();
}

class _lesson3frState extends State<lesson3fr> {

  Crudmethods crudmethods = new Crudmethods();


  bool isloading = false;
  File filepdf;

  Future getPDF() async {
    filepdf = await FilePicker.getFile(type: FileType.any);
  }

  uploadpdf() async {
    if (filepdf != null) {
      setState(() {
        isloading = true;
      });
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          "lessons").child("${randomAlphaNumeric(9)}.pdf");
      final StorageUploadTask Task = storageReference.putFile(filepdf);
      var downloadurl = await(await Task.onComplete).ref.getDownloadURL();
      print('this is your $downloadurl');

      Map<String, String> lessondata = {
        "pdfurl": downloadurl,
        "titre": _titrecontroller.text,

      };
      Crudmethods().Aaddata3fr(lessondata).then((result) {
        Navigator.pop(context);
      });
    } else {
      print('error');
    }
  }

  TextEditingController _titrecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Upload Les leçons',
            style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: isloading ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ) :
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    getPDF();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,)
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: RaisedButton(
                    onPressed: () {
                      uploadpdf();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
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