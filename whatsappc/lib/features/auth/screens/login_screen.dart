import 'package:flutter/material.dart';
import 'package:whatsappc/common/utils/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:country_picker/country_picker.dart';
class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  void pickCountry(){
    showCountryPicker(
      context: context,
      showPhoneCode: true, // optional. Shows phone code before the country name.
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height/5,),
            const Text('WhatsApp will send an SMS message to verify your phone number.', textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: pickCountry,
              child: const Text('Pick Country'),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (country!=null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: tabColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          '+${country!.phoneCode}', 
                          textAlign: TextAlign.center,
                        )
                      ),
                    ),
                  const SizedBox(width: 15.0,),
                  Container(
                    height: double.infinity,
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: tabColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: size.width * 0.6,
                      child: const Expanded(
                        child: TextField(
                          //controller: phoneController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(65, 50),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(tabColor)
                  ),
                  onPressed: ()=>{}, 
                  child: const Text('Next'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}