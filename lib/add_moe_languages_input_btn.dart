import 'package:dynamic_form_builder/data/server_data.dart';
import 'package:dynamic_form_builder/models/object.dart';
import 'package:flutter/material.dart';

// Define the available languages based on server data.
const databaseLanguages = languages;

/// Widget representing a button to add more language inputs in a dynamic form.
///
/// Parameters:
/// - `languageCode`: The code representing the language data.
/// - `fieldType`: The type of the form field (e.g., 'name' or 'description').
/// - `object`: The FormObject representing the form data.
/// - `updateFormObjectInput`: Callback function for updating the FormObject with input data.
final class AddMoreLanguageInputButton extends StatefulWidget {
  final String languageCode;
  final String fieldType;
  final FormObject object;
  final Function updateFormObjectInput;

  const AddMoreLanguageInputButton({
    super.key,
    required this.languageCode,
    required this.fieldType,
    required this.object,
    required this.updateFormObjectInput,
  });

  @override
  State<AddMoreLanguageInputButton> createState() =>
      _AddMoreLanguageInputButtonState();
}

class _AddMoreLanguageInputButtonState
    extends State<AddMoreLanguageInputButton> {
  bool _isSelected = false;
  Set<String> _selectedLanguages = {};

  @override
  void initState() {
    super.initState();
    // initialize selected languages based on the form type.
    if (widget.fieldType == 'name') {
      _selectedLanguages = widget.object.name.keys.toSet();
    } else if (widget.fieldType == 'description') {
      _selectedLanguages = widget.object.description.keys.toSet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        if (_isSelected) {
          showAvailableLanguagesSelectorDialog();
        }
      },
      child: Container(
        width: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.purple[900] : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.languageCode,
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.purple[900],
                ),
              ),
            ),
            Icon(
              Icons.add,
              color: _isSelected ? Colors.white : Colors.purple[900],
            )
          ],
        ),
      ),
    );
  }

  // Fucntion to show the dialog for selecting available languages
  void showAvailableLanguagesSelectorDialog() async {
    Set<String> selectedLanguages = widget.fieldType == 'name'
        ? Set.from(widget.object.name.keys)
        : Set.from(widget.object.description.keys);

    final result = await showDialog<Set<String>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Language"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: languages.map((language) {
                    return CheckboxListTile(
                      title: Text(language.values.first.toString()),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: selectedLanguages.contains(language.keys.first),
                      onChanged: (bool? value) {
                        if (value == true || selectedLanguages.length > 1) {
                          setState(() {
                            if (value == true) {
                              selectedLanguages.add(language.keys.first);
                            } else {
                              selectedLanguages.remove(language.keys.first);
                            }
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedLanguages);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "Apply",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    ).whenComplete(() {
      setState(() {
        _isSelected = false;
      });
    });
    // Update selected languages and call the callback function.
    if (result != null) {
      setState(() {
        _selectedLanguages = result;
        widget.updateFormObjectInput(_selectedLanguages, widget.fieldType);
      });
    }
  }
}
