import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jupygenix/api.dart';

import 'package:jupygenix/screens/view_data.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final _quesController = TextEditingController();

  final _ansController = TextEditingController();

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
                'QUESTION',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _quesController,
              validator: (quesController) {
                if (quesController!.isNotEmpty) {
                  return null;
                } else {
                  return "Please enter a question";
                }
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                fillColor: lightGrey.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
              ),
            ),
            //PASSWORD
            yMargin(20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'ANSWER',
                style: fontWithSpacing(black, 16, boldFont, 2),
              ),
            ),
            yMargin(7),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _ansController,
              validator: (ansController) {
                if (ansController!.isNotEmpty) {
                  return null;
                } else {
                  return "Please enter a answer";
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

            yMargin(size.height * 0.05),
            //SUBMIT FORM
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () => submit(),
                      child: Text(
                        'Submit',
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
            ),
            yMargin(30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.078,
                  width: size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => ViewData()),
                      child: Text(
                        'Back',
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

  submit() async {
    if (!_formKey.currentState!.validate()) return;

    await FirebaseFirestore.instance.collection('users').add({
      'ques': _quesController.text,
      'ans': _ansController.text,
    });
    try {
      await NotificationService().showNotifications(0, 'Questions added',
          'New questions will be available at the end of dataset', 'data');
      _quesController.clear();
      _ansController.clear();
      Future.delayed(Duration(seconds: 2), () => Get.to(() => ViewData()));
    } catch (error) {
      print("ERROR $error");
    }
    

    // Get.snackbar('Login successful', 'Welcome! Your login was successful',
    //     backgroundColor: green, colorText: fWhite);
  }
}
