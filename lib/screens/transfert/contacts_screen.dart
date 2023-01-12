import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';
import 'package:lisocash/widgets/contact_item.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

  String? myNumber;

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
        title: const Text("Mes Contacts"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _newContactBottomSheet(context), 
            icon: const Icon(Icons.person_add)
          )
        ],
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ContactItem();
        },
      )
    );
  }

  
  void _newContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 3,
                      width: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ajouter un contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 17
                      ),
                    ),
                  ),

                  const Divider(color: Colors.grey,),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
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
              )
            ]),
          );
        }
    );
  }
}