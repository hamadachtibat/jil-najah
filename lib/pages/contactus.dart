import 'package:flutter/material.dart';
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Contact Nous',
          style: TextStyle(
              fontSize: 25
          ),
        ),
        centerTitle: true,
        elevation: 0,

      ),
      backgroundColor: Colors.white24,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage('assets/images/jilnajah.jpeg'),
              ),
            ),
            SizedBox(height: 20,),
            Text("G.S.JIL NAJAH",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,width: 200,),
            Text("NOVEAU CONCEPT D'EDUCATION",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            SizedBox(height: 20,),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 8) ,
              child: ListTile(
                leading: Icon(Icons.phone,
                  color: Colors.pink,
                ),
                title: Text(" +212 539 32 22 00 ",

                ),

              ),
              elevation: 2,
            ),
            SizedBox(height: 20,),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 8) ,
              child: ListTile(
                leading: Icon(Icons.phone,
                  color: Colors.pink,
                ),
                title: Text(" +212 539 32 21 99 ",

                ),

              ),
              elevation: 2,
            ),
            SizedBox(height: 20,),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 8) ,
              child: ListTile(
                leading: Icon(Icons.email,
                  color: Colors.pink,
                ),
                title: Text("Ecole_jilnajah@hotmail.fr",
                ),

              ),

            )
          ],
        ),
      ),
    );
  }
}