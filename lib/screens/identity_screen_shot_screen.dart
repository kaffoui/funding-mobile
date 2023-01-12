// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lisocash/utils/my_buttons.dart';
import 'package:lisocash/utils/my_colors.dart';
import 'package:lisocash/utils/utils.dart';

class IdentityScreenShotScreen extends StatefulWidget {
  const IdentityScreenShotScreen({Key? key}) : super(key: key);

  @override
  State<IdentityScreenShotScreen> createState() => _IdentityScreenShotScreenState();
}

class _IdentityScreenShotScreenState extends State<IdentityScreenShotScreen> {

   File? image; 
   String imagePath = "";
   String? _type;

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });


      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
      );

      if (croppedFile != null) {
        setState(() {
          imagePath = croppedFile.path;
        });
        
      }


    } on PlatformException catch (e) {
      debugPrint("###### $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        title: const Text(
            "Pièce d'identité",
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            
            children: [
              const SizedBox(height: 15),

              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Veuillez choisir votre pièce",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    filled: true,
                    fillColor: MyColors.primary.withOpacity(0.1),
                    enabledBorder: Utils.myOutlineBorder(),
                    focusedBorder: Utils.myOutlineBorder(),
                    border: Utils.myOutlineBorder(),
                    disabledBorder: Utils.myOutlineBorder()
                  ),
                  isExpanded: true,
                  iconEnabledColor: MyColors.primary,
                  items: ["Carte d'identité", "Passeport", "Permis de conduire", "Carte de séjour"].map((rType) {
                  return DropdownMenuItem<String>(
                      value: rType,
                      child: Text(rType)
                    );
                  }).toList(),
          
                hint: const Text("  Choisir"),
                value: _type,
          
                onChanged: (val) {
                  setState(() {
                    _type = val;
                    debugPrint("### $_type");
                  });
                },
          
              ),

              SizedBox(height: 25,),

              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Prenez-en une photo",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),

               SizedBox(height: 15,),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
                ),
                child: InkWell(
                  onTap: () {
                    pickImage(ImageSource.camera);
                  },
                  child: (imagePath != "") 
                  ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ) 
                  : const Icon(
                    Icons.add_a_photo_outlined, 
                    size: 50, 
                    color: Colors.black45,
                  ),
                )
              ),
      
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50), 
                child: myButton(
                  "Terminer", 
                  // onPressed: () {
                  //   Navigator.push(
                  //     context, 
                  //     CupertinoPageRoute(
                  //       builder: (context) => const EnterPincodeScreen()
                  //     )
                  //   );
                  // }
                )
              ),
      
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }



    Widget buildListTileItem( {String title = 'Item', IconData icon = Icons.info, void Function()? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      onTap: onTap,
      leading: Icon(
        icon
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 15.4,
      ),
    );
  }

}