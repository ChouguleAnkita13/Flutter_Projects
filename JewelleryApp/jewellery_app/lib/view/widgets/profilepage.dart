import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.accountDetailsList});

  final List? accountDetailsList;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
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
                        backgroundColor: WidgetStateProperty.all(Colors.red),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        fixedSize: WidgetStateProperty.all<Size>(
                          const Size(190, 50),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
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
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(247, 236, 219, 1)),
                        foregroundColor: WidgetStateProperty.all(Colors.red),
                        fixedSize: WidgetStateProperty.all<Size>(
                          const Size(180, 50),
                        ),
                        side: WidgetStateProperty.all<BorderSide>(
                          const BorderSide(
                              color:
                                  Colors.red), // Set the border color and width
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signUp");
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.accountDetailsList == null
                  ? "Surname: "
                  : "Surname :${widget.accountDetailsList![0]['surname']}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.accountDetailsList == null
                  ? "Contact: "
                  : "Contact :${widget.accountDetailsList![0]['contactno']}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.accountDetailsList == null
                  ? "Email: "
                  : "Email :${widget.accountDetailsList![0]['email']}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ]);
  }
}
