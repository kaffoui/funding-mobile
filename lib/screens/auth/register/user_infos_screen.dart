import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lisocash/screens/auth/register/enter_otp_screen.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/constant.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class UserInfoscreen extends StatefulWidget {
  const UserInfoscreen({super.key});

  @override
  State<UserInfoscreen> createState() => _UserInfoscreenState();
}

class _UserInfoscreenState extends State<UserInfoscreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController(); 
  final TextEditingController _prenomsController = TextEditingController(); 
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _villeController = TextEditingController(); 
  final TextEditingController _motdepasseController = TextEditingController(); 

  String? myNumber;
  bool? checkValue = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Inscription", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: MyColors.primary)),
          
                const Text("Inscrivez vous en quelque clic !", style: TextStyle(fontSize: 16)),
          
                const SizedBox(height: 35),
          
                MyInputTextField(
                  controller: _nomController,
                  prefixIcon: Icons.person_outline,
                  labelText: "Votre nom",
                ),
          
                
                MyInputTextField(
                  controller: _prenomsController,
                  prefixIcon: Icons.person_outline,
                  labelText: "Votre prénoms",
                ),
          
                MyInputTextField(
                  controller: _emailController,
                  prefixIcon: Icons.email_outlined,
                  labelText: "Votre adresse email",
                  textInputType: TextInputType.emailAddress,
                ),
          
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                  child: InternationalPhoneNumberInput(
                    // textFieldController: _phoneController,
                    // maxLength: 9,
                    textStyle: const TextStyle(fontSize: 17.3, color: MyColors.primary, fontWeight: FontWeight.bold),
                    cursorColor: MyColors.primary,
                    isEnabled: true,
                    countries: const ['FR', 'US', 'BE', 'CA', 'CI',],
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    formatInput: false,
                    ignoreBlank: true,
                    selectorTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: MyColors.primary),
                    searchBoxDecoration: const InputDecoration(hintText: "Recherchez ici..."),
                    inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "Votre téléphone ",
                      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
                      debugPrint("number is ${number.isoCode}");
                        setState(() {
                          myNumber = number.phoneNumber!;
                        });
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      leadingPadding: 12,
                      trailingSpace: false,
                      setSelectorButtonAsPrefixIcon: true
                    ),
                    validator: (p0) {
                      if (p0.toString().isEmpty) {
                        return "Entrez un Numéro";
                      }
                      return null;
                    } 
                  ),
                ),
          
                MyInputTextField(
                  controller: _villeController,
                  prefixIcon: Icons.location_city_outlined,
                  labelText: "Ville",
                ),
          
                MyInputTextField(
                  controller: _motdepasseController,
                  prefixIcon: Icons.lock_outline,
                  labelText: "Mot de passe",
                ),
          
                CheckboxListTile( //checkbox if on clic
                  contentPadding: EdgeInsets.zero,
                  isThreeLine: false,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "J'accepte les ",
                        ),
          
                        TextSpan(
                          text: "conditions d'utilisations ",
                          style: TextStyle(color: MyColors.primary)
                        ),
          
                        TextSpan(
                          text: "et "
                        ),
          
                        TextSpan(
                          text: "règles de confidentialité",
                          style: TextStyle(color: MyColors.primary)
                        ),
                      ]
                    ),
          
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "CenturyGothic",
                       fontSize: 14
                    ),
                  ),
                  value: checkValue, 
                  onChanged: (value) {
                    setState(() {
                      checkValue = value;
                    });
                  }
                ),
          
          
                myButton(
                  "Je m'inscris",
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    } else if(checkValue == false) {
                      Utils.showToast("Veuillez accepter les conditions");
                    } else {
                      alertModal();
                    }

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> alertModal() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        // contentPadding: const EdgeInsets.fromLTRB(10.0, 12.0, 24.0, 0.0),
        // insetPadding: EdgeInsets.all(12),
        title: const Text(
          appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.primary
          ),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "$appName vous enverra un code pour verifier votre numéro de téléphone",
            )
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),

        actions: <Widget>[
          // Container(
          //   margin: const EdgeInsets.only(right: 15, bottom: 15),
          //   child: TextButton(
          //     onPressed: () => Navigator.pop(context), child: const Text("Fermer", style: TextStyle(color: Colors.red),)
          //   )
          // ),
          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: MyColors.primary,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: MyColors.primary, width: 1.4),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnterOtpScreen(),
                  ),
                );
              },
              child: const Text("D'accord"),
            ),
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}