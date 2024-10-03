import 'package:e_learning_app/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obsecureText = true;


  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();

    void _login(){
      String email = _emailController.text.trim();
      if(email.isEmpty){
        showError(email);
      }
    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 70),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                SizedBox(height: 10,),
                Center(child: Text("Hi! Welcome back, You've been missed", style: TextStyle(fontSize: 14, color: Colors.grey),)),
                SizedBox(height: 40,),
                Form(
                    child:
                    Column(children: [
                      Align(alignment: Alignment.topLeft,child: Text('Email')),
                      TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                         // labelText: "Email",
                          hintText: "example@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.grey),
                          )
                        )
                      ),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,child: Text('Password')),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                         // labelText: "Email",
                          hintText: "**********",
                            suffixIcon: IconButton(
                              onPressed: (){
                               setState(() {
                                 _obsecureText = ! _obsecureText;
                               });
                              },
                              icon: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey),
                          )
                        )
                      ),
                                ],)),
                SizedBox(height: 10,),
                Align(alignment: Alignment.topRight,child: Text("Forgot Password?", style: TextStyle(fontSize: 14,decoration: TextDecoration.underline,decorationColor: Colors.lightBlue, color: Colors.lightBlue,))),
                SizedBox(height: 30,),
                GestureDetector(
                onTap: (){
                 _login();

                },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Center(child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    children: [
                      Expanded(child: Divider(height: 1,)),
                      SizedBox(width: 10,),
                      Text("Or sign in with", style: TextStyle(fontSize: 12),),
                      SizedBox(width: 10,),
                      Expanded(child: Divider(height: 1,))
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey,)
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.apple, size: 40,)),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey,)
                      ),
                     child: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/google.svg", height: 20, width: 20,)),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey,)
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.facebook, size: 40, color: Colors.blue,)),


                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontSize: 16),),
                    SizedBox(width: 5,),
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    } ,child: Text("Sign up", style: TextStyle(fontSize: 18, color: Colors.blueAccent),))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  void showError(String error){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
      ),
    );
  }
}
