import 'package:finflex/core/globalvalues/theme_color.dart';
import 'package:finflex/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../core/globalvalues/sizedboxes.dart' as sb;

class ViewCardScreen extends StatefulWidget {
  const ViewCardScreen({super.key});

  @override
  State<ViewCardScreen> createState() => _ViewCardScreenState();
}

class _ViewCardScreenState extends State<ViewCardScreen> {
  String getCardNumber(String inputNum) {
    // Use regex to match every group of 4 characters
    return inputNum.replaceAllMapped(
        RegExp(r'(.{4})'), (match) => '${match.group(0)} ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 10, top: 10, bottom: 10),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "View Card",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () {
                    //TODO:
                  },
                  child: Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 100,
                            spreadRadius: 1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -1,
                          bottom: -1,
                          child: SizedBox(
                            width: 80,
                            child: Center(
                                child: Image.asset(
                              'assets/images/finflex.png',
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: SizedBox(
                            width: 200,
                            child: Center(
                                child: Transform.rotate(
                              angle: 315 * math.pi / 180,
                              child: Opacity(
                                opacity: 0.3,
                                child: Image.asset(
                                  'assets/images/finflex.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: SizedBox(
                            width: 100,
                            child: Center(
                                child: Image.asset(
                              'assets/images/visa.png',
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "FinFlex",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      getCardNumber(
                                          "333366${userData.phoneNo}"),
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColor.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "EXP 09/28",
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColor.white),
                                ),
                                // Container(
                                //   width: 140,
                                //   height: 50,
                                //   decoration: BoxDecoration(
                                //       color: ThemeColor.secondary,
                                //       borderRadius: BorderRadius.circular(20)),
                                //   child: Center(
                                //     child: Text(
                                //       "View users",
                                //       style: GoogleFonts.ubuntu(
                                //           fontSize: 13,
                                //           color: ThemeColor.white),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sb.height10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
