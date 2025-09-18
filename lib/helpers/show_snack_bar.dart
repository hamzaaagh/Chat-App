import 'package:flutter/material.dart';

void Showsnackbar(BuildContext context, String massege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massege),
    ),
  );
}
