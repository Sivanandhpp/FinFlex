import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:finflex/core/globalvalues/theme_color.dart';
import 'package:finflex/core/services/routing_service.dart';
import 'package:finflex/screens/main/admin/screen_addnotifi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDoneScreen extends StatefulWidget {
  const PaymentDoneScreen(
      {super.key, required this.userName, required this.paidAmount});
  final String userName;
  final double paidAmount;

  @override
  State<PaymentDoneScreen> createState() => _PaymentDoneScreenState();
}

class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
  bool _checked = false;
  bool _indeterminate = false;
  void setChecked() async {
    await Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        setState(() {
          isLoading = false;
          _checked = true;
          _indeterminate = false;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setChecked();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Payment successful",
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height - 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: ThemeColor.primary,
                                strokeWidth: 10,
                              )
                            : Checkmark(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                                checked: _checked,
                                indeterminate: _indeterminate,
                                size: 200,
                                color: ThemeColor.primary,
                                rounded: true,
                                drawCross: false,
                                drawDash: false,
                              ),
                      ),
                      Text(
                        "Paid ${widget.paidAmount}",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "to ${widget.userName}",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoutingService()));
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ThemeColor.secondary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Done",
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
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
