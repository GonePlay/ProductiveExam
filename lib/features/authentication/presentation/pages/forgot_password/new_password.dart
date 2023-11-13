import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/widgets/w_button.dart';

import '../../../../../assets/constants/colors.dart';
import '../../../../../assets/constants/icons.dart';
import '../../../../../assets/constants/images.dart';


class NewPassword extends StatefulWidget {
  static Route route() => MaterialPageRoute(
    builder: (_) => const NewPassword(),
  );

  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool isNewPasswordValid = false;

  String _password = '';
  String? _confirmPassword = '';
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );


  final _formKey = GlobalKey<FormState>();


  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: textFieldBackgroundColor2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),

      );

  @override
  void initState() {
    passwordTextEditingController.addListener(() {
      if (_formKey.currentState!.validate()) {
        if (!isNewPasswordValid) {
          setState(() {
            isNewPasswordValid = true;
          });
        }
      } else {
        if (isNewPasswordValid) {
          setState(() {
            isNewPasswordValid = false;
          });
        }
      }
    });

    confirmPasswordTextEditingController.addListener(() {
      if (_formKey.currentState!.validate()) {
        if (!isNewPasswordValid) {
          setState(() {
            isNewPasswordValid = true;
          });
        }
      } else {
        if (isNewPasswordValid) {
          setState(() {
            isNewPasswordValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();

    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

// TODO
bool checker = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(16),
                    const Text("Create new password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                    const Gap(36),
                    Image.asset(
                      AppImages.profilePicture,
                      height: 130,
                      width: 130,
                    ),
                    const Gap(48),


                    TextFormField(
                      cursorColor: cursorColor,
                      focusNode: passwordFocusNode,
                      controller: passwordTextEditingController,
                      decoration: decoration(
                      hintText: 'Enter new password',),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                      onChanged: (value){
                        _password = value;
                        // print("password : $_password");

                      },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }else if (value.length < 7) {
                            return '';
                          }

                          return null;
                        }
                    ),
                          const Gap(16),
                    TextFormField(
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: confirmPasswordFocusNode,
                      controller: confirmPasswordTextEditingController,

                      decoration: decoration(
                        hintText: 'Confirm password ',

                        suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 13.5),
                            child: SvgPicture.asset(
                              isNewPasswordValid ? AppIcons.verify : AppIcons.unVerify,
                            ),
                          ),
                      ),

                      onChanged: (value){
                        _confirmPassword = value;
                        // print("confirm : $_confirmPassword");

                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Conform password is required please enter';
                          // }else if (value.length < 7) {
                          //   return 'Length not enought';
                          // }
                        }
                        else if(_confirmPassword != _password){
                          return 'Confirm password not matching';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                    ),

                    const Gap(321),

                    WButton(
                          isDisabled: !isNewPasswordValid,
                          onTap: () {

                              Navigator.of(context).pushNamed('/home');
                          },
                          text: 'Save',
                        ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
