import 'package:flutter/material.dart';
import 'package:jewellery_app/screens/profilepage.dart';
import 'package:jewellery_app/screens/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/database/database_connection.dart';
import 'package:jewellery_app/model/model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // @override
  // void initState() {
  //   super.initState();
  //   dbConnection();
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //Name textfield
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "NAME",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //surname text field
                  TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(
                      hintText: "SURNAME",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter surname";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //contact no textfield
                  TextFormField(
                    controller: contactNoController,
                    decoration: const InputDecoration(
                      hintText: "CONTACT NO",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter contactno";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //email textfield
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "EMAIL",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //password textfield
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "PASSWORD",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //repeat password textfield
                  TextFormField(
                    controller: repeatPasswordController,
                    decoration: const InputDecoration(
                      hintText: "REPEAT PASSWORD",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(370, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      bool signupValidated = _formKey.currentState!.validate();
                      if (signupValidated) {
                        setState(() {
                          insertSignupData(
                            ModelClass(
                              name: nameController.text.trim(),
                              surname: surnameController.text.trim(),
                              contactno: contactNoController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              repeatpassword:
                                  repeatPasswordController.text.trim(),
                            ),
                          );
                        });
                         Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                        // print(await getSignUpData());
                        //                 Navigator.of(context).push(
                        //                       MaterialPageRoute(
                        //                         builder: (context) => const LoginPage(),
                        //                       ),
                        //                     );
                        nameController.clear();
                        surnameController.clear();
                        contactNoController.clear();
                        emailController.clear();
                        passwordController.clear();
                        repeatPasswordController.clear();
                      }
                    },
                    child: Text(
                      "SIGN UP",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 23,
                      ),
                    ),
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
