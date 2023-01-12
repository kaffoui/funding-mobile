import 'package:flutter/material.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';

class TransfertScreen extends StatefulWidget {
  const TransfertScreen({super.key});

  @override
  State<TransfertScreen> createState() => _TransfertScreenState();
}

class _TransfertScreenState extends State<TransfertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Transfert d'argent"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25,),
              label("Transfert à:"),
              const SizedBox(height: 5,),

              Container(
                decoration: BoxDecoration(
                  color: MyColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors.primary,
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: MyColors.white,
                      child: Icon(Icons.person),
                    )
                  ),

                  // ignore: prefer_const_constructors
                  title: Text("Maxwell michael"),

                  subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Image.network("https://www.worldometers.info/img/flags/fr-flag.gif", width: 14,),
                      const SizedBox(width: 6,),
                      const Text("+33 07667809", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                  
                ),
              ),

              const SizedBox(height: 15,),

              label("Montant envoyé"),
              const SizedBox(height: 10,),

              const MyInputTextField(
                textInputType: TextInputType.number,
                prefixIcon: Icons.arrow_circle_up_outlined,
              ),

              const SizedBox(height: 10,),


            label("Montant reçu"),
            const SizedBox(height: 10,),

            const MyInputTextField(
              textInputType: TextInputType.number,
              prefixIcon: Icons.arrow_circle_down_rounded
            ),

            const SizedBox(height: 20),

            const Align(child:  Text("Frais Lisocash: 1%",)),

            const SizedBox(height: 20),

            myButton(
              "Transferer"
            )

            ],
          ),
        ),
      ),
    );
  }

  Text label(String str) {
    return Text(
      str,
        style: const TextStyle(
          fontSize: 17
      )
    );
  }
}