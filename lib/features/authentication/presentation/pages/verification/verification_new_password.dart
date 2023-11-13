import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/assets/constants/colors.dart';

import '../../../../../assets/constants/images.dart';

class VerificationPageNewPassword extends StatefulWidget {
  const VerificationPageNewPassword({super.key});

  @override
  State<VerificationPageNewPassword> createState() => _VerificationPageNewPasswordState();
}

class _VerificationPageNewPasswordState extends State<VerificationPageNewPassword> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: textFieldBackgroundColor2,
      border: Border.all(
        color: pinPutBorderColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromRGBO(0, 0, 0, 0),
          title: const Text('Email verification'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Gap(42),
              Image.asset(
                AppImages.profilePicture,
                height: 130,
                width: 130,
              ),
              const Gap(20),
              const Text(
                'Please enter the 4 digital code that send\nto your email address',
                style: TextStyle(
                  fontFamily: 'Barlow',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(12),
              Pinput(
                length: 4,
                forceErrorState: isError,
                controller: pinPutController,
                enableSuggestions: isPinPutValid,
                defaultPinTheme: isPinPutValid
                    ? defaultPinTheme.copyBorderWith(
                        border: Border.all(
                        color: green,
                      ))
                    : defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: pinPutBorderColor,
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: errorColor,
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 4) {
                    if('7777' == value){
                      isPinPutValid = true;
                    } else {
                      isError = true;
                    }
                    setState(() {});
                  } else {
                    isPinPutValid = false;
                    isError = false;
                    setState(() {});
                  }
                },
                onCompleted: (value) async{
                  if(isPinPutValid){
                    await Future.delayed(const Duration(seconds: 1));
                      Navigator.of(context).pushNamed('/newPassword');
                  }else{
                    isError = true;
                  }
                  setState(() {});

                },
              ),
              const Gap(32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('If you don’t receive code. ',
                    style: TextStyle(
                      color: verificationPageText,
                      fontFamily: 'Barlow',
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                  Text('Resend',
                    style: TextStyle(
                        color: verificationPageText2,
                        fontFamily: 'Barlow',
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
