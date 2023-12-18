import 'package:dynamic_form_builder/add_moe_languages_input_btn.dart';
import 'package:dynamic_form_builder/models/object.dart';
import 'package:flutter/material.dart';

/// Type definition for the callback function that handles input value changes.
typedef OnInputValueChange = void Function(String languageCode, String value);

/// Builds an input field for a dynamic form based on the provided parameters.
///
/// Parameters:
/// - `entry`: The entry representing the language in the form (e.g., {'en-US': 'English US'}).
/// - `formKey`: The key associated with the form.
/// - `fieldType`: The type of the form field (e.g., 'name' or 'description').
/// - `focusNodes`: Map of focus nodes for each language and field type.
/// - `object`: The FormObject representing the form data.
/// - `onInputValueChange`: Callback function for handling input value changes.
/// - `updateFormObjectInput`: Callback function for updating the FormObject with input data.
///
/// Returns a container containing a row with a TextFormField and an AddMoreLanguageInputButton.
Widget buildInputField({
  entry,
  formKey,
  required String fieldType,
  required Map<String, FocusNode> focusNodes,
  required FormObject object,
  required OnInputValueChange onInputValueChange,
  required updateFormObjectInput,
}) {
  // Extract language code from the entry key
  String languageCode = entry.key;
  // Generate a unique key for each TextFormField
  Key fieldKey = Key('${fieldType}_$languageCode');
  String key = fieldType + languageCode;
  FocusNode? focusNode = focusNodes[key];

  // Return a container with a row containing a TextFormField and an AddMoreLanguageInputButton
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
