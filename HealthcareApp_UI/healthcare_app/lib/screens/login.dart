import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 65, left: 30, right: 30),
        child: Column(
          children: [
            Text(
              "Sign In",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(34, 31, 31, 1),
                  fontSize: 18),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(249, 250, 251, 1),
                      height: 56,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              size: 24,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            hintText: "  Enter your email",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(34, 31, 31, 0.4),
                                fontSize: 14),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(34, 31, 31, 0.1),
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(34, 31, 31, 0.1),
                            ))),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: const Color.fromRGBO(249, 250, 251, 1),
                      height: 56,
                      child: TextFormField(
                        controller: _passwordController,
                        cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              size: 24,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                              size: 24,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            hintText: "  Enter your password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(34, 31, 31, 0.4),
                                fontSize: 14),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(34, 31, 31, 0.1),
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(34, 31, 31, 0.1),
                            ))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(64, 124, 226, 1),
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
                        backgroundColor: const Color.fromRGBO(64, 124, 226, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: const BorderSide(
                            color: Color.fromRGBO(64, 124, 226, 1),
                          ),
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Don’t have an account?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(34, 31, 31, 1),
                            fontSize: 14),
                      ),
                      TextSpan(
                        text: "  Sign up",

                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(64, 124, 226, 1),
                            fontSize: 14),
                        
                      ),
                    ])),
                    
                  ],
                )),
                    const SizedBox(height: 60),
                    Text(
                        "OR",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(161, 168, 176, 1),
                            fontSize: 16),
                      ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(),
                    )

          ],
        ),
      ),
    );
  }
}
