import 'package:flutter/material.dart';
import 'package:whatsappc/common/utils/colors.dart';

class LoginScrren extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScrren({super.key});

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  final phoneController = TextEditingController();
  bool showCountryCode = false;
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Enter your phone number', textAlign: TextAlign.center,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('WhatsApp will send an SMS message to verify your phone number.'),
          const SizedBox(height: 10,),
          TextButton(
            onPressed: () => {
              setState((){showCountryCode = true;}),
            },
            child: const Text('Pick Country'),
          ),
          const SizedBox(height: 5,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: showCountryCode,
                child: const Text('+91')
              ),
              SizedBox(
                width: size.width * 0.7,
                child: const Expanded(
                  child: TextField(
                    //controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}