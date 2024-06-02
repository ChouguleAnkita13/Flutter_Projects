import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isChecked = false;
  bool _isPasswordVisiable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 65, left: 30, right: 30),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(34, 31, 31, 1),
                    fontSize: 18),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        color: const Color.fromRGBO(249, 250, 251, 1),
                        margin: const EdgeInsets.only(top: 40),
                        height: 56,
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 24,
                                color: Color.fromRGBO(34, 31, 31, 0.4),
                              ),
                              hintText: "  Enter your name",
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
                      Container(
                        color: const Color.fromRGBO(249, 250, 251, 1),
                        margin: const EdgeInsets.only(top: 25),
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
                      Container(
                        color: const Color.fromRGBO(249, 250, 251, 1),
                        margin: const EdgeInsets.only(top: 25, bottom: 15),
                        height: 56,
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          obscureText: _isPasswordVisiable,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                size: 24,
                                color: Color.fromRGBO(34, 31, 31, 0.4),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisiable = !_isPasswordVisiable;
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisiable
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 24,
                                  color: const Color.fromRGBO(34, 31, 31, 0.4),
                                ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                                value: _isChecked,
                                activeColor:
                                    const Color.fromRGBO(64, 124, 226, 1),
                                side: const BorderSide(
                                    color: Color.fromRGBO(34, 31, 31, 0.4)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              width: 244,
                              child: Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the healthcare",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(34, 31, 31, 1),
                                        fontSize: 13),
                                  ),
                                  TextSpan(
                                    text: " Terms of Service",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            64, 124, 226, 1),
                                        fontSize: 13),
                                  ),
                                  TextSpan(
                                    text: " and",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(34, 31, 31, 1),
                                        fontSize: 13),
                                  ),
                                  TextSpan(
                                    text: " Privacy Policy",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            64, 124, 226, 1),
                                        fontSize: 13),
                                  ),
                                ],
                              ))),
                        ],
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height / 2.5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/login");
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
                          backgroundColor:
                              const Color.fromRGBO(64, 124, 226, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                            side: const BorderSide(
                              color: Color.fromRGBO(64, 124, 226, 1),
                            ),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Already have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(34, 31, 31, 1),
                              fontSize: 14),
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/login");
                          },
                          child: Text(
                            "  Sign In",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(64, 124, 226, 1),
                                fontSize: 14),
                          ),
                        ))
                      ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
