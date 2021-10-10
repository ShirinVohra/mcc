import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jupygenix/utils/colors.dart';
import 'package:jupygenix/utils/font.dart';
import 'package:jupygenix/utils/sizes.dart';

class ViewData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: size.height * 0.07,
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.menu,
                  size: 35,
                  color: fWhite,
                ),
              ),
              yMargin(40),
              Container(
                child: Text(
                  'Interview questions',
                  style: font(fBlack, 35, boldFont),
                ),
              ),
              yMargin(10),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          DocumentSnapshot? document =
                              snapshot.data?.docs[index];

                          Map<String, dynamic> data =
                              document?.data() as Map<String, dynamic>;

                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          '${index + 1}.',
                                          style: font(fBlack, 25, boldFont),
                                        ),
                                      ),
                                      xMargin(15),
                                      Text(
                                        data['ques'].toString(),
                                        style: font(fBlack, 25, boldFont),
                                      ),
                                    ],
                                  ),
                                  yMargin(10),
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['ans'].toString(),
                                      textAlign: TextAlign.start,
                                      style: font(fBlack, 20, null),
                                    ),
                                  )
                                ],
                              ));
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              deepPink.withOpacity(0.5),
              deepPink.withOpacity(0.9),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: fWhite,
          selectedItemColor: fWhite,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                ),
                label: ''),
          ],
          backgroundColor: Colors.transparent.withOpacity(0.0),
        ),
      ),
    );
  }
}
