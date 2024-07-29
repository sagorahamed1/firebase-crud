import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/views/screens/auth/sign_up/sign_up_screen.dart';
import 'package:firebase_crud/views/screens/home/home_screens.dart';
import 'package:flutter/material.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  
  LogIn()async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCanensial = userCredential.user;
      print(authCanensial!.uid);

      if(authCanensial.uid .isNotEmpty){
        print("-----------------------${authCanensial.uid}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }else{
        print("sign up faided");
      }
    }catch(e){
      print("error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60,),

              const Text("Log In", style: TextStyle(fontSize: 40),),
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
                validator: (value) {
                  if(value == null){
                    return "plaes enter your email";
                  }
                },
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
                validator: (value){
                  if(value == null){
                    return "Enter your password";
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),



              const SizedBox(height: 40,),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("  Remember Me" ,style: TextStyle(color: Colors.green),),
                  Text("Forgot  ",style: TextStyle(color: Colors.green),),
                ],
              ),

              const SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  LogIn();
                }
              }, child: const Text("Sign In ")),

              const SizedBox(height: 15,),
              Row(
                  children: [
                    const Text("Don't have an account?"),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    }, child: const Text("Sign Up",style: TextStyle(color: Colors.green)),)
                  ]
              ),

              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
