import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lisocash/screens/card_payment_info_screen.dart';
import 'package:lisocash/widgets/my_input_form_field.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
        title: const Text("Nouvelle carte de débit"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 5,
          ),
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardNumber: false,
            obscureCardCvv: false,
            isHolderNameVisible: true,
            cardBgColor: MyColors.primary,
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: false,
                    obscureNumber: false,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    cardNumberDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Numero de carte',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      focusedBorder: Utils.myOutlineBorder(),
                      enabledBorder: Utils.myOutlineBorder(),
                    ),
                    expiryDateDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      focusedBorder: Utils.myOutlineBorder(),
                      enabledBorder: Utils.myOutlineBorder(),
                      labelText: "Date d'expiration",
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      focusedBorder: Utils.myOutlineBorder(),
                      enabledBorder: Utils.myOutlineBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    
                    cardHolderDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      focusedBorder: Utils.myOutlineBorder(),
                      enabledBorder: Utils.myOutlineBorder(),
                      labelText: 'Titulaire de la carte',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(
                    width: 300,
                    child: myButton(
                      "Suivant",
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   debugPrint('valid!');
                        // } else {
                        //   debugPrint('invalid!');
                        // }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CardPaymentInfoScreen()));
                      }
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}