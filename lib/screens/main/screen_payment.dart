import 'package:cached_network_image/cached_network_image.dart';
import 'package:finflex/core/globalvalues/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finflex/core/globalvalues/sizedboxes.dart' as sb;

class PaymentScreen extends StatelessWidget {
  PaymentScreen(
      {super.key,
      required this.receiverUID,
      required this.receiverName,
      required this.receiverPhone,
      required this.receiverPhoto});
  final String receiverUID;
  final String receiverName;
  final String receiverPhone;
  final String receiverPhoto;
  final TextEditingController _amountController = TextEditingController();
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
                        "Sending to",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                sb.height80,
                CircleAvatar(
                  radius: 75,
                  backgroundColor: ThemeColor.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: receiverPhoto,
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
                      errorWidget: (context, url, error) => const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/avatar.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                sb.height20,
                Text(
                  receiverName,
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  receiverPhone,
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                sb.height20,
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _amountController,
                  validator: (value) {
                    if (_amountController.text.isEmpty) {
                      return "This field can't be empty";
                    }
                  },
                  style: GoogleFonts.poppins(
                    color: ThemeColor.textFieldHintColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                  autofocus: true,
                  // expands: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                  cursorColor: ThemeColor.primary,
                  decoration: InputDecoration(
                    fillColor: ThemeColor.scaffoldBgColor,
                    filled: true,
                    hintText: "0",
                    hintStyle: GoogleFonts.poppins(
                      color: ThemeColor.textFieldHintColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
