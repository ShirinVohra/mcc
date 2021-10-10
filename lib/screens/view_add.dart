import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jupygenix/screens/add_data.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:jupygenix/screens/view_data.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';

class ViewAndAddDataNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Interview Q',
                style: font(fWhite, 40, boldFont),
              ),
              yMargin(50),
              Container(
                height: 50,
                width: 220,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => ViewData()),
                    child: Text(
                      'View data',
                      style: font(fWhite, 20, boldFont),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(deepPink.withOpacity(1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )))),
              ),
              yMargin(50),
              Container(
                height: 50,
                width: 220,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => AddData()),
                    child: Text(
                      'Add data',
                      style: font(fWhite, 20, boldFont),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(deepPink.withOpacity(1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
