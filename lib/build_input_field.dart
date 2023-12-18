import 'package:dynamic_form_builder/add_moe_languages_input_btn.dart';
import 'package:dynamic_form_builder/models/object.dart';
import 'package:flutter/material.dart';

typedef OnInputValueChange = void Function(String languageCode, String value);

Widget buildInputField({
  entry,
  formKey,
  required String fieldType,
  required Map<String, FocusNode> focusNodes,
  required FormObject object,
  required OnInputValueChange onInputValueChange,
  required updateFormObjectInput,
}) {
  String languageCode = entry.key;
  // Generate a unique key for each TextFormField
  Key fieldKey = Key('${fieldType}_$languageCode');
  String key = fieldType + languageCode;
  FocusNode? focusNode = focusNodes[key];
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 0,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextFormField(
                key: fieldKey,
                focusNode: focusNode,
                textCapitalization: TextCapitalization.sentences,
                initialValue: '',
                onChanged: (value) {
                  onInputValueChange(languageCode, value);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            AddMoreLanguageInputButton(
              languageCode: languageCode,
              fieldType: fieldType,
              object: object,
              updateFormObjectInput: updateFormObjectInput,
            ),
          ],
        )
      ],
    ),
  );
}
