import 'package:flutter/material.dart';

import 'my_colors.dart';

Container myButton(String title, {void Function()? onPressed, Color color = MyColors.primary}) {
  return Container(
    height: 47.0,
    margin: const EdgeInsets.symmetric(vertical: 20),
    width: double.infinity,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 1.4),
          borderRadius: const BorderRadius.all(
            Radius.circular(29)
          )
        ), 
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: MyColors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}


TextButton smallButton(String title, {void Function()? onPressed, Color primary = MyColors.primary} ) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: primary,
      backgroundColor: MyColors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primary, width: 1.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(5)
        )
      ), 
    ),
    onPressed: onPressed, 
    child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
  );
}