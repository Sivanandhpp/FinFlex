import 'package:cached_network_image/cached_network_image.dart';
import 'package:finflex/screens/main/screen_payment.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finflex/core/services/database_service.dart';
import 'package:finflex/main.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class DepositScreen extends StatefulWidget {
  DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

int currentYr = DateTime.now().year;

class _DepositScreenState extends State<DepositScreen> {
  DatabaseService dbService = DatabaseService();

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
                        "Cash Deposit",
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
                FirebaseAnimatedList(
                  query: dbReference.child('users'),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  sort: (a, b) {
                    return a
                        .child('name')
                        .value
                        .toString()
                        .compareTo(b.child('name').value.toString());
                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.primary,
                    ),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Column(
                      children: [
                        sb.height5,
                        GestureDetector(
                          onTap: () {
                           
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  receiverUID: snapshot.key!,
                                  receiverName:
                                      snapshot.child('name').value.toString(),
                                  receiverPhone:
                                      snapshot.child('phone').value.toString(),
                                  receiverPhoto: snapshot
                                      .child('profile')
                                      .value
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: ThemeColor.shadow,
                                      blurRadius: 10,
                                      spreadRadius: 0.1,
                                      offset: Offset(0, 10)),
                                ],
                                color: ThemeColor.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot
                                              .child('profile')
                                              .value
                                              .toString(),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: const Image(
                                              height: 50,
                                              width: 50,
                                              image: AssetImage(
                                                  "assets/images/avatar.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    sb.width10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
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
                                        Text(
                                          snapshot
                                              .child('email')
                                              .value
                                              .toString(),
                                          style: GoogleFonts.ubuntu(
                                            color: ThemeColor.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 2,
                                        // ),
                                        Text(
                                          snapshot
                                              .child('phone')
                                              .value
                                              .toString(),
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
                                GestureDetector(
                                  onTap: () async {
                                    //  await dbService.addMoney(100.0,
                                    //       snapshot.key.toString(), context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             HomeScreen()));
                                  },
                                  child: Container(
                                    width: 55,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: ThemeColor.secondary,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: const Icon(
                                        Icons.attach_money,
                                        color: ThemeColor.white,
                                      ),
                                    ),
                                  ),
                                ),
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
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
