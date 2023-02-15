import 'package:flutter/foundation.dart';

import '../model/classModel.dart';
import '../model/termModel.dart';

class TermProvider extends ChangeNotifier {
  List<ClassModel> classTerm1 = [];
  List<ClassModel> classTerm2 = [];
  List<TermModel> termList = [];

  TermProvider() {
    classTerm1 = [
      ClassModel('Zaban', 'ZZ', 2),
      ClassModel('Arabi', 'AA', 2),
      ClassModel('FF', 'ff', 3),
    ];
    classTerm2 = [
      ClassModel('HH', 'hh', 3),
      ClassModel('GG', 'gg', 2),
      ClassModel('FF', 'ff', 3),
      ClassModel('Arabi', 'AA', 2)
    ];

    termList = [
      TermModel(1, 7, 4, classTerm1),
      TermModel(2, 10, 3, classTerm2)
    ];
  }

  int _termNumber = 0;
  int _vahedNumber = 0;
  int _classNumber = 0;

  void addClassInTerm(int index, ClassModel classModel) {
    termList[index].classOfTerm.add(classModel);
    notifyListeners();
  }

  void deleteClassInTerm(int indexTerm, int indexClass) {
    termList[indexTerm].classOfTerm.removeAt(indexClass);
    notifyListeners();
  }

  void addTerm() {
    List<ClassModel> classList = [];
    termList.add(TermModel(_termNumber, _vahedNumber, _classNumber, classList));
    notifyListeners();
  }

  int get termNumber => _termNumber;

  set termNumber(int value) {
    _termNumber = value;
  }

  int get vahedNumber => _vahedNumber;

  set vahedNumber(int value) {
    _vahedNumber = value;
  }

  int get classNumber => _classNumber;

  set classNumber(int value) {
    _classNumber = value;
  }
}
