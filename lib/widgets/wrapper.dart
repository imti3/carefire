import 'package:carefire/pages/authin/signup_page.dart';
import 'package:carefire/pages/note_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(context,snapshot){
   if(snapshot.connectionState== ConnectionState.waiting){
     return Center(child: CircularProgressIndicator(),
     );
   }
   else if(snapshot.hasError){
     return Center(child: Text("Error"),
     );
   }
   else{
   if(snapshot.data == null){
    return SignupPage();

   }
   else{

     return NoteView();
   }

   }


    },
    ),
    );
  }
}
