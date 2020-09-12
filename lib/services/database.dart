import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class  ourusers{
  String uid;
  String email;
  String fullname;
  Timestamp accountcreated;
  String isteacher;
  ourusers({
    this.uid,
    this.email,
    this.fullname,
    this.accountcreated,
    this.isteacher
  });

}