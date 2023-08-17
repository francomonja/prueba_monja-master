import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FoodFormDialogViewModel extends BaseViewModel {
  final TextEditingController categoryController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController descriptionController = TextEditingController(text: '');

  List<String> errors = [];
  bool validate() {
    errors.clear();
    if (categoryController.text.isEmpty) errors.add('el campo es requerido');
    if (nameController.text.isEmpty) errors.add('el campo es requerido');
    if (descriptionController.text.isEmpty) errors.add('el campo es requerido');
    notifyListeners();
    return errors.isEmpty;
  }
}
