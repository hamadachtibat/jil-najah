import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'Gsection.dart';
import 'MSection.dart';

class prescolaire extends StatefulWidget {
  @override
  _prescolaireState createState() => _prescolaireState();
}

class _prescolaireState extends State<prescolaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("choisisiez votre classe",
        style: TextStyle(
        fontSize: 23,
            color: Colors.black,
    ),),
    centerTitle: true,
    ),
    body: Stack(
    children: <Widget>[
    SingleChildScrollView(

    child: Column(
    children: <Widget>[
    SizedBox(height: 15,),
    OpenContainer(
    openBuilder: (context,_){
    return firstannecollege();
    },
    closedBuilder: (context,VoidCallback openContainer){
    return GestureDetector(
    onTap:  openContainer,
    child: Container(
    margin: EdgeInsets.all(8),
    height: 150,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    gradient: LinearGradient(
    colors: [Colors.white,Colors.tealAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.tealAccent,
    blurRadius: 12,
    offset: Offset(0,6),
    )
    ]
    ),
    child: Row(
    children: <Widget>[
    Image.asset("assets/images/jilnajah.jpeg",
    ),

    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Text("M.SECTION",
    style: TextStyle(
    fontSize: 23,
    ),),
    SizedBox(height: 10,),
    Image.asset("assets/images/college-icon-png-6.jpg",

    width:60,),
    ],
    )
    ],
    ),
    ),
    );
    },
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: Duration(milliseconds: 1000),
    closedColor: Colors.amber,
    ),
    SizedBox(height: 20,),
    OpenContainer(
    openBuilder: (context,_){
    return secondannecollege();
    },
    closedBuilder: (context,VoidCallback openContainer){
    return GestureDetector(
    onTap:  openContainer,
    child: Container(
    margin: EdgeInsets.all(8),
    height: 150,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    gradient: LinearGradient(
    colors: [Colors.white,Colors.tealAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.tealAccent,
    blurRadius: 12,
    offset: Offset(0,6),
    )
    ]
    ),
    child: Row(
    children: <Widget>[
    Image.asset("assets/images/jilnajah.jpeg",
    ),

    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Text("G.SECTION",
    style: TextStyle(
    fontSize: 23,
    ),),
    SizedBox(height: 10,),
    Image.asset("assets/images/college-icon-png-6.jpg",

    width:60,),
    ],
    )
    ],
    ),
    ),
    );
    },
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: Duration(milliseconds: 1000),
    closedColor: Colors.amber,
    ),
      SizedBox(height: 20,),
    ],
    ),
    )
    ],
    ),

    );
  }
}