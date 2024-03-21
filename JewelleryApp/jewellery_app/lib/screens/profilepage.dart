import 'package:flutter/material.dart';
import 'package:jewellery_app/screens/addtocart.dart';
import 'package:jewellery_app/screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/screens/homepage.dart';
import 'package:jewellery_app/screens/loginpage.dart';
import 'package:jewellery_app/screens/signup_page.dart';
import 'package:jewellery_app/screens/your_order.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.accountDetailsList});

  final List? accountDetailsList;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
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
                    SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: (widget.accountDetailsList == null)
              ? Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(190, 50),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the radius as needed
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(
                      width: 7,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(247, 236, 219, 1)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.red),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(180, 50),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: Colors
                                    .red), // Set the border color and width
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the radius as needed
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                )
              : const Row(
                  children: [],
                ),
        ),
        Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.accountDetailsList == null
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(
                      height: 80,
                    ),
              Text(
                widget.accountDetailsList == null
                    ? "Name: "
                    : "  Name :${widget.accountDetailsList![0]['name']}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.accountDetailsList == null
                    ? "Surname: "
                    : "Surname :${widget.accountDetailsList![0]['surname']}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.accountDetailsList == null
                    ? "Contact: "
                    : "Contact :${widget.accountDetailsList![0]['contactno']}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.accountDetailsList == null
                    ? "Email: "
                    : "Email :${widget.accountDetailsList![0]['email']}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ]),
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
                          builder: (context) => const HomePage()));
                    },
                    icon: const Icon(Icons.home_outlined)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Categories()));
                    },
                    icon: const Icon(Icons.category_outlined)),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const YourOrder()));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined)),
                label: 'Your order'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddToCart()));
                    },
                    icon: const Icon(Icons.shopping_cart_outlined)),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                    },
                    icon: const Icon(Icons.person_3_outlined)),
                label: 'Profile'),
          ]),
    );
  }
}
