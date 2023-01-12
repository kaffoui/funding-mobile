import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lisocash/screens/add_new_card_screen.dart';
import 'package:lisocash/screens/add_new_contact_screen.dart';
import 'package:lisocash/screens/transfert/contacts_screen.dart';
import 'package:lisocash/utils/utils.dart';

import '../utils/my_colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _contactSelected = TextEditingController(text: "Michelle Apo");

  void _bottomSheetAction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                width: 40,
                height: 2.6,
                color: Colors.grey,
              ),
              const SizedBox(height: 10,),
              const Text(
                'Tansfert vers',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 17
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),

              const Divider(),

              buildListTile('Un compte lisocah'),
              // buildListTile('Moov Flooz Money'),
              buildListTile('MTN Mobile Money'),
              buildListTile('Orange Money')
              
            ]),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: MyColors.primary
      ),

      child: Scaffold(
        // key: _keyScaffold,
        backgroundColor: MyColors.bodyColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.primary,
          automaticallyImplyLeading: false,
          // centerTitle: true,
          title: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'CenturyGothic',
                  fontSize: 20,
                  color: MyColors.white
              ),
              children: [
                TextSpan(
                  text: 'LISO',
                ),

                TextSpan(
                  text: ' CASH',
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            ),
          ),
          
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon( //add_circle_outline_outlined
                  Icons.person,
                  color: MyColors.white,
                ),

                onPressed: () {},
              ),
            )
          ],
        ),
        // drawer: MainDrawer(),

        body: Stack(
          children: [
            Container(
              color: MyColors.primary,
              height: MediaQuery.of(context).size.height /8,
            ),

            ListView(
              // physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    border: Border.all(color: Colors.grey.withOpacity(.5)),
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        child: Text(
                          "J'envoie de l'argent",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      Text(
                        "à".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Utils.showBottomSheet(
                          context, 
                          "Mes contacts", 
                          rAction: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewContactScreen()));
                            }, 
                            icon: const Icon(Icons.person_add, color: MyColors.primary,)),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Divider(), 
                            itemCount: 25,
                            itemBuilder: (context, index) => ListTile(
                              leading: Image.asset("assets/images/fr.gif", width: 25),
                              title: const Text("John barton"),
                              subtitle: const Text("+33 7989748748"),
                              trailing: const Icon(Icons.arrow_right_outlined),
                            ), 
                          )
                        ),
                        child: TextFormField(
                          controller: _contactSelected,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: "Nom du Bénéficiaire",
                            hintStyle: const TextStyle(fontSize: 17),
                            border: InputBorder.none,
                            prefix: Container(margin: const EdgeInsets.only(right: 8), child: Image.asset("assets/images/fr.gif", width: 20,)),
                            suffix: _contactSelected != null ? const Icon(Icons.edit_outlined, size: 17, color: MyColors.primary,): null
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "00",
                                labelText: "     ENVOYER",
                                labelStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                filled: true,
                                fillColor: MyColors.white,
                                border: Utils.homeOutlineBorder(radiusleft: true),
                                enabledBorder: Utils.homeOutlineBorder(radiusleft: true),
                                focusedBorder: Utils.homeOutlineBorder(radiusleft: true)
                              ),
                            )
                          ),

                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "00",
                                labelText: "     RECEVOIR",
                                labelStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                filled: true,
                                fillColor: MyColors.white,
                                border: Utils.homeOutlineBorder(),
                                enabledBorder: Utils.homeOutlineBorder(),
                                focusedBorder: Utils.homeOutlineBorder()
                              ),
                            )
                          )
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          child: Text(
                            "Taux 1 EUR = 650 CFA",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ),
                      ),

                      Container(
                        height: 47.0,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: TextButton(
                          
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: MyColors.primary,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: MyColors.primary, width: 1.4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(29)
                              )
                            ), 
                          ),
                          child: const Text(
                            "Envoyer",
                            style: TextStyle(
                              color: MyColors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewCardScreen()))
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 10, left: 20,top: 25),
                  child: const Text(
                    "Dernières transactions", 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    )
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 19),
                  decoration: const BoxDecoration(
                  color: MyColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      buildContainer('A george evra', '20 000', '23/05/2022 - 15h16', Colors.red, Icons.arrow_upward),
                      buildContainer('De John smith', '8 500', '25/04/2022 - 19h114', Colors.green, Icons.arrow_downward),
                      buildContainer('De Richard eddy', '7 800', '05/07/2022 - 09h16', Colors.green, Icons.arrow_downward),
                      buildContainer('Rechargement', '10 000', '13/10/2022 - 11h06', Colors.green, Icons.arrow_downward),
                      buildContainer('Rétrait', '5 000', '23/03/2022 - 12h36', Colors.red, Icons.arrow_upward),

                    ],
                  ),
                )


              ],
            )
          ],
        ),
        
      ),
    );
  }

  InkWell buildActionButton(String title, IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.1),
            radius: 27,
            child: Icon(
              icon,
              color: Colors.white,
              size: 38,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.white
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildSeparator() => Container(height: 1.8, color: MyColors.primary.withOpacity(0.1),);

  Widget buildContainer(String title, prix, date, Color color, IconData icon) {
    return Container( //container
    margin: const EdgeInsets.only(
      bottom: 2
    ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row( //1st row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),child: Icon(icon, size: 18, color: color,)
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    ),
                  ),

                  const Spacer(),

                  Text(
                    '$prix F',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(6.0),
              child:  Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$date',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 12
                  ),
                )
              )
            ),

            const SizedBox(height: 5,),
            buildSeparator()
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title) {
    return InkWell(
      onTap: () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  const ContactsScreen()
        )
      );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0, 
          bottom: 0,
          left: 10,
          right: 10
        ),
        child: ListTile(
          leading: const Icon(
            Icons.account_balance_wallet_outlined,
            size: 25,
          ),
          title: Text(
            title,
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              color: Colors.black87
            ),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 17,
          ),
        ),
      ),
    );
  }

}