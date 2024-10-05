import 'package:e_learning_app/home_screen.dart';
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
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _isChecked = false;
  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';
  bool _isValidPassword = false;
  bool _isValidEmail = false;


  @override
  Widget build(BuildContext context) {

    bool _emailValiddation(String email){
      _emailErrorMessage = '';
      final bool emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if(email.isEmpty){
        // showError("Please enter email");
        _emailErrorMessage += 'Please enter email';
      }else if(!emailValid) {
        //showError("please enter valid email");
        _emailErrorMessage += 'please enter valid email (example@gmail.com)';
      }
      return _emailErrorMessage.isEmpty;
    }
    bool _passwordValidation(String password){
      _passwordErrorMessage = '';
      if(password.length < 6){
        // showError("password must be less than six characters");
        _passwordErrorMessage += 'password must be less than six characters';
      }else if(!password.contains(RegExp(r'[A-Z]'))){
        // showError("upper case letter");
        _passwordErrorMessage += 'atleast one upper case letter';
      }else if(!password.contains(RegExp(r'[a-z]'))){
        // showError("upper case letter");
        _passwordErrorMessage += 'atleast one lower case letter';
      }else if(!password.contains(RegExp(r'[0-9]'))){
        //showError("atleast one digit enter digit");
        _passwordErrorMessage += 'atleast one digit';
      }else if(!password.contains(RegExp(r'[[!@#%^&*(),.?":{}|<>]'))){
        // showError("please enter special characters");
        _passwordErrorMessage += 'atleast one special character';
      }
      return _passwordErrorMessage.isEmpty;

    }
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
                          controller: _emailController,
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
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            // labelText: "Email",
                              hintText: "**********",
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _obsecureText = ! _obsecureText;
                                  });
                                },
                                icon: Icon(_obsecureText ? Icons.visibility_off : Icons.visibility),),
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
                GestureDetector(
                  onTap: (){
                    String name = _nameController.text.trim();
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    _isValidEmail = _emailValiddation(email);
                    _isValidPassword = _passwordValidation(password);
                    if(name.isEmpty){
                      showError("please enter Name");
                    }else if(!_isValidEmail){
                      showError(_emailErrorMessage);
                    }else if(!_isValidPassword){
                      showError(_passwordErrorMessage);
                    }else if(!_isChecked){
                      showError("Are you agree with terms and conditions");
                    }else{
                      showError("Registration Successfull");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                  ),
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
  void showError(String error){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
      ),
    );
  }
}
