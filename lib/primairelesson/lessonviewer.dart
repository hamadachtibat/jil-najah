import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Viewpdf extends StatefulWidget {
  @override
  _ViewpdfState createState() => _ViewpdfState();
}

class _ViewpdfState extends State<Viewpdf> {
  PDFDocument  doc;
  @override
  Widget build(BuildContext context) {
    String gata = ModalRoute.of(context).settings.arguments;
    ViewNow()async{
      doc= await PDFDocument.fromURL(gata);
      setState(() {

      });

    }
    Widget loading(){
      ViewNow();
      if (doc==null) {
        return Container(
          child:
          Center(
            child: CircularProgressIndicator(),
          ),
        );

      }
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(" votre leçon"),
          centerTitle: true,
          backgroundColor:Colors.amber

      ),
      body: doc==null?loading():PDFViewer(document: doc),
    );
  }
}