import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lisocash/screens/identity_screen_shot_screen.dart';
import 'package:lisocash/widgets/date_input_form_field.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class IdentityVerifyNameScreen extends StatefulWidget {
  const IdentityVerifyNameScreen({super.key});

  @override
  State<IdentityVerifyNameScreen> createState() => _IdentityVerifyNameScreenState();
}

class _IdentityVerifyNameScreenState extends State<IdentityVerifyNameScreen> {

  final TextEditingController _dateController = TextEditingController();

  String? myNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
        title: const Text("Verification d'identité"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 25),

              const Text(
                "Veuillez renseigner votre nom complte à l'etat civil et votre date de naissance pour continuer",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 25),

              const MyInputTextField(
                labelText: "Nom complet",
                prefixIcon: Icons.person,
              ),
      
              DateInputFormField(dateControler: _dateController),
      
              Container(
                child: myButton(
                  "Suivant",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IdentityScreenShotScreen(),
                    ),
                  ),
                ),
              )                    
            ],
          ),
        ),
      ),
    );
  }
}