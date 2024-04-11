import 'package:expense_manager_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginState();
}

class _LoginState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 280,
                height: 390,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your Account",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Form(
                      child: Column(
                        children: [
                           
                          Container(
                            height: 49,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    offset: Offset(0, 3),
                                    blurRadius: 10)
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text(
                                    "Name",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 49,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    offset: Offset(0, 3),
                                    blurRadius: 10)
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text(
                                    "Username",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 49,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    offset: Offset(0, 3),
                                    blurRadius: 10)
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text(
                                    "Password",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                           const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 49,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    offset: Offset(0, 3),
                                    blurRadius: 10)
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text(
                                    "Confirm Password",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));

                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(280, 49),
                              backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text("Sign Up", style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),),
                          ),
                        ],
                      ),
                    ),
                  
                  ],
                )
                ),
                  const Spacer(),
                    SizedBox(
                      width: 210,
                      height: 18,
                      child: Row(
                        children: [
                          Text("Already have an account? ", style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),),
                        GestureDetector(
               
                          onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
                          },
                          child: Text("Sign In", style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Color.fromRGBO(14, 161, 125, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),),
                        )
                        ],
                      ),
                    )
                  
          ],
        ),
      ),
    );
  }
}
