import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/screens/create_account.dart';
import 'package:jupygenix/screens/login.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              deepPink.withOpacity(0.8),
              deepPink.withOpacity(0.4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            yMargin(size.height * 0.2),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            yMargin(20),
            Text('Flutter Task', style: font(fWhite, 40, null)),
            yMargin(15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'This is a example used for demonstrating the flow of the work',
                style: font(fWhite, 20, null),
                textAlign: TextAlign.center,
              ),
            ),
            yMargin(size.height * 0.17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => Login()),
                      child: Text(
                        'Login',
                        style: font(fWhite, 20, boldFont),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              deepPink.withOpacity(0.8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )))),
                ),
                xMargin(15),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => CreateAccount()),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.roboto(
                            color: deepPink.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: boldFont),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(fWhite),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
