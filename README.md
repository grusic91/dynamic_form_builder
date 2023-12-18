# Dynamic Form Builder

The Dynamic Form Builder is a Flutter application that demonstrates how to dynamically construct forms using a known data model. The application focuses on showcasing the creation of dynamic text-based forms with data stored in a class called `FormObject`.

## Table of Contents

- [FormObject Class](#formobject-class)
  - [Dummy Data](#dummy-data)
- [Key Features](#key-features)

## FormObject Class

The `FormObject` class is the cornerstone of the application's data model. It encapsulates the structure of our dynamic forms, containing fields for both the name and description along with an identifier (`id`). The class is designed to be versatile, allowing for the representation of various types of form data.

```dart
class FormObject {
  // Add some fields and a constructor for your form object
  Map<String, String> name;
  Map<String, String> description;
  int id;

  FormObject({
    required this.name,
    required this.description,
    required this.id,
  });
}
```
### Dummy data
To simulate the data received from a server, the application uses the following language data and a sample FormObject instance:

```dart
const languages = [
  {'de-DE': 'German'},
  {'en-US': 'English US'},
  {'dk-DA': 'Danish'},
  {'fr-FR': 'French'},
  {'fr-CA': 'French Canada'},
];

FormObject serverFormData = FormObject(
  id: 1,
  name: {
    'de-DE': 'Deutsche name',
  },
  description: {
    'de-DE': 'Deutsche description',
  },
);

```
The languages list represents the available language options in which a TextFormField can be set for the form data. The serverFormData instance provides an example of a FormObject retrieved from a server, showcasing dynamic text data in different languages.

# Dynamic Form Builder

The Dynamic Form Builder is a Flutter application that allows for the dynamic creation of forms based on a versatile data model called `FormObject`.

## Key Features

- **Dynamic Form Building:** Showcase how the application dynamically creates forms based on the `FormObject` data model.

- **Versatile Data Representation:** The `FormObject` class allows for the storage of dynamic text data with the flexibility to expand for different types of forms.

- **Interactive User Interface:** Provide users with an intuitive interface for interacting with and modifying dynamic forms.

...
