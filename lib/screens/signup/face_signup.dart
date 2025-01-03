import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stream_rate/commonView/load_image_with_placeholder.dart';
import 'package:stream_rate/screens/captcha/captcha.dart';

import 'package:stream_rate/screens/login/login.dart';
import 'package:stream_rate/utils/utils.dart';
import 'package:stream_rate/commonView/custom_fill_button.dart';

class FaceIdSignUp extends StatefulWidget {
  const FaceIdSignUp({Key? key}) : super(key: key);

  @override
  FaceIdSignUpState createState() => FaceIdSignUpState();
}

class FaceIdSignUpState extends State<FaceIdSignUp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMainBackground,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: const BoxDecoration(
            color: colorPrimary,
            image: DecorationImage(
                image: AssetImage("assets/images/onboard1BG.png"),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadImageSimple(
                  image: 'assets/images/streamrate-logo.png',
                  width: deviceHeight * 0.17,
                  height: deviceHeight * .11,
                  imageFit: BoxFit.fill,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: deviceHeight * 0.03, bottom: deviceHeight * 0.01),
                    child: Text(
                      "Sign Up with",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: colorWhite,
                        fontSize: deviceHeight * 0.024,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(bottom: deviceHeight * 0.021),
                    child: Text(
                      "Face ID or Touch ID",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: colorWhite,
                        fontSize: deviceHeight * 0.024,
                      ),
                    )),
                LoadImageSimple(
                  image: 'assets/images/face_signup_main.png',
                  width: deviceWidth * 0.45,
                  imageFit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceHeight * 0.03,
                      horizontal: deviceWidth * 0.1),
                  child: Text(
                      "Create a passkey with your face, fingerprint, or a passcode to log in more quickly than a password. We can't access this biometric data",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: colorWhite,
                        fontSize: deviceHeight * 0.016,
                      )),
                ),
                SizedBox(height: deviceHeight * 0.01),
                SizedBox(
                  width: deviceWidth * 0.8,
                  child: Column(
                    children: [
                      CustomFillButton(
                        onPressed: () =>
                            openScreenWithResult(context, const Captcha()),
                        isColorBtn: true,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'SIGN UP',
                                style: GoogleFonts.poppins(
                                    color: colorWhite,
                                    fontSize: deviceHeight * 0.014,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: GoogleFonts.poppins(
                            fontSize: deviceHeight * 0.016, color: colorWhite)),
                    GestureDetector(
                      onTap: () => openScreenWithResult(context, const Login()),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [Color(0xFFF79B1E), Color(0xFFED1945)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "Log In?",
                              style: GoogleFonts.poppins(
                                fontSize: deviceHeight * 0.016,
                                color: colorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: deviceHeight * 0.05,
            left: deviceWidth * 0.035,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: deviceHeight * 0.04,
                width: deviceHeight * 0.04,
                padding: EdgeInsets.symmetric(horizontal: deviceHeight * 0.015),
                decoration: BoxDecoration(
                  color: colorMainGray.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(deviceHeight * 0.012),
                ),
                child: Center(
                  child: Icon(Icons.arrow_back_ios,
                      size: deviceHeight * 0.018, color: colorWhite),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
