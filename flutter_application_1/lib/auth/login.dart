



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/home.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController phoneControler = TextEditingController();
  TextEditingController smsControler = TextEditingController();

Future<bool> Login (String phone ,BuildContext context) async{

  FirebaseAuth _auth = FirebaseAuth.instance;

   _auth.verifyPhoneNumber(
  phoneNumber: phone,
  timeout: Duration(seconds: 60),
  verificationCompleted: (PhoneAuthCredential credential)async{

    Navigator.of(context).pop();
    UserCredential result=   await _auth.signInWithCredential(credential);

      User user =result.user;
        if(user!=null){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
        }

        else{
          print("Error");
        }
  },
  



  verificationFailed: (FirebaseAuthException e){
    if(e.code == 'invalid-phone-nmber'){
      print('The phone number is not valid');
    }
  } ,
  codeSent: (String verificationId, int  forceresendToken)async{
    
   showDialog(
     context: context,
     builder: (context){
        return AlertDialog(
          title: Text("Enter the otp"),
          content:Column(
             mainAxisSize: MainAxisSize.min,
            children: [
            TextField(
              controller: smsControler,

            )
          ],
          ),
          actions: [
            TextButton(onPressed: ()async{

               final smsCode = smsControler.text.trim();
              PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
             UserCredential result=  await _auth.signInWithCredential(phoneAuthCredential);

             User user =result.user;
        if(user!=null){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
        }

        else{
          print("Error");
        }
            },
            
             child:Text("Confirm OTP"))
          ],
        );

     });
  } ,
  codeAutoRetrievalTimeout: (String verificationId){}
  );  
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         
        children:[
          
          Text("Login",style: TextStyle(
            color:Colors.purple,
            fontSize: 30
          ),),
          
          SizedBox(height:20),
          TextField(
              controller: phoneControler,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
            
                labelText: "Mobile Number",
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(20))
              ),

          ),

          SizedBox(height: 20),
          SizedBox(height: 50,width: double.infinity,
           child: RaisedButton(
             color: Colors.purple,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             onPressed: () async{

              final  phone  = phoneControler.text.trim();

              Login(phone, context);
           }, child: Text("Login", style: TextStyle(
             color:Colors.white,
             fontSize: 20
           ),)))
          
           
        ]
        
      ),
      
    );
  }
}