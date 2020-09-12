import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'database.dart';
class ourdatabase{
  final Firestore _firestore=Firestore.instance;
  Future<bool> creatuser(ourusers user) async{
    bool retval=false;
    try{
      await _firestore.collection("users").document(user.uid).setData({
        'fullname':user.fullname,
        'email':user.email,
        'accountcreated':Timestamp.now(),
        'isteacher':user.isteacher,
      });
      retval=true;
    }catch(e){print(e);}
    return retval;
  }
  Future<ourusers> getuserinfo(String uid)async{
    ourusers retval=ourusers();
    try{
      DocumentSnapshot _docsnapshot= await _firestore.collection("users").document(uid).get();
      retval.uid=uid;
      retval.fullname= _docsnapshot.data["fullname"];
      retval.email=_docsnapshot.data["email"];
      retval.accountcreated=_docsnapshot.data["accouncreated"];
      retval.isteacher=_docsnapshot.data['isteacher'];
    }catch(e){print('error');}
    return retval;
  }

}