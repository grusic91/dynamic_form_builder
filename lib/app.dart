import 'package:dynamic_form_builder/home.dart';
import 'package:flutter/material.dart';

final class DynamicFormApp extends StatelessWidget {
  const DynamicFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DynamicFormHome(),
    );
  }
}
