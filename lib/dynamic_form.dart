import 'package:dynamic_form_builder/build_input_field.dart';
import 'package:dynamic_form_builder/data/server_data.dart';
import 'package:dynamic_form_builder/models/object.dart';

import 'package:flutter/material.dart';

final class DynamicForm extends StatefulWidget {
  const DynamicForm({
    super.key,
  });

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  final _formKey = GlobalKey<FormState>();
  FormObject? object;

  @override
  void initState() {
    super.initState();
    object = getFormObjects;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (object != null)
                ...object!.name.entries
                    .map((entry) => buildInputField())
                    .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
