import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jupygenix/db/db.dart';
import 'package:jupygenix/screens/login.dart';
import 'package:jupygenix/screens/onboarding.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yMargin(size.height * 0.05),
            // EMAIL
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'PLEASE ENTER YOUR EMAIL',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _email,
              onSaved: (email) {},
              validator: (email) {
                if (EmailValidator.validate(email.toString())) {
                  return null;
                } else {
                  return "Please enter a valid email address";
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: lightGrey.withOpacity(0.5),
                filled: true,
              ),
            ),
            //PASSWORD
            yMargin(20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'PLEASE ENTER YOUR PASSWORD',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _password,
              onSaved: (password) {},
              validator: (password) {
                if (password!.isEmpty) return "Please enter your password";

                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: lightGrey.withOpacity(0.5),
                filled: true,
              ),
            ),

            yMargin(size.height * 0.05),
            //SUBMIT FORM
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () => login(),
                      child: Text(
                        'Login',
                        style: font(fWhite, 20, boldFont),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(deepPink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    print('PRESSED  ${_email.text} ${_password.text}');
    try {
      final database = Provider.of<UserDao>(context, listen: false);

      String mail = await database.checkUser(_email.text, _password.text);
      print(mail);
      Get.snackbar('Login successful', 'Welcome! Your login was successful',
          backgroundColor: green, colorText: fWhite);
      Future.delayed(
          Duration(seconds: 2), () => Get.to(() => OnboardingScreen()));
    } catch (error) {
      Get.snackbar('Invalid credentials', 'This user does not exist',
          backgroundColor: fBlack, colorText: fWhite);
    }

    // Get.to(() => Login());
  }
}
