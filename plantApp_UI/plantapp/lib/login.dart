import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
               Transform.translate(
                    offset:const Offset(0.0, -30.0),
              child:Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/images/Group1.png")),),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Log in",
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              ),
              Container(
                height: 50,
                width: 320,
                margin: const EdgeInsets.only(left: 10, top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const  [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        offset: Offset(0, 8),
                        blurRadius: 20)
                  ],
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.local_phone_outlined,
                        color: Color.fromRGBO(164, 164, 164, 1),
                        size: 17,
                      ),
                      label: Text(
                        "Mobile Number",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(164, 164, 164, 1))),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color.fromRGBO(204, 211, 196, 1)))),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Verification()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10, top: 30),
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(0, 20),
                            blurRadius: 40)
                      ],
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(62, 102, 24, 1),
                        Color.fromRGBO(124, 180, 70, 1)
                      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Log in",
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
               
              ),
              const Spacer(),
              Image.asset("assets/images/login.png")
            ],
          ),
        ),
      ),
    );
  }
}
