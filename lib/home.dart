import 'package:dynamic_form_builder/dynamic_form.dart';
import 'package:flutter/material.dart';

final class DynamicFormHome extends StatelessWidget {
  const DynamicFormHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dynamic Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: const DynamicForm(),
    );
  }
}
