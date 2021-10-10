import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jupygenix/db/db.dart';
import 'package:jupygenix/screens/login.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jupygenix/widget/login_form.dart';
import 'package:provider/provider.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  final _dob = TextEditingController();

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
            //NAME
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'PLEASE ENTER YOUR NAME',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _name,
              onSaved: (name) {},
              validator: (name) {
                if (name!.isEmpty)
                  return "Please enter your name";
                else
                  return null;
              },
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
            yMargin(20),
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
                if (password.length < 4)
                  return "Password should be minimum of 4 character";
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
            yMargin(20),
            // DATE OF BIRTH
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'PLEASE ENTER YOUR DATE OF BIRTH',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _dob,
              onSaved: (dob) {},
              validator: (dob) {
                if (dob!.isEmpty)
                  return "Please enter your date of birth";
                else
                  return null;
              },
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
                  height: size.height * 0.07,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () => signIn(),
                      child: Text(
                        'Sign in',
                        style: font(fWhite, 20, boldFont),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              deepPink.withOpacity(1)),
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

  signIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    print(
        'PRESSED ${_name.text} ${_email.text} ${_password.text} ${_dob.text}');
    try {
      final database = Provider.of<MyDatabase>(context, listen: false);
      final user = User(
          name: _name.text,
          emailId: _email.text,
          password: _password.text,
          dob: _dob.text);
      await database.addUser(user);
      Get.snackbar(
          'Sign In successful', 'Welcome! Your sign in process is successful.',
          backgroundColor: green, colorText: fWhite);
      Future.delayed(Duration(seconds: 2), () => Get.to(() => Login()));
    } catch (error) {
      print(error.toString());
      Get.snackbar('User exists', 'This user already exists.',
          backgroundColor: fBlack, colorText: fWhite);
    }
  }
}
