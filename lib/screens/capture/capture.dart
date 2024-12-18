import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:slider_captcha/slider_captcha.dart';
import 'package:stream_rate/commonView/load_image_with_placeholder.dart';
import 'package:stream_rate/screens/login/login.dart';

import 'package:stream_rate/utils/utils.dart';

class Capture extends StatefulWidget {
  const Capture({Key? key}) : super(key: key);

  @override
  CaptureState createState() => CaptureState();
}

class CaptureState extends State<Capture> {
  final controller = SliderController();

  @override
  void initState() {
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        child: Column(
          children: [
            LoadImageSimple(
              image: 'assets/images/streamrate-logo.png',
              width: deviceWidth * 0.4,
              height: 100,
              imageFit: BoxFit.fill,
            ),
            const SizedBox(height: 50),
            const Text('Drag the slider to fit the puzzle',
                style: TextStyle(color: colorWhite)),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: colorBlack.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SliderCaptcha(
                  controller: controller,
                  title: '',
                  image: Image.asset('assets/images/puzzle.jpg',
                      width: double.infinity, fit: BoxFit.fitWidth),
                  colorBar: colorPrimary,
                  icon: Container(
                    decoration:
                        const BoxDecoration(color: colorPrimary, boxShadow: [
                      BoxShadow(
                        color: colorPrimary,
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: colorPrimary,
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(-5, 5),
                      ),
                    ]),
                    child: Image.asset('assets/images/capture_icon.png'),
                  ),
                  onConfirm: (value) {
                    if (value) {
                      return openScreenWithResult(context, const Login());
                    } else {
                      return Future.delayed(const Duration(seconds: 2)).then(
                        (_) {
                          controller.create();
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
