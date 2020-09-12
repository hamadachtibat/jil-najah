import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class najahphoto extends StatefulWidget {
  @override
  _najahphotoState createState() => _najahphotoState();
}

class _najahphotoState extends State<najahphoto> {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_view = Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 100),
      height: 400,

      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: true,
        borderRadius: true,

        animationDuration: Duration(seconds: 3),
        autoplayDuration: Duration(seconds: 5),
        images: [
          AssetImage('assets/images/16388993_630707420463902_1620168689_o.jpg'),
          AssetImage('assets/images/16389276_630708147130496_1545873713_o.jpg'),
          AssetImage('assets/images/29665999_1790998817646487_603544592_n.jpg'),
          AssetImage('assets/images/29745572_1790998620979840_1524399638_n.jpg'),
          AssetImage('assets/images/29750889_1790998444313191_1598323921_n.jpg'),
          AssetImage('assets/images/30074220_368066013708808_1176886099_o.jpg'),
          AssetImage('assets/images/30429319_1818535301559505_392166157_n.jpg'),
          AssetImage('assets/images/30429416_1818589364887432_81435245_n.jpg'),
          AssetImage('assets/images/30429916_1818577971555238_920412204_n.jpg'),
          AssetImage('assets/images/30771609_1817388488340853_591259546_o.jpg'),
          AssetImage('assets/images/53067868_410488856367159_692022280535932928_n.jpg'),
          AssetImage('assets/images/96361305_1099108517136712_2849894964798685184_n.jpg'),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        title: Text("G.S.JIL NAJAH",
          style:TextStyle(
              fontSize: 25
          ) ,),
      ),

      body:
      Center(
        child: ListView(
          children: <Widget>[
            image_slider_view,
          ],
        ),
      ),
    );
  }
}