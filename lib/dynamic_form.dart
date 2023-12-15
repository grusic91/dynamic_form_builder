import 'package:flutter/material.dart';

final class DynamicForm extends StatefulWidget {
  const DynamicForm({super.key, this.children});

  final dynamic children;

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
