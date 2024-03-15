import 'package:flutter/material.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';
import 'package:jewellery_app/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/homepage.dart';
import 'package:jewellery_app/loginpage.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key,this.usernameController});
  final String? usernameController ;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(51, 51, 51, 1),
            size: 24,
          ),
          
          Icon(Icons.favorite_border,
              color: Color.fromRGBO(51, 51, 51, 1), size: 24),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body:  Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 10,),
        Row(children: [
          const SizedBox(width: 7,),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
               fixedSize: MaterialStateProperty.all<Size>(Size(190, 50),),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: (){
               Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
            }, 
            child: const Text(
              "SIGN IN",
              style: TextStyle(fontSize: 20),
            )
          ),
          const SizedBox(width: 7,),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(247, 236, 219, 1)),
              foregroundColor: MaterialStateProperty.all(Colors.red),
               fixedSize: MaterialStateProperty.all<Size>(Size(180, 50),),
               side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.red), // Set the border color and width
               ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: (){}, 
            child: const Text(
              "CREATE ACCOUNT",
              style: TextStyle(fontSize: 15),
            )
          ),
        ],
       ),
       const SizedBox(height: 120,),
       const Text(
         "  Name :",
         style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20,),
       const Text(
         "  Contact No :",
         style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20,),
        const Text(
         "  Email :  ",
         style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20,),
       const Text(
         "  Address :",
         style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600),
        ),
      ],
     ),

     bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
           items: [
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>const HomePage()));
                    }, icon: const Icon(Icons.home_outlined)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>const Categories()));
                    },
                    icon: const Icon(Icons.category_outlined)),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(BitcoinIcons.cart_outline)),
                label: 'Your order'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>const ProfilePage()));
                     },
                    icon: const Icon(Icons.person_3_outlined)),
                label: 'Profile'),
          ]),
    );
  }
}