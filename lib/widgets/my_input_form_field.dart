import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class MyInputTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final String? hintText;
  final bool? isPhoneNumber;
  final List<TextInputFormatter>? inputFormatters;

  final bool? isNullable;
  final bool? isEmail;

  const MyInputTextField({super.key, 
    this.controller, 
    this.textInputType,
    this.prefixIcon,
    isNullable,
    hintText,
    inputFormatters,
    isPhoneNumber,
    labelText,
    isEmail
  }) : isNullable = isNullable ?? false, 
  hintText = hintText ?? "", 
  inputFormatters = inputFormatters ?? null,
  isPhoneNumber = isPhoneNumber?? false,
  labelText = labelText ?? null,
  isEmail = isEmail?? false;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        maxLength: (isPhoneNumber == true) ? 10 : null,
        autocorrect: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontSize: 17.3, color: MyColors.primary, fontWeight: FontWeight.bold),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: MyColors.primary,),
          counter: const SizedBox(),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          filled: true,
          fillColor: MyColors.primary.withOpacity(0.1),
          border: Utils.myOutlineBorder(),
          enabledBorder: Utils.myOutlineBorder(),
          focusedBorder: Utils.myOutlineBorder()
        ),

        validator: (value) {
          if (!(isNullable!)) {
            if (value!.isEmpty) {
              return "Ce champ est requis";
            }

            if (textInputType == TextInputType.emailAddress) {
              if (!EmailValidator.validate(value.toString())) {
                  return "Email invalide";
                }
            }

            if (isPhoneNumber == true) {
              if (value.length< 10){
                return "Numéro invalide";
              }
            }
          }
        },

        onSaved: (value) {
          controller!.text = value!;
        },
      ),
    );
  }
}