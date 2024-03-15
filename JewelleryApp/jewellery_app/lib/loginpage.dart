import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:jewelleryapp/profilepage.dart';
import 'package:jewellery_app/homepage.dart';

 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _passwordVisible = true;

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
        return Scaffold(
            backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
         // backgroundColor: Colors.black.withOpacity(0.9),  
        body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 230,right: 20,left: 20),
              child: Form(
                key:_formKey,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const SizedBox(height: 20,),
                    TextFormField( 
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: "EMAIL",
                        
                       // hintStyle: TextStyle(color: Colors.white)
                        //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        // prefixIcon:  Icon(
                        //   Icons.person,
                        // ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter username";
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),        
                    const SizedBox(height: 20,),        
                    TextFormField(
                      controller: passwordController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        hintText: " PASSWORD",
                       // hintStyle: const TextStyle(color: Colors.white),
                        //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20),  
                        // ),
                        // prefixIcon: const Icon( Icons.lock),
                        suffixIcon: IconButton( 
                            icon: Icon(_passwordVisible  ? Icons.visibility  : Icons.visibility_off), 
                            onPressed: () { 
                              setState( 
                                () { 
                                  _passwordVisible = !_passwordVisible; 
                                }, 
                              ); 
                            }, 
                          ), 
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter password";
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        fixedSize:const Size(350, 50) ,
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: (){
                        bool loginValidated = _formKey.currentState!.validate(); 
                        if(loginValidated){
                          if(loginValidated && usernameController.text == "shital@gmail.com" && passwordController.text == "shital@123"){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Login successful"),
                              ),
                            );
                          Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                              usernameController.clear();
                              passwordController.clear();
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Login Failed , Invalid Credentials.."),
                              ),
                            );
                          }
                        }
                      },
                      child:  Text("SIGN IN",
                      style: GoogleFonts.inter(
                          color:Colors.white,
                          fontWeight:FontWeight.w300,
                          fontSize:23,
                        ),
                      ),
                    ),   
                    const SizedBox(height: 20,),
                   const  Row(children: [
                      Column(children: [
                        Text("FORGOT",
                       // style: TextStyle(color: Colors.white),
                        ),
                        Text("PASSWORD",
                        //style: TextStyle(color: Colors.white),
                        ),
                      ],),
                      Spacer(),
                      Text("SIGN UP",
                     // style: TextStyle(color:Colors.white),
                      )

                    ],),
                    
                    
                  ],
                ),
              ),    
            ),
           ],
          ),
        );
      }
    }