// ignore_for_file: use_build_context_synchronously

import 'package:cap_corporate/components/my_button.dart';
import 'package:cap_corporate/components/my_textfield.dart';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final Function()?onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController=TextEditingController();

  // sign user in method
  void signUserUp() async {
    showDialog(context: context, builder: (context){
      return const Center(child:CircularProgressIndicator(),);
    });


    try{
      if(passwordController.text==confirmPasswordController.text){
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:emailController.text,
       password: passwordController.text,

       );

      }else{
        showErrorMessage("Passwords doen't match");

      }
   
       Navigator.pop(context);
    }on FirebaseAuthException catch (e){
      
      Navigator.pop(context);
      showErrorMessage(e.code);

      
    }
       
  }

  void showErrorMessage(String message){
    showDialog(context: context,
     builder: (context){
      return  AlertDialog(
        backgroundColor: Colors.deepPurple,
        title:Center(child: Text(message,
        style:const TextStyle(color:Colors.white),
        ),),

        );
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600), // Set maximum width
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const  SizedBox(height: 30),

                    // logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),

                    const SizedBox(height: 30),

                    // welcome back, you've been missed!
                    Text(
                      'Lets create an account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // username textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                     

                    

                    const SizedBox(height: 25),

                    // sign in button
                    MyButton(
                      text:"Sign Up",
                      onTap: signUserUp,
                    ),

                    const SizedBox(height: 30),

                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                   const  SizedBox(height: 30),

                    // google + apple sign in buttons
                 

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                         const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
