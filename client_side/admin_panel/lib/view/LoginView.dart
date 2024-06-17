import 'package:admin_panel/controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Utils/Instances.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var FormKey = GlobalKey<FormState>();
  TextEditingController Email = TextEditingController();
  TextEditingController Pwd = TextEditingController();
  var ShowPwd = true;

  Map<String,dynamic> Logindata = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [

            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width/2,
              child: Padding(
                padding: const EdgeInsets.all(150.0),
                child: SvgPicture.asset('assets/images/login.svg',
                  height: 200.0,
                  width: 100.0,
                ),
              ),
            ),

            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width/2,
              child: Form(
                key: FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Login",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0,
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: "Enter Email",
                        ),
                        cursorColor: Colors.black,
                        controller: Email,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Enter Email";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: "Enter Password",
                          suffixIcon: IconButton(
                              icon: Icon(ShowPwd ? Icons.security : Icons.remove_red_eye),
                              onPressed: (){
                                setState(() {
                                  ShowPwd = ShowPwd ? false : true;
                                });
                              }),
                        ),
                        obscureText: ShowPwd,
                        cursorColor: Colors.black,
                        controller: Pwd,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Enter Password";
                          }
                          else if(value.length<5)
                          {
                            return "Password Contain Only 6 Character";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 200.0,
                        vertical: 30.0,
                      ),
                      child: OutlinedButton(
                        onPressed: (){
                          if(FormKey.currentState!.validate())
                          {
                            Logindata.addEntries({"email" : Email.text.toString()}.entries);
                            Logindata.addEntries({"password" : Pwd.text.toString()}.entries);
                            loginController.Login(context,Logindata);
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),


                  ],
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
