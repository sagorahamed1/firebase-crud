import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Form(
          // key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60,),

              const Text("Registration", style: TextStyle(fontSize: 40),),
              const SizedBox(height: 30,
              ),
              ///------------------------email------------------>
              const SizedBox(
                height: 8,
              ),
              const Text("  Email"),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Enter your email"),
              ),
              const SizedBox(
                height: 8,
              ),

              ///------------------------password------------------>
              const SizedBox(
                height: 8,
              ),
              const Text("  Password"),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Enter your password"),
              ),
              const SizedBox(
                height: 8,
              ),



              const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
              var  email = emailController.text;
              var  password = passwordController.text;
                SignUpWithEmailAndPassword(email, password);
                },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> SignUpWithEmailAndPassword(String email, password)async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
  );
}

