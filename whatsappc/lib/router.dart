import 'package:flutter/material.dart';
import 'package:whatsappc/features/auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings Settings){
  switch(Settings.name){
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${Settings.name}'),
        ),
      ));
  }
}