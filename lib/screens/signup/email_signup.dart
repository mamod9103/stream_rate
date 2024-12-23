import 'package:flutter/material.dart';
import 'package:stream_rate/commonView/custom_fill_button.dart';
import 'package:stream_rate/commonView/load_image_with_placeholder.dart';
import 'package:stream_rate/commonView/custom_text_form.dart';
import 'package:stream_rate/screens/login/login.dart';
import 'package:stream_rate/utils/utils.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  EmailSignUpState createState() => EmailSignUpState();
}

class EmailSignUpState extends State<EmailSignUp> {
  bool isHidden = true;
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorMainBackground,
        body: Stack(children: [
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadImageSimple(
                      image: 'assets/images/streamrate-logo.png',
                      width: deviceWidth * 0.4,
                      height: 100,
                      imageFit: BoxFit.fill,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: const Text(
                        "Create an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colorWhite, fontSize: 24),
                      ),
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: colorMainLightGray),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: phoneController,
                      labelText: 'Phone',
                      prefixIcon: const Icon(Icons.phone_outlined,
                          color: colorMainLightGray),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      isPassword: true,
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outlined,
                          color: colorMainLightGray),
                      suffixIcon: Icon(
                        isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorMainLightGray,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      isPassword: true,
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_open,
                          color: colorMainLightGray),
                      suffixIcon: Icon(
                        isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorMainLightGray,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(
                      width: double.infinity,
                      child: Text('Do you have a voucher code?',
                          style: TextStyle(fontSize: 18, color: colorWhite)),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextFormField(
                      labelText: 'Voucher Code',
                      prefixIcon: Icon(Icons.discount_outlined,
                          color: colorMainLightGray),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: isChecked
                                        ? colorOfferDiscountRed
                                        : colorMainLightGray),
                                color: isChecked
                                    ? colorOfferDiscountRed
                                    : Colors.transparent,
                              ),
                              child: isChecked
                                  ? const Icon(Icons.check,
                                      size: 20, color: colorOfferDiscountGray)
                                  : null,
                            ),
                          ),
                          const Text('   I accept the ',
                              style:
                                  TextStyle(color: colorWhite, fontSize: 18)),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                fontSize: 18,
                                color: colorWhite,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomFillButton(
                      onPressed: () {},
                      width: double.infinity,
                      height: 60,
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                            color: colorWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?",
                            style: TextStyle(fontSize: 18, color: colorWhite)),
                        GestureDetector(
                          onTap: () =>
                              openScreenWithResult(context, const Login()),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFFF79B1E),
                                      Color(0xFFED1945)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds);
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: colorWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ]));
  }
}
