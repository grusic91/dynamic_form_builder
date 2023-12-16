import 'package:flutter/material.dart';

Widget buildInputField() {
  return Column(
    children: [
      Row(
        children: [
          Flexible(
            child: TextFormField(),
          )
        ],
      )
    ],
  );
}
