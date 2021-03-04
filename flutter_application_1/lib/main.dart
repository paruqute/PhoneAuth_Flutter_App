


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());


} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       home: Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.purple,
           title: Text("Phone Authentication",
           style: TextStyle(
             color:Colors.white,
             fontSize: 20
           ),),
         ),
         body: LoginScreen(),
       ),
      
    ); 
    
  }
}