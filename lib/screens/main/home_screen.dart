import 'package:cached_network_image/cached_network_image.dart';
import 'package:finflex/screens/main/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finflex/main.dart';
import 'package:finflex/screens/main/screen_profile.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back',
                          style: GoogleFonts.ubuntu(
                            color: ThemeColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          userData.name,
                          style: GoogleFonts.ubuntu(
                            color: ThemeColor.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: ThemeColor.white,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: userData.profile,
                            imageBuilder: (context, imageProvider) => Container(
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
                                const CircleAvatar(
                              radius: 30,
                              backgroundColor: ThemeColor.white,
                              child: ClipOval(
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  image: AssetImage("assets/images/avatar.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenProfile(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                sb.height20,
                GestureDetector(
                  onTap: () {
                    //TODO:
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 100,
                            spreadRadius: 1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -1,
                          bottom: -1,
                          child: SizedBox(
                            width: 250,
                            child: Center(
                                child: Image.asset(
                              'assets/images/study.png',
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FinFlex",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.white),
                                    ),
                                    userData.role == 'admin'
                                        ? Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            baseColor: ThemeColor.white,
                                            highlightColor:
                                                ThemeColor.lightBlue,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: ThemeColor.primary,
                                                      width: 2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Text(
                                                "Employee",
                                                style: TextStyle(
                                                    color: ThemeColor.primary,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Batch ${userData.accountCreationDate}",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeColor.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Revision nulll",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColor.white),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.secondary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "View users",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 13,
                                          color: ThemeColor.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepositScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash Deposit",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: const Icon(
                                Icons.arrow_forward,
                                color: ThemeColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash Withdrawal",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: const Icon(
                                Icons.arrow_forward,
                                color: ThemeColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notes",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: const Icon(
                                Icons.arrow_forward,
                                color: ThemeColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sb.height80,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

