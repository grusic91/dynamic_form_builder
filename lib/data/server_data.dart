import 'package:dynamic_form_builder/models/object.dart';

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
    'de-DE': 'Deutche name',
  },
  description: {
    'de-DE': 'Deutche description',
  },
);

get getFormObjects => serverFormData;
