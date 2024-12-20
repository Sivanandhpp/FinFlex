import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finflex/main.dart';
import 'package:finflex/screens/main/admin/screen_addnotifi.dart';
import 'package:finflex/screens/widgets/image_viewer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';
import '../../core/services/database_service.dart';

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

DatabaseService dbService = DatabaseService();

class _ScreenNotificationState extends State<ScreenNotification> {
  Widget headWithPower() {
    if (userData.role == "admin") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  "Notifications",
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 35,
                color: ThemeColor.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNotification()),
              );
            },
          ),
        ],
      );

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text(
      //       'Notifications',
      //       style: GoogleFonts.ubuntu(
      //         color: ThemeColor.black,
      //         fontSize: 26,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     InkWell(
      //       child: Container(
      //         padding: const EdgeInsets.all(12),
      //         child: const Icon(
      //           FontAwesomeIcons.plus,
      //           size: 35,
      //           color: ThemeColor.black,
      //         ),
      //       ),
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const AddNotification()),
      //         );
      //       },
      //     ),
      //   ],
      // );
    }
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          Text(
            "Notifications",
            style: GoogleFonts.ubuntu(
              color: ThemeColor.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWithDel(snapshot) {
    if (userData.role == "admin") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              snapshot.child('title').value.toString(),
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          InkWell(
            child: const Icon(
              FontAwesomeIcons.trash,
              color: ThemeColor.ytRed,
            ),
            onTap: () {
              dbReference.child('notifications/${snapshot.key}').remove();
            },
          )
        ],
      );
    }

    return Text(
      snapshot.child('title').value.toString(),
      style: GoogleFonts.ubuntu(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  Widget imgOrPdf(snapshot) {
    if (snapshot.child('url').value == "null") {
      return Container();
    } else if (snapshot.child('extension').value == ".pdf") {
      return GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PdfViewer(
          //         src: snapshot.child('url').value.toString(),
          //         pdfName: snapshot.child('title').value.toString()),
          //   ),
          // );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: const SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image(
              image: AssetImage("assets/images/pdf.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewer(
                src: snapshot.child('url').value.toString(),
                imgName: snapshot.child('title').value.toString()),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: 80.0,
          width: 80.0,
          child: CachedNetworkImage(
            imageUrl: snapshot.child('url').value,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(
                height: 10, width: 10, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: const SizedBox(
                height: 80,
                width: 80,
                child: Center(
                    child: Icon(
                  FontAwesomeIcons.solidImage,
                  size: 40,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                headWithPower(),
                sb.height10,
                FirebaseAnimatedList(
                  query: dbReference.child("notifications"),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  sort: (b, a) {
                    return a.key.toString().compareTo(b.key.toString());
                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.primary,
                    ),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Column(
                      children: [
                        sb.height10,
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: ThemeColor.shadow,
                                  blurRadius: 100,
                                  spreadRadius: 0.01,
                                  offset: Offset(1, 1)),
                            ],
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              imgOrPdf(snapshot),
                              sb.width10,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleWithDel(snapshot),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      snapshot
                                          .child('content')
                                          .value
                                          .toString(),
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot
                                              .child('date')
                                              .value
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
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
