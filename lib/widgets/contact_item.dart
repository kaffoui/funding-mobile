import 'package:flutter/material.dart';
import 'package:lisocash/screens/transfert/transfert_screen.dart';
import 'package:lisocash/utils/my_colors.dart';


class ContactItem extends StatelessWidget {
  const ContactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransfertScreen()
              )
            ),
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 24,
              backgroundColor: MyColors.primary,
              child: CircleAvatar(
                backgroundColor:  MyColors.primary,
                radius: 23,
                backgroundImage: NetworkImage("https://media.gettyimages.com/id/1148043788/fr/photo/belle-fille-de-sourire-avec-la-coiffure-boucl%C3%A9e.jpg?s=612x612&w=0&k=20&c=fBUGxIP92U-u5sob2YSJ49d1t4gcIR6aZzq7d9VLVkA=")
              ),
            ),
            title: const Text(
              "Maxwell michael",
                style: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
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
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15,),
          ),
          const Divider()

          ],
      ),
    );
  }
}


