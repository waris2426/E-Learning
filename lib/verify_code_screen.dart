import 'package:e_learning_app/creat_new_password.dart';
import 'package:e_learning_app/sign_up_screen.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_)=> TextEditingController());
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
                    Navigator.of(context).pop();
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
                Center(child: Text("Verify Code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please enter the code we just sent to email", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Text("example@gmail.com", style: TextStyle(fontSize: 16, color: Colors.blue),),
                  ],),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(4, (index){
                      return Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: _controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),

                          ),
                          //maxLength: 1,
                          onChanged: (value) {
                            if(value.length == 1 && index < 3){
                              FocusScope.of(context).nextFocus();
                            }else if(value.isEmpty && index > 0){
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    })
                  ],
                ),
                SizedBox(height: 50,),
                Text("Didn't receive OTP?", style: TextStyle(fontSize: 14, color: Colors.grey),),
                Text("Resend Code", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.underline, decorationColor: Colors.black),),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Center(child: Text("Verify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                ),
                SizedBox(height: 50,),
                FloatingActionButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreatNewPassword()));
                }, child: Icon(Icons.arrow_circle_right),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

