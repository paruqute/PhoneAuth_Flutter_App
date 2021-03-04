import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body:Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       
         Text("Welcome! You successsfully loged in",style: TextStyle(
           color: Colors.white,
           fontSize: 30
         ),)
       ],

        
      ),)
            
        );
      
    
  }
}
