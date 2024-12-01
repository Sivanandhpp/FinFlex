// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:finflex/core/services/database_service.dart';
// import 'package:finflex/screens/main/deposit_screen.dart';
// import 'package:finflex/screens/main/screen_notifications.dart';
// import 'package:finflex/screens/main/screen_transactions.dart';
// import 'package:finflex/screens/main/screen_viewcard.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:finflex/main.dart';
// import 'package:finflex/screens/main/screen_profile.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../core/globalvalues/sizedboxes.dart' as sb;

// import '../../core/globalvalues/theme_color.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     DatabaseService dbService = DatabaseService();
//     dbService.getDatabaseUser(userData.userid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           child: CircleAvatar(
//                             radius: 28,
//                             backgroundColor: ThemeColor.white,
//                             child: ClipOval(
//                               child: CachedNetworkImage(
//                                 imageUrl: userData.profile,
//                                 imageBuilder: (context, imageProvider) =>
//                                     Container(
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: imageProvider,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 placeholder: (context, url) =>
//                                     const CircularProgressIndicator(),
//                                 errorWidget: (context, url, error) =>
//                                     const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: ThemeColor.white,
//                                   child: ClipOval(
//                                     child: Image(
//                                       height: 50,
//                                       width: 50,
//                                       image: AssetImage(
//                                           "assets/images/avatar.jpg"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const ScreenProfile(),
//                               ),
//                             );
//                           },
//                         ),
//                         sb.width10,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Welcome back',
//                               style: GoogleFonts.ubuntu(
//                                 color: ThemeColor.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             Text(
//                               userData.name,
//                               style: GoogleFonts.ubuntu(
//                                 color: ThemeColor.secondary,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const ScreenNotification(),
//                           ),
//                         );
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30.0), //or 15.0
//                         child: Container(
//                           height: 50.0,
//                           width: 50.0,
//                           color: const Color.fromARGB(255, 232, 232, 232),
//                           child: const Icon(FontAwesomeIcons.bell,
//                               color: ThemeColor.grey, size: 30.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               sb.height20,
//               sb.height10,
//               Text(
//                 "Available Balance",
//                 style: GoogleFonts.ubuntu(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: ThemeColor.grey),
//               ),
//               FirebaseAnimatedList(
//                 query: dbReference.child('users/${userData.userid}'),
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 defaultChild: Center(
//                     child: Shimmer.fromColors(
//                   baseColor: ThemeColor.shimmerBG,
//                   highlightColor: ThemeColor.white,
//                   child: Text(
//                     "₹****.**",
//                     style: GoogleFonts.ibmPlexSans(
//                         fontSize: 55,
//                         fontWeight: FontWeight.w600,
//                         color: ThemeColor.black),
//                   ),
//                 )),
//                 itemBuilder: (context, snapshot, animation, index) {
//                   return Column(
//                     children: [
//                       if (snapshot.key == 'balance')
//                         Shimmer.fromColors(
//                           direction: ShimmerDirection.ltr,
//                           baseColor: ThemeColor.black,
//                           period: const Duration(milliseconds: 3000),
//                           highlightColor: ThemeColor.lightBlue,
//                           child: Text(
//                             "₹${snapshot.child('balance').value.toString()}",
//                             style: GoogleFonts.ibmPlexSans(
//                                 fontSize: 55,
//                                 fontWeight: FontWeight.w600,
//                                 color: ThemeColor.black),
//                           ),
//                         ),
//                     ],
//                   );
//                 },
//               ),
//               // Shimmer.fromColors(
//               //   direction: ShimmerDirection.ltr,
//               //   baseColor: ThemeColor.black,
//               //   period: const Duration(milliseconds: 3000),
//               //   highlightColor: ThemeColor.lightBlue,
//               //   child: Text(
//               //     "₹${userData.balance.toString()}",
//               //     style: GoogleFonts.ibmPlexSans(
//               //         fontSize: 55,
//               //         fontWeight: FontWeight.w600,
//               //         color: ThemeColor.black),
//               //   ),
//               // ),
//               sb.height20,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TransferScreen(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 40,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           color: ThemeColor.secondary,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Center(
//                           child: Text(
//                         "Transfer",
//                         style: GoogleFonts.ubuntu(
//                           color: ThemeColor.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )),
//                     ),
//                   ),
//                   sb.width20,
//                   Container(
//                     height: 40,
//                     width: 150,
//                     decoration: BoxDecoration(
//                         color: ThemeColor.lightGrey,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Center(
//                         child: Text(
//                       "Request",
//                       style: GoogleFonts.ubuntu(
//                         color: ThemeColor.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )),
//                   ),
//                 ],
//               ),
//               sb.height20,
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 500,
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             ThemeColor.primary,
//                             ThemeColor.scaffoldBgColor
//                           ]),

//                       // color: ThemeColor.primary,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Column(
//                       children: [
//                         // GestureDetector(
//                         //   onTap: () {},
//                         //   child: Container(
//                         //     width: double.infinity,
//                         //     height: 70,
//                         //     decoration: BoxDecoration(
//                         //       // boxShadow: const [
//                         //       //   BoxShadow(
//                         //       //       color: ThemeColor.shadow,
//                         //       //       blurRadius: 10,
//                         //       //       spreadRadius: 0.1,
//                         //       //       offset: Offset(0, 10)),
//                         //       // ],
//                         //       color: ThemeColor.white,
//                         //       borderRadius: BorderRadius.circular(20),
//                         //     ),
//                         //     child: Padding(
//                         //       padding: const EdgeInsets.symmetric(
//                         //           horizontal: 20.0, vertical: 15.0),
//                         //       child: Row(
//                         //         mainAxisAlignment:
//                         //             MainAxisAlignment.spaceBetween,
//                         //         children: [
//                         //           Text(
//                         //             "Cash Deposit",
//                         //             style: GoogleFonts.ubuntu(
//                         //                 fontSize: 20,
//                         //                 fontWeight: FontWeight.bold),
//                         //           ),
//                         //           Container(
//                         //             width: 100,
//                         //             decoration: BoxDecoration(
//                         //                 color: ThemeColor.secondary,
//                         //                 borderRadius:
//                         //                     BorderRadius.circular(20)),
//                         //             child: Center(
//                         //               child: const Icon(
//                         //                 Icons.arrow_forward,
//                         //                 color: ThemeColor.white,
//                         //               ),
//                         //             ),
//                         //           ),
//                         //         ],
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         // sb.height10,
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const TransactionsScreen(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               // boxShadow: const [
//                               //   BoxShadow(
//                               //       color: ThemeColor.shadow,
//                               //       blurRadius: 10,
//                               //       spreadRadius: 0.1,
//                               //       offset: Offset(0, 10)),
//                               // ],
//                               color: ThemeColor.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20.0, vertical: 15.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Transactions",
//                                     style: GoogleFonts.ubuntu(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                         color: ThemeColor.secondary,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: const Center(
//                                       child: Icon(
//                                         Icons.arrow_forward,
//                                         color: ThemeColor.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         sb.height10,
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const ViewCardScreen(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               // boxShadow: const [
//                               //   BoxShadow(
//                               //       color: ThemeColor.shadow,
//                               //       blurRadius: 10,
//                               //       spreadRadius: 0.1,
//                               //       offset: Offset(0, 10)),
//                               // ],
//                               color: ThemeColor.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20.0, vertical: 15.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Manage Card",
//                                     style: GoogleFonts.ubuntu(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                         color: ThemeColor.secondary,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: const Center(
//                                       child: Icon(
//                                         Icons.arrow_forward,
//                                         color: ThemeColor.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         sb.height80,
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
