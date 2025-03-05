import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  String _selectedCountry = "jm"; // Default to Jamaica
  String _selectedCategory = "business"; // Default category

  String get selectedCountry => _selectedCountry;
  String get selectedCategory => _selectedCategory;

  void setSelectedCountry(String countryCode) {
    _selectedCountry = countryCode;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
