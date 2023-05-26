import 'package:flutter/material.dart';
import 'package:whatsappc/common/utils/colors.dart';
import 'package:whatsappc/features/auth/screens/login_screen.dart';
import 'package:whatsappc/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp clone',
      theme: ThemeData.dark(),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text(
              "Welcome to Whatsapp",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height/9),
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height/9),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScrren()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(tabColor),
              ),
              child: const Text(
                'AGREE AND CONTINUE',
              ),
            ),
            const SizedBox(height:25)
          ],
        )
      ),
    );
  }
}