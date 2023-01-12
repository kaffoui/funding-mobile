import 'package:flutter/material.dart';
import 'package:lisocash/screens/identity_verify_name_screen.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';

class CardPaymentInfoScreen extends StatefulWidget {
  const CardPaymentInfoScreen({super.key});

  @override
  State<CardPaymentInfoScreen> createState() => _CardPaymentInfoScreenState();
}

class _CardPaymentInfoScreenState extends State<CardPaymentInfoScreen> {

  String? myNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
        title: const Text("Information de paiement"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              const ListTile(
                leading: Icon(Icons.credit_card, size: 30,),
                title: Text("Carte: 7645"),
                subtitle: Text("Date d'exp.: 15/23 • CVV: 760"  ),
              ),

              const Divider(),

              const SizedBox(height: 15),
      
              const MyInputTextField(
                labelText: "Adresse de facturation",
              ),

              const MyInputTextField(
                labelText: "Code postal",
              ),

              const MyInputTextField(
                labelText: "Ville",
              ),
      
              Container(
                child: myButton(
                  "Ajouter la carte",
                  onPressed: () => alertModal(),
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
                " Carte ajouter avec sucsès",
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
              "Veuillez verifier votre identité maintenant",
            )
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),

        actions: <Widget>[

          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                // backgroundColor: MyColors.primary,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: MyColors.primary, width: 1.4),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () async {
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const HomeScreen(),
                //   ),
                // );
              },
              child: const Text("Plus tard", style: TextStyle(color: MyColors.primary),),
            ),
          ),
         
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
                    builder: (context) => const IdentityVerifyNameScreen(),
                  ),
                );
              },
              child: const Text("   D'accord    "),
            ),
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}