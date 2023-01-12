import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'my_colors.dart';

class Utils {

  static void showToast(String msg, {Color color = Colors.black}) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      // fontSize: 13.0
    );
  }

  static String getPrettyJSONString(Object jsonObjet) {
    String response = const JsonEncoder.withIndent(' ').convert(jsonObjet);
    return response;
  }

  static loadingDialog(BuildContext context, {String? msg}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 150.0,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  msg ?? 'Veuillez patienter...',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showBottomSheet(BuildContext context, String title, Widget column, {Widget? rAction}) {
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
        return SizedBox(
          height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 3,
                  width: 40,
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: const Icon(Icons.cancel_outlined)
                    ),

                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                  rAction ?? const SizedBox(),
                  ],
                ),

                const  Divider(color: Colors.grey),

                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: column,
                      )
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  static Future<void> simpleModal(BuildContext context, String title, String content, ) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        // contentPadding: const EdgeInsets.fromLTRB(10.0, 12.0, 24.0, 0.0),
        // insetPadding: EdgeInsets.all(12),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.primary
          ),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const EnterOtpScreen(),
                //   ),
                // ).then((value) {setState(() { });});
              },
              child: const Text("D'accord"),
            ),
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
  static OutlineInputBorder myOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(29),
      borderSide: BorderSide(
        width: 1.4, color: MyColors.primary.withOpacity(0.1)
      )
    );
  }

  static OutlineInputBorder homeOutlineBorder({bool radiusleft = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: !radiusleft ? const Radius.circular(10) : const Radius.circular(0),
        topLeft: radiusleft ? const Radius.circular(10) : const Radius.circular(0),
        bottomRight: !radiusleft ? const Radius.circular(10) : const Radius.circular(0),
        bottomLeft: radiusleft? const Radius.circular(10) : const Radius.circular(0) 
      ),
      borderSide: BorderSide(
        width: 1.3, color: Colors.grey.withOpacity(.3)
      )
    );
  }
}