import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';
import 'ourdata.dart';

class currentuser extends ChangeNotifier {
  ourusers _currentuser=ourusers();
  ourusers get getcurrentuser => _currentuser;
  FirebaseAuth _auth=FirebaseAuth.instance;

  Future<bool> signup(String email , String password,String fullname) async{
    bool retval = false;
    ourusers _user=ourusers();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user.uid=_authResult.user.uid;
      _user.email=_authResult.user.email;
      _user.fullname= fullname;
      ourdatabase().creatuser(_user);
      if(_authResult.user !=null){
        retval=true;
      }

    }catch(e){print('e');}

    return retval;
  }
  Future<bool> onstartup()async{
    bool retval = false;
    try{
      FirebaseUser _firebaseuser= await _auth.currentUser();
      _currentuser = await ourdatabase().getuserinfo(_firebaseuser.uid);
      retval=true;

    }catch(e){print("error");}

    return retval;
  }
  Future<bool> signout()async{
    bool retval = false;
    try{
      await _auth.signOut();
      _currentuser=ourusers();
      retval=true;

    }catch(e){print("error");}

    return retval;
  }
  Future<bool> login(String email , String password) async{
    bool retval=false;
    try {
      AuthResult _authresult =await _auth.signInWithEmailAndPassword(email: email, password: password);
      _currentuser = await ourdatabase().getuserinfo(_authresult.user.uid);
      if(_authresult!=null){

        retval=true;
      }
    }catch(e){print('error');}

    return retval;
  }


}