import 'package:e_learning_app/verify_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatNewPassword extends StatefulWidget {
  const CreatNewPassword({super.key});

  @override
  State<CreatNewPassword> createState() => _CreatNewPasswordState();
}

class _CreatNewPasswordState extends State<CreatNewPassword> {
  bool _passwordobsecureText = true;
  bool _ConfirmpasswordobsecureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ConfirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24, top: 50, right: 24, bottom: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyCodeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey,)
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, size: 24,)),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Center(child: Text("New Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your new password must be different", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Text("From previously used password", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    SizedBox(height: 40,),
                    Form(
                        child:
                        Column(children: [
                          Align(alignment: Alignment.topLeft,child: Text('Password')),
                          TextField(
                              controller: _passwordController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // labelText: "Email",
                                  hintText: "**********",
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _passwordobsecureText = ! _passwordobsecureText;
                                      });
                                    },
                                    icon: Icon(_passwordobsecureText ? Icons.visibility : Icons.visibility_off),),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.grey),
                                  )
                              )
                          ),
                          SizedBox(height: 10,),
                          Align(alignment: Alignment.topLeft,child: Text('Confirm Password')),
                          TextField(
                              controller: _ConfirmpasswordController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // labelText: "Email",
                                  hintText: "**********",
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _ConfirmpasswordobsecureText = ! _ConfirmpasswordobsecureText;
                                      });
                                    },
                                    icon: Icon(_ConfirmpasswordobsecureText ? Icons.visibility : Icons.visibility_off),),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.grey),
                                  )
                              )
                          ),
                        ],)),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: Center(child: Text("Creat New Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                    ),

                    SizedBox(height: 50,),
                    FloatingActionButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreatNewPassword()));
                      }, child: Icon(Icons.arrow_circle_right),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
