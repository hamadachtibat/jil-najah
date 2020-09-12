import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jilnajah/pages/home.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> currentuser(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Nunito",
          primaryColor: Colors.blueAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:Container(
            child: AnimatedSplashScreen(splash: Container(
              height: 300,
              child: Image.asset('assets/images/jilnajah.jpeg',
              ),
            ),
              nextScreen: ourroot(),
              splashTransition: SplashTransition.rotationTransition,
              duration: 2000,

            ),
          ),
        ),
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  int _pagestate= 0;
  var _backroundcolor = Colors.white;
  var _headingcolor = Color(0XFFB40284A);
  double _loginyoffset = 0;
  double _loginXoffsets = 0;
  double _registeryoffset=0;
  double     windowwith = 0;
  double   windowheight= 0;
  double  _loginpagewith=0;
  double _loginpageopacity= 1;
  double _loginheight=0;
  double _registreheight=0;
  bool _keyboarvisible= false;
  TextEditingController _fullnamecontroller=TextEditingController();
  TextEditingController _email1controller=TextEditingController();
  TextEditingController _email2controller=TextEditingController();
  TextEditingController _password1controller=TextEditingController();
  TextEditingController _password2controller=TextEditingController();
  void _loginin(String email, String password, BuildContext context) async{
    currentuser _currentuser = Provider.of<currentuser>(context ,listen:false );
    try{
      if( await  _currentuser.login(email, password)) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homepage()), (route) => false);
      }
    }catch(e){print('error');}
  }

  void _sinup(String email, String password,String fullname, BuildContext context) async {
    currentuser _currentuser = Provider.of<currentuser>(context ,listen:false );
    try{
      if( await  _currentuser.signup(email, password,fullname)) {
        setState(() {
          _pagestate = 1;
        });
      }
    }catch(e){print('error');}
  }
  @override
  void initState() {

    super.initState();
    print('Keyboard visibility direct query: ${KeyboardVisibility.isVisible}');
    // Subscribe
    KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        _keyboarvisible = visible;

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    windowheight = MediaQuery.of(context).size.height;
    windowwith= MediaQuery.of(context).size.width;
    _loginheight = windowheight-230;
    _registreheight=windowheight-230;

    switch(_pagestate){
      case 0:
        _backroundcolor = Colors.white;
        _headingcolor= Color(0XFFB40284A);
        _loginyoffset = windowheight;
        _registeryoffset=windowheight;
        _loginXoffsets=0;
        _loginpagewith= windowwith;
        _loginpageopacity= 1;
        break;
      case 1:
        _backroundcolor = Colors.amber;
        _headingcolor = Colors.white;
        _loginyoffset= _keyboarvisible ? 20:230 ;
        _registeryoffset=windowheight;
        _loginXoffsets= 0;
        _loginpagewith= windowwith;
        _loginpageopacity= 1;
        break;
      case 2:
        _backroundcolor = Colors.amber;
        _headingcolor = Colors.white;
        _loginyoffset= _keyboarvisible ? 20:210;
        _registeryoffset =_loginyoffset= _keyboarvisible ? 20:230;
        _loginXoffsets=20;
        _loginpagewith= windowwith- 40;
        _loginpageopacity= 0.7;
        break;
    }
    return
      Scaffold(
        body: Stack(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              color: _backroundcolor,
              child: SingleChildScrollView(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _pagestate=0;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            AnimatedContainer(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(
                                  milliseconds: 1000
                              ),
                              margin:  EdgeInsets.only(
                                top: 80,
                              ),
                              child: Text(
                                "BIENVENUE",

                                style: TextStyle(
                                  color: _headingcolor,
                                  fontSize: 28,

                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50
                              ),
                              child: Text(
                                "chez G.S JIL NAJAH votre "
                                    "platforme d'excellence",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: _headingcolor,
                                    fontSize: 18
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(child: Image.asset(
                          "assets/images/jilnajah.jpeg"
                      )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              if(_pagestate!= 0){
                                _pagestate= 0;
                              }else
                              {
                                _pagestate= 1;

                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(32),
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                                child: Text(
                                  "commencez",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                  ),
                                )
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ) ,
            ),

            AnimatedContainer(
              padding: EdgeInsets.all(20),
              width: _loginpagewith,
              height: _loginheight,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              transform: Matrix4.translationValues(_loginXoffsets, _loginyoffset, 0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(_loginpageopacity),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.only(bottom: 20) ,
                          child: Text(
                            "inscrie pour continue",
                            style: TextStyle(
                                fontSize: 25
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amber,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child:Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _email1controller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: 'Entrez Votre Email',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amber,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child:Icon(
                                  Icons.vpn_key,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _password1controller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: 'Entrez votre mot de passe',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            _loginin(_email1controller.text,_password1controller.text,context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18

                                ),
                              ),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              _pagestate= 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.amber,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "créer un compte",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 18

                                ),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            AnimatedContainer(
              height: _registreheight,
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              transform: Matrix4.translationValues(0, _registeryoffset, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "créer un nouveau compte ",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amber,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child:Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _fullnamecontroller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: 'Entrez Votre nom et prénom',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amber,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child:Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _email2controller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: 'Entrez Votre Email',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amber,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child:Icon(
                                  Icons.vpn_key,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _password2controller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: 'Entrez votre mot de passe',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],

                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: <Widget>
                      [
                        GestureDetector(
                          onTap: (){
                            _sinup(_email2controller.text,_password2controller.text ,_fullnamecontroller.text,context);

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "créer un compte",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17

                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _pagestate =1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.amber,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "retour",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 17

                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}

enum Authstatus {
  loggedin,
  notloggedin,
}
class ourroot extends StatefulWidget {
  @override
  _ourrootState createState() => _ourrootState();
}

class _ourrootState extends State<ourroot> {
  Authstatus _authstatus=Authstatus.notloggedin;
  @override
  void didChangeDependencies()async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    currentuser _currentuser=Provider.of<currentuser>(context,listen: false);
    if(await _currentuser.onstartup()==true){
      setState(() {
        _authstatus=Authstatus.loggedin;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget retval;
    switch(_authstatus) {
      case  Authstatus.notloggedin:
        retval=LoginPage();

        break;
      case  Authstatus.loggedin:
        retval=homepage();

        break;
      default:
    }



    return retval;
  }
}
