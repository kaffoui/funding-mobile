import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class AddNewContactScreen extends StatefulWidget {
  const AddNewContactScreen({super.key});

  @override
  State<AddNewContactScreen> createState() => _AddNewContactScreenState();
}

class _AddNewContactScreenState extends State<AddNewContactScreen> {

  String? myNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
        title: const Text("Nouveau contact"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              const MyInputTextField(
                labelText: "Nom complet",
                prefixIcon: Icons.person,
              ),
      
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: InternationalPhoneNumberInput(
                    // textFieldController: _phoneController,
                    maxLength: 9,
                    cursorColor: MyColors.primary,
                    isEnabled: true,
                    countries: const ['FR', 'SN'],
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    formatInput: false,
                    ignoreBlank: true,
                    inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "Téléphone ",
                      hintStyle: const TextStyle(fontSize: 16),
                      filled: true,
                      fillColor: MyColors.primary.withOpacity(0.1),
                      border: Utils.myOutlineBorder(),
                      enabledBorder: Utils.myOutlineBorder(),
                      focusedBorder: Utils.myOutlineBorder()
                    ),
                    onInputValidated: (bool value) {
                      debugPrint("val $value");
                    },
                    onInputChanged: (PhoneNumber number) {
                      debugPrint("number is ${number.phoneNumber}");
                        setState(() {
                          myNumber = number.phoneNumber!;
                        });
                    },
                    selectorConfig: const SelectorConfig(
                      leadingPadding: 0,
                      trailingSpace: false,
                      setSelectorButtonAsPrefixIcon: true
                    ),
                    validator: (p0) {
                      if (p0.toString().length < 10) {
                        return "Numero invalide";
                      }
                      return null;
                    } 
                  ),
                ),
      
              Container(
                child: myButton(
                  "Ajouter"
                ),
              )                    
            ],
          ),
        ),
      ),
    );
  }
}