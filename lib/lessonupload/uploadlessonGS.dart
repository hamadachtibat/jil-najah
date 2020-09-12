import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jilnajah/services/crud.dart';
import 'package:random_string/random_string.dart';

class lesson2cm extends StatefulWidget {
  @override
  _lesson2cmState createState() => _lesson2cmState();
}

class _lesson2cmState extends State<lesson2cm> {

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
      Crudmethods().Aaddata2cma(lessondata).then((result){
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
class lesson2cphy extends StatefulWidget {
  @override
  _lesson2cphyState createState() => _lesson2cphyState();
}

class _lesson2cphyState extends State<lesson2cphy> {

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
      Crudmethods().Aaddata2cphy(lessondata).then((result){
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
class lesson2csvt extends StatefulWidget {
  @override
  _lesson2csvtState createState() => _lesson2csvtState();
}

class _lesson2csvtState extends State<lesson2csvt> {

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
      Crudmethods().Aaddata2csvt(lessondata).then((result) {
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
class lesson2cfr extends StatefulWidget {
  @override
  _lesson2cfrState createState() => _lesson2cfrState();
}

class _lesson2cfrState extends State<lesson2cfr> {

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
      Crudmethods().Aaddata2cfr(lessondata).then((result){
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
class lesson2carb extends StatefulWidget {
  @override
  _lesson2carbState createState() => _lesson2carbState();
}

class _lesson2carbState extends State<lesson2carb> {

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
      Crudmethods().Aaddata2carab(lessondata).then((result) {
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
class lesson2cei extends StatefulWidget {
  @override
  _lesson2ceiState createState() => _lesson2ceiState();
}

class _lesson2ceiState extends State<lesson2cei> {

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
      Crudmethods().Aaddata2cei(lessondata).then((result) {
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
class lesson2chg extends StatefulWidget {
  @override
  _lesson2chgState createState() => _lesson2chgState();
}

class _lesson2chgState extends State<lesson2chg> {

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
      Crudmethods().Aaddata2chg(lessondata).then((result) {
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
class lesson2ceng extends StatefulWidget {
  @override
  _lesson2cengState createState() => _lesson2cengState();
}

class _lesson2cengState extends State<lesson2ceng> {

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
      Crudmethods().Aaddata2ceng(lessondata).then((result) {
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