import 'package:flutter/material.dart';
import 'package:lisocash/screens/home_screen.dart';
import 'package:lisocash/utils/constant.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Verifiez votre numéro", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: MyColors.primary)),
            
              const SizedBox(height: 10,),
      
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Veuillez entrer le code à 4 chiffre reçu par SMS au "
                    ),
                    TextSpan(
                      text: "010101010101 ",
                      style: TextStyle(color: MyColors.primary),
                    ),
                    TextSpan(text: "pour continuer")
                  ]
                ),
      
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
      
              const SizedBox(height: 25,),
              
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: const TextStyle(
                    color: MyColors.primary,
                    // fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  autoFocus: true,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 4) {
                      return "Le code doit comporter 4 caractères";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveColor: Colors.black26, //inactive
                    selectedColor: MyColors.primary, //select
                    activeColor: MyColors.primary, //deja ft
      
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    // activeFillColor: hasError ? Colors.orange : Colors.white,
                  ),
                  showCursor: false,
                  animationDuration: const Duration(milliseconds: 300),
                  textStyle: const TextStyle(fontSize: 20, height: 1.6,),
                  // backgroundColor: Colors.,
                  enableActiveFill: true,
                  errorTextSpace: 40,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint("OTP Completed: $v");
                  },
                  onChanged: (String value) {
                    setState(() {
                      // otpCode = value;
                    });
                  },
                  beforeTextPaste: (String? text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return false;
                  },
                )
              ),
      
      
              myButton(
                "verifier OTP",
                onPressed: () => alertModal(),
              ),
      
              const SizedBox(height: 25,),
      
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      // otpSent = false;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Renvoyer le code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
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

  Future<void> alertModal() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        // contentPadding: const EdgeInsets.fromLTRB(10.0, 12.0, 24.0, 0.0),
        // insetPadding: EdgeInsets.all(12),
        title: Row(
          children: const [
            Icon(Icons.check_circle_outline, color: Colors.green,),
            Expanded(
              child: Text(
                "  Numéro verifié avec sucèss",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green
                ),
              ),
            ),
          ],
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Veuillez consulter votre boite email pour la verifié",
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ).then((value) {setState(() { });});
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