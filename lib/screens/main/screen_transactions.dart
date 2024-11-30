import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;
import 'package:finflex/core/globalvalues/theme_color.dart';
import 'package:finflex/core/services/database_service.dart';
import 'package:finflex/main.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  DatabaseService dbService = DatabaseService();
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
                      "Transactions",
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              sb.height20,
              Text(
                "Current Balance",
                style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ThemeColor.grey),
              ),
              Text(
                "₹${userData.balance.toString()}",
                style: GoogleFonts.numans(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.black),
              ),
              sb.height20,
              FirebaseAnimatedList(
                query:
                    dbReference.child('users/${userData.userid}/transactions'),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                sort: (a, b) {
                  return b.key.toString().compareTo(a.key.toString());
                },
                defaultChild: const Center(
                  child: CircularProgressIndicator(
                    color: ThemeColor.primary,
                  ),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  snapshot.child('sent').value == true
                                      ? Transform.rotate(
                                          angle: 45 * math.pi / 180,
                                          child: Icon(FontAwesomeIcons.arrowUp,
                                              color: ThemeColor.red,
                                              size: 30.0),
                                        )
                                      : Transform.rotate(
                                          angle: 45 * math.pi / 180,
                                          child: Icon(
                                              FontAwesomeIcons.arrowDown,
                                              color: ThemeColor.green,
                                              size: 30.0),
                                        ),
                                  sb.width10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      snapshot.child('sent').value == true
                                          ? Text(
                                              "To ${snapshot.child('name').value.toString()}",
                                              style: GoogleFonts.ubuntu(
                                                color: ThemeColor.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              snapshot
                                                  .child('name')
                                                  .value
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                color: ThemeColor.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      // const SizedBox(
                                      //   height: 2,
                                      // ),
                                      // Text(
                                      //   "Txn ID: ${snapshot.key.toString()}",
                                      //   style: GoogleFonts.ubuntu(
                                      //     color: ThemeColor.black,
                                      //     fontSize: 16,
                                      //     fontWeight: FontWeight.normal,
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   height: 2,
                                      // ),
                                      Text(
                                        "${snapshot.child('data').value.toString()} at ${snapshot.child('date').value.toString()}",
                                        style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: snapshot.child('sent').value == true
                                    ? Text(
                                        "- ${snapshot.child('amount').value.toString()}",
                                        style: GoogleFonts.ubuntu(
                                          color: ThemeColor.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        "+ ${snapshot.child('amount').value.toString()}",
                                        style: GoogleFonts.ubuntu(
                                          color: ThemeColor.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),

                              // GestureDetector(
                              //   onTap: () async {
                              //     await dbService.addMoney(
                              //         100.0, snapshot.key.toString(), context);
                              //     // Navigator.push(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //         builder: (context) =>
                              //     //             HomeScreen()));
                              //   },
                              //   child: Container(
                              //     width: 55,
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //         color: ThemeColor.secondary,
                              //         borderRadius: BorderRadius.circular(15)),
                              //     child: Center(
                              //       child: const Icon(
                              //         Icons.attach_money,
                              //         color: ThemeColor.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // userStatus(snapshot),
                              // Container(
                              //   width: 70,
                              //   height: 35,
                              //   decoration: BoxDecoration(
                              //       color: ThemeColor.secondary,
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: const Icon(
                              //     FontAwesomeIcons.check,
                              //     color: ThemeColor.white,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
