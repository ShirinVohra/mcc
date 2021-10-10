import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:jupygenix/widget/login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      deepPink.withOpacity(0.7),
                      deepPink.withOpacity(0.9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.sarabun(
                        color: fWhite,
                        fontSize: 40,
                      ),
                    ),
                    yMargin(15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Sign in to continue',
                        style: font(fWhite, 23, null),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
