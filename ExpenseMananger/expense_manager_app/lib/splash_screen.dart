import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager_app/login_screen.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 300,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
              },
              child: Container(
                height: 144,
                width: 144,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(234, 238, 235, 1),
                    
                ),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            // const SizedBox(height: 300,),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              height:24,
              child: Text("Expense Manager",style: GoogleFonts.poppins(textStyle:const TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600,
              ),)),
            )
          ],
        ),
      ),
    );
  }
}