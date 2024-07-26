import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/gita_modal.dart';

class GitaProvider extends ChangeNotifier
{
  List<GitaModal> gitaList = [];
  int SelectedIndex= 0;
  int languageIndex = 0;

  Future<void> jsonParsing()
  async {
    String json = await rootBundle.loadString('assets/JsonData/gita.json');
    List gita = jsonDecode(json);
    gitaList = gita.map((e) => GitaModal.fromjson(e),).toList();
    notifyListeners();
  }
  void Index(int index)
  {
    SelectedIndex = index;
    notifyListeners();
  }

  void translateLanguage(){
    if(languageIndex<3){
      languageIndex++;
      notifyListeners();
    }
    else{
      languageIndex = 0;
      notifyListeners();
    }
  }
  GitaProvider()
  {
    jsonParsing();
  }
}