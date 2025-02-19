import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
final BuildContext globalContext = navigationKey.currentState!.context;

//dynamic height and width
double w(BuildContext context) => MediaQuery.of(context).size.width;
double h(BuildContext context) => MediaQuery.of(context).size.height;

//font family constants
const fontFamilyWorkSans = "Work Sans";

//common functions
showCommonBottomSheet(BuildContext context, String message){
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
        ),
        height: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Text(message),
            ],
          ),
        ),
      );
    },);
}