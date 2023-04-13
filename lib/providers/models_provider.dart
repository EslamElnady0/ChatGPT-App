import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';

import '../models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo";

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
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
