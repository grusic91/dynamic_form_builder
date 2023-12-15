import 'package:dynamic_form_builder/models/object.dart';

const languages = [
  {'de-DE': 'German'},
  {'en-US': 'English US'},
  {'dk-DA': 'Danish'},
  {'fr-FR': 'French'},
  {'fr-CA': 'French Canada'},
];

List<FormObject> serverFormData = [
  FormObject(
    id: 1,
    name: {
      'de-DE': 'Deutche name',
    },
    description: {
      'de-DE': 'Deutche description',
    },
  ),
  FormObject(
    id: 2,
    name: {'de-DE': 'Ger name2', 'en-US': 'Englush Name'},
    description: {
      'de-DE': 'Deutsche description',
      'en-US': 'German D',
    },
  ),
  FormObject(
    id: 3,
    name: {
      'de-DE': 'German name',
    },
    description: {
      'de-DE': 'German description',
    },
  ),
  FormObject(
    id: 4,
    name: {
      'de-DE': 'German name',
    },
    description: {
      'de-DE': 'German description',
    },
  ),
];

get getFormObjects => [...serverFormData];
