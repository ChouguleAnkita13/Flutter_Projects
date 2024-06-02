import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/model/onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _controller = PageController();

  final List<Onboard> pages = [
    const Onboard(
      img: "assets/images/onboard1.png",
      title: "Find a lot of specialist doctors in one place"
    ),
    const Onboard(
      img: "assets/images/onboard2.png",
      title: "Get advice only from a doctor you believe in."
),
    
  ];

  int index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 65,left: 35,right: 35),
        child: index < pages.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = pages.length;
                          });
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(161, 168, 176, 1),
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height:MediaQuery.sizeOf(context).height/1.6,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (newIndex) {
                        setState(() {
                          index = newIndex;
                        });
                      },
                      itemCount: pages.length,
                      itemBuilder: (context, pageIndex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image.asset(pages[pageIndex].img)),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: 260,
                              child: Text(
                                pages[pageIndex].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(34, 31, 31, 1),
                                    fontSize: 22),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: pages.length,
                        effect: SlideEffect(
                          spacing: 4.0,
                          radius: 4.0,
                          dotHeight: 5,
                          dotWidth: 14,
                          dotColor: const Color.fromRGBO(64, 124, 226, 1)
                              .withOpacity(0.3),
                          activeDotColor: const Color.fromRGBO(64, 124, 226, 1),
                        ),
                        onDotClicked: (newIndex) => _controller.animateToPage(
                          newIndex,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (index < pages.length - 1) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            );
                          } else {
                            setState(() {
                              index = pages.length;
                            });
                          }
                        },
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(64, 124, 226, 1),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 70,
                                spreadRadius: -13,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/onboard3.png"),
                    const SizedBox(height: 30),
                    Text(
                      "Let’s get started!",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(34, 31, 31, 1),
                          fontSize: 22),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Login to Stay healthy and fit",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(34, 31, 31, 0.6),
                          fontSize: 16),
                    ),
                    const SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 56),
                        backgroundColor: const Color.fromRGBO(64, 124, 226, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: const BorderSide(
                            color: Color.fromRGBO(64, 124, 226, 1),
                          ),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 56),
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: const BorderSide(
                            color: Color.fromRGBO(64, 124, 226, 1),
                          ),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(64, 124, 226, 1),
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
