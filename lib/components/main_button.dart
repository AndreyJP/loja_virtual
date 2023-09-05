import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {Function()? buttonFunction,
    String buttonText = '',
    Color buttonCollor = Colors.blue}) {
  return ElevatedButton(
    onPressed: buttonFunction,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonCollor),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(15)),
    ),
    child: Text(
      buttonText,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  );
}
