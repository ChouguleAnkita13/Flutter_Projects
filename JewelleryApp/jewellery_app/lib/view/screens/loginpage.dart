import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/view/widgets/profilepage.dart';
import 'package:jewellery_app/model/model.dart';
import 'dart:developer';

List<ModelClass> signlist = [];

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;
  List accountDetailsList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 230, right: 20, left: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "EMAIL",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      hintText: " PASSWORD",
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              _passwordVisible = !_passwordVisible;
                            },
                          );
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      bool loginValidated = _formKey.currentState!.validate();
                      int flag = 0;
                      if (loginValidated) {
                        for (int i = 0; i < signlist.length; i++) {
                          log("For");
                          if (emailController.text == signlist[i].email &&
                              passwordController.text == signlist[i].password) {
                            accountDetailsList.add({
                              'name': signlist[i].name,
                              'surname': signlist[i].surname,
                              'contactno': signlist[i].contactno,
                              'email': signlist[i].email,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Login successful"),
                              ),
                            );
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                  accountDetailsList: accountDetailsList),
                            ));
                            flag = 1;
                            break;
                          }
                        }
                        if (flag == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text("Login Failed , Invalid Credentials.."),
                            ),
                          );
                          Navigator.of(context).pushNamed("/profile");
                        }

                        emailController.clear();
                        passwordController.clear();
                      }
                    },
                    child: Text(
                      "SIGN IN",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "FORGOT",
                          ),
                          Text(
                            "PASSWORD",
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "SIGN UP",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
