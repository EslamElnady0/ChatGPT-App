import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';

import '../models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  String _currentModel = "babbage";

  String get getCurrentModel {
    return _currentModel;
  }

  void setCurrentModel(String newModel) {
    _currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];

  List<ModelsModel> get getModelsList {
    return modelsList;
  }
  Future<List<ModelsModel>> getAllModels()async{
  modelsList =await ApiServices.getModels();
    return modelsList;
  }
}
