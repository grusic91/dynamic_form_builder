import 'package:dynamic_form_builder/dynamic_form.dart';
import 'package:flutter/material.dart';

final class DynamicFormHome extends StatelessWidget {
  const DynamicFormHome({super.key});

  static const _children = [];

  @override
  Widget build(BuildContext context) {
    final children = _children.toList();
    return Scaffold(
      body: DynamicForm(
        children: children..shuffle(),
      ),
    );
  }
}
