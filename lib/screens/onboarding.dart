import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jupygenix/screens/intro_screen.dart';
import 'package:jupygenix/screens/view_add.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/desc.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _position = 0;

  PageController? _controller;

  // PageController pageController = PageController(
  //   initialPage: 0,
  //   keepPage: true,
  // );
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    _position = 0;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List onboardingItems = [page2(), page3()];
    return SafeArea(
      child: Scaffold(
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                deepPink.withOpacity(0.9),
                deepPink.withOpacity(0.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: _position == 0 ? 50 : 97,
                      size: 10,
                      padding: 0,
                      selectedColor: deepOrange!,
                      unselectedColor: fWhite,
                      roundedEdges: Radius.circular(10),
                    ),
                  ),
                ),
                _position == 0
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '2/3 Short description',
                          style: font(fWhite, 18, null),
                        ),
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'End of tour',
                          style: font(fWhite, 18, null),
                        ),
                      ),
                Expanded(
                  flex: 10,
                  child: Container(
                    // height: size.height * 0.6,
                    child: PageView.builder(
                      controller: _controller,
                      itemBuilder: (_, index) {
                        return Container(child: onboardingItems[index]);
                      },
                      itemCount: onboardingItems.length,
                      onPageChanged: (int index) {
                        setState(() {
                          _position = index;
                        });
                      },
                    ),
                  ),
                ),
                yMargin(10),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (_position == 1) {
                              setState(() {
                                _position -= 1;
                                _controller!.jumpToPage(_position);
                                print(_position);
                              });
                            } else {
                              Get.to(() => IntroScreen());
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: fWhite,
                            size: 45,
                          )),
                      _position == 0
                          ? Container(
                              height: size.height * 0.07,
                              width: size.width * 0.5,
                              margin: EdgeInsets.only(left: size.width * 0.1),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _position += 1;
                                      _controller!.jumpToPage(_position);
                                      print(_position);
                                    });
                                  },
                                  child: Text(
                                    'next',
                                    style: font(fWhite, 20, boldFont),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              deepPink.withOpacity(1)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      )))),
                            )
                          : Container(),
                    ],
                  ),
                ),
                yMargin(10),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color:
                                      _position + 1 == index ? fWhite : white,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 20,
                              width: 20,
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget page2() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          yMargin(70),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              'APP CREATED BY:-',
              textAlign: TextAlign.start,
              style: font(fWhite, 30, boldFont),
            ),
          ),
          yMargin(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 10,
            decoration: BoxDecoration(
                color: fWhite, borderRadius: BorderRadius.circular(20)),
          ),
          yMargin(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              'Adedoyin Idris',
              textAlign: TextAlign.start,
              style: font(fWhite, 30, null),
            ),
          ),
          yMargin(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              aboutMe,
              textAlign: TextAlign.justify,
              style: font(fWhite, 20, null),
            ),
          ),
        ],
      );
  Widget page3() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          yMargin(20),
          Text(
            'Task list',
            style: font(fWhite, 37, null),
          ),
          yMargin(20),
          Container(
            height: 50,
            width: 220,
            child: ElevatedButton(
                onPressed: () => Get.to(() => IntroScreen()),
                child: Text(
                  'Task 1',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(deepPink.withOpacity(1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
          yMargin(20),
          Container(
            height: 50,
            width: 220,
            child: ElevatedButton(
                onPressed: () => Get.to(() => ViewAndAddDataNavScreen()),
                child: Text(
                  'Task 2',
                  style: font(fWhite, 20, boldFont),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(deepPink.withOpacity(1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )))),
          ),
          yMargin(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              'Task 1',
              style: font(fWhite, 20, boldFont),
            ),
          ),
          yMargin(10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              descTask1,
              textAlign: TextAlign.justify,
              style: font(fWhite, 14, boldFont),
            ),
          ),
          yMargin(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              'Task 2',
              style: font(fWhite, 20, boldFont),
            ),
          ),
          yMargin(10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerLeft,
            child: Text(
              descTask2,
              textAlign: TextAlign.justify,
              style: font(fWhite, 14, boldFont),
            ),
          ),
        ],
      );
}
