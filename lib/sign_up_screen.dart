import 'package:e_learning_app/log_in_screen.dart';
import 'package:e_learning_app/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obsecureText = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Fill your information below or register", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Text("with your social account", style: TextStyle(fontSize: 14, color: Colors.grey),),
                  ],),
                SizedBox(height: 40,),
                Form(
                    child:
                    Column(children: [
                      Align(alignment: Alignment.topLeft,child: Text('Name')),
                      TextField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            // labelText: "Email",
                              hintText: "John",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(color: Colors.grey),
                              )
                          )
                      ),
                      SizedBox(height: 10,),
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
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue){
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    Text("Agree with "),
                    Text("Terms & Condition", style: TextStyle(fontSize: 14,decoration: TextDecoration.underline,decorationColor: Colors.lightBlue, color: Colors.lightBlue,))
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    children: [
                      Expanded(child: Divider(height: 1,)),
                      SizedBox(width: 10,),
                      GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyCodeScreen()));
                      },child: Text("Or sign in with", style: TextStyle(fontSize: 12),)),
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
                       child: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/google.svg", height: 20, width: 20,))
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
                    Text("Already have an account?", style: TextStyle(fontSize: 16),),
                    SizedBox(width: 5,),
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                    } ,child: Text("Sign In", style: TextStyle(fontSize: 18, color: Colors.blueAccent),))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
