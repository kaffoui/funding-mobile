import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

// ignore: must_be_immutable
class DateInputFormField extends StatefulWidget {
  TextEditingController? dateControler;
  // String? unformatedDate;

  DateInputFormField(
      {Key? key, 
      @required this.dateControler, 
      // required this.unformatedDate
    }) : super(key: key);

  @override
  State<DateInputFormField> createState() => _DateInputFormFieldState();
}

class _DateInputFormFieldState extends State<DateInputFormField> {
  DateTime selectedDate = DateTime.now();
  String? _setDate;
  
  @override
  void initState() {
    widget.dateControler?.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    // widget.unformatedDate = DateTime.now().toIso8601String();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          locale: const Locale("fr", "FR"),
          initialDate: selectedDate, //revoi
          helpText: "ENTRER UNE DATE",
          cancelText: 'FERMER',
          errorFormatText: 'Entrer une date valide',
          fieldLabelText: 'Entrer une date',
          errorInvalidText: 'Entrer une date valide',
          initialDatePickerMode: DatePickerMode.year,
          firstDate: DateTime(1700),
          lastDate: DateTime(2023));
      if (picked != null) {
        setState(() {
          selectedDate = picked;
          // widget.unformatedDate = selectedDate.toIso8601String();
          widget.dateControler != null
            ? widget.dateControler!.text = DateFormat('dd-MM-yyyy').format(selectedDate)
            : debugPrint("null");
          debugPrint("##### dateControler ${widget.dateControler!.text}");
          // debugPrint("##### unformatedDate ${widget.unformatedDate}");
        });
      }
    }

    return GestureDetector(
      onTap: () => selectDate(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          enabled: false,
          keyboardType: TextInputType.text,
          controller: widget.dateControler,
          style: const TextStyle(fontSize: 17.3, color: MyColors.primary, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText: "Date de naissance",
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            prefixIcon: const Icon(Icons.date_range, color: MyColors.primary,),
            filled: true,
            fillColor: MyColors.primary.withOpacity(0.1),

            enabledBorder: Utils.myOutlineBorder(),
            focusedBorder: Utils.myOutlineBorder(),
            border: Utils.myOutlineBorder(),
            disabledBorder: Utils.myOutlineBorder()
          ),
          onSaved: (val) {
            _setDate = val;
            debugPrint('##### _setDate ${_setDate!}');
          },
        ),
      ),
    );
  }

  
}

