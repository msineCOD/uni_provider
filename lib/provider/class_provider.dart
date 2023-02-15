import 'package:flutter/foundation.dart';

import '../model/classModel.dart';

class ClassProvider extends ChangeNotifier {
  List<ClassModel> classList = [
    ClassModel('Zaban', 'ZZ', 2),
    ClassModel('Arabi', 'AA', 2),
    ClassModel('Compiler', 'CC', 4),
    ClassModel('DD', 'dd', 4),
    ClassModel('FF', 'ff', 3),
    ClassModel('GG', 'gg', 2),
    ClassModel('HH', 'hh', 3),
  ];

  String _className = '';
  String _teacherName = '';
  int _vahed = 0;

  void removeClass(int index) {
    classList.removeAt(index);
    notifyListeners();
  }

  void addClass(String className, String teacherName, int vahed) {
    _className = className;
    _teacherName = teacherName;
    _vahed = vahed;
    classList.add(ClassModel(_className, _teacherName, _vahed));
    notifyListeners();
  }

  void editClass(String className, String teacherName, int vahed, int index) {
    classList[index].className = className;
    classList[index].teacherName = teacherName;
    classList[index].vahed = vahed;
    notifyListeners();
  }

  String get className => _className;

  set className(String value) {
    _className = value;
  }

  String get teacherName => _teacherName;

  set teacherName(String value) {
    _teacherName = value;
  }

  int get vahed => _vahed;

  set vahed(int value) {
    _vahed = value;
  }
}
