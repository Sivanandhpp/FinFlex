import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ScreenAbout extends StatelessWidget {
  ScreenAbout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                        "About",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       'About',
                //       style: TextStyle(
                //         color: ThemeColor.black,
                //         fontSize: 26,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     InkWell(
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: ThemeColor.lightGrey,
                //             borderRadius: BorderRadius.circular(12)),
                //         padding: const EdgeInsets.all(12),
                //         child: const Icon(
                //           Icons.verified_user,
                //           color: Colors.white,
                //         ),
                //       ),
                //       onTap: () {
                //
                //       },
                //     ),
                //   ],
                // ),
                // sb.height20,
                Container(
                  width: double.infinity,
                  // height: 380,
                  decoration: BoxDecoration(
                      // boxShadow: const [
                      //   BoxShadow(
                      //       color: ThemeColor.shadow,
                      //       blurRadius: 10,
                      //       spreadRadius: 0.2,
                      //       offset: Offset(0, 10)),
                      // ],
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/jain.png'),
                      ),
                      Column(
                        children: [
                          Text(
                            'MCA - Students',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.ubuntu().fontFamily),
                          ),
                          Text(
                            'Data Structures Project',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.ubuntu().fontFamily),
                          ),
                        ],
                      ),
                      // Text(
                      //   'CONTACT LINKS',
                      //   style: GoogleFonts.ubuntu(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.bold,
                      //     color: ThemeColor.grey,
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     // InkWell(
                      //     //   child: const FaIcon(
                      //     //     FontAwesomeIcons.whatsapp,
                      //     //     size: 35,
                      //     //     color: ThemeColor.waGreen,
                      //     //   ),
                      //     //   onTap: () {},
                      //     // ),
                      //     InkWell(
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.instagram,
                      //         size: 35,
                      //         color: ThemeColor.instaPurpleRed,
                      //       ),
                      //       onTap: () {
                      //         launchUrl(
                      //             mode:
                      //                 LaunchMode.externalNonBrowserApplication,
                      //             Uri(
                      //                 scheme: "https",
                      //                 host: "instagram.com",
                      //                 path: "modelpolytechniccollegevdk"));
                      //       },
                      //     ),
                      //     InkWell(
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.facebook,
                      //         size: 35,
                      //         color: ThemeColor.primary,
                      //       ),
                      //       onTap: () {
                      //         launchUrl(
                      //             mode:
                      //                 LaunchMode.externalNonBrowserApplication,
                      //             Uri(
                      //                 scheme: "https",
                      //                 host: "facebook.com",
                      //                 path: "mptcv"));
                      //       },
                      //     ),
                      //     InkWell(
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.linkedin,
                      //         size: 35,
                      //         color: ThemeColor.primary,
                      //       ),
                      //       onTap: () {
                      //         launchUrl(
                      //             mode: LaunchMode.externalApplication,
                      //             Uri(
                      //                 scheme: "https",
                      //                 host: "linkedin.com",
                      //                 path:
                      //                     "in/model-polytechnic-college-vadakara-9327a225a"));
                      //       },
                      //     ),
                      //     // InkWell(
                      //     //   child: const FaIcon(
                      //     //     FontAwesomeIcons.youtube,
                      //     //     size: 35,
                      //     //     color: ThemeColor.ytRed,
                      //     //   ),
                      //     //   onTap: () {},
                      //     // ),
                      //     InkWell(
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.globe,
                      //         size: 35,
                      //         color: ThemeColor.instaPurpleRed,
                      //       ),
                      //       onTap: () {
                      //         launchUrl(
                      //             mode: LaunchMode.externalApplication,
                      //             Uri(
                      //                 scheme: "http",
                      //                 host: "mptvadakara.ihrd.ac.in"));
                      //       },
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                sb.height10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "The Team",
                          style: GoogleFonts.ubuntu(
                              color: ThemeColor.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sb.height10,
                    Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: ThemeColor.shadow,
                        //       blurRadius: 100,
                        //       spreadRadius: 1,
                        //       offset: Offset(0, 10)),
                        // ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0),
                                //   child: const SizedBox(
                                //     height: 70.0,
                                //     width: 70.0,
                                //     child: Image(
                                //       image:
                                //           AssetImage('assets/images/siva.jpeg'),
                                //     ),
                                //   ),
                                // ),

                                sb.width20,
                                Text(
                                  "1",
                                  style: GoogleFonts.ubuntu(
                                      color: ThemeColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      "Sivanandh P P",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "JUKPG24MCA11526",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "linkedin.com",
                                        path: "in/sivanandh"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.angleRight,
                                      color: Colors.white, size: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sb.height5,
                    Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: ThemeColor.shadow,
                        //       blurRadius: 100,
                        //       spreadRadius: 1,
                        //       offset: Offset(0, 10)),
                        // ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0),
                                //   child: const SizedBox(
                                //     height: 70.0,
                                //     width: 70.0,
                                //     child: Image(
                                //       image: AssetImage(
                                //           'assets/images/avatar.jpg'),
                                //     ),
                                //   ),
                                // ),
                                // sb.width20,
                                sb.width20,
                                Text(
                                  "2",
                                  style: GoogleFonts.ubuntu(
                                      color: ThemeColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      "Aleena N",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "JUKPG24MCAS11527",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "linkedin.com",
                                        path: "in/aleena-n-926079295"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.angleRight,
                                      color: Colors.white, size: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sb.height5,
                    // const Divider(
                    //   color: Colors.black,
                    //   thickness: 0.5,
                    // ),
                    Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: ThemeColor.shadow,
                        //       blurRadius: 100,
                        //       spreadRadius: 1,
                        //       offset: Offset(0, 10)),
                        // ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0),
                                //   child: const SizedBox(
                                //     height: 70.0,
                                //     width: 70.0,
                                //     child: Image(
                                //       image: AssetImage(
                                //           'assets/images/avatar.jpg'),
                                //     ),
                                //   ),
                                // ),
                                // sb.width20,
                                sb.width20,
                                Text(
                                  "3",
                                  style: GoogleFonts.ubuntu(
                                      color: ThemeColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      "Anuranj S Manoj",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "JUKPG24MCAS11619",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "linkedin.com",
                                        path: "in/anuranj-s-manoj-ba5871250"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.angleRight,
                                      color: Colors.white, size: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sb.height5,
                    // const Divider(
                    //   color: Colors.black,
                    //   thickness: 0.5,
                    // ),
                    Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: ThemeColor.shadow,
                        //       blurRadius: 100,
                        //       spreadRadius: 1,
                        //       offset: Offset(0, 10)),
                        // ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0),
                                //   child: const SizedBox(
                                //     height: 70.0,
                                //     width: 70.0,
                                //     child: Image(
                                //       image: AssetImage(
                                //           'assets/images/avatar.jpg'),
                                //     ),
                                //   ),
                                // ),
                                // sb.width20,
                                sb.width20,
                                Text(
                                  "4",
                                  style: GoogleFonts.ubuntu(
                                      color: ThemeColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      "Nabeel Nasar",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "JUKPG24MCAS10696",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "linkedin.com",
                                        path: "in/muhammednabeelnasar"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.angleRight,
                                      color: Colors.white, size: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sb.height5,
                    // const Divider(
                    //   color: Colors.black,
                    //   thickness: 0.5,
                    // ),
                    Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: ThemeColor.shadow,
                        //       blurRadius: 100,
                        //       spreadRadius: 1,
                        //       offset: Offset(0, 10)),
                        // ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20.0),
                                //   child: const SizedBox(
                                //     height: 70.0,
                                //     width: 70.0,
                                //     child: Image(
                                //       image: AssetImage(
                                //           'assets/images/avatar.jpg'),
                                //     ),
                                //   ),
                                // ),
                                // sb.width20,
                                sb.width20,
                                Text(
                                  "5",
                                  style: GoogleFonts.ubuntu(
                                      color: ThemeColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      "Abhijith M",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "JUKPG24MCA11490",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "linkedin.com",
                                        path: "in/"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.angleRight,
                                      color: Colors.white, size: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // const Divider(
                //   color: Colors.black,
                //   thickness: 0.5,
                // ),
                sb.height80
              ],
            ),
          ),
        ),
      ),
    );
  }
}
