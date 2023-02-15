import 'classModel.dart';

class TermModel {
  int? termNumber;
  int? counterVahed;
  int? classNumber ;
  List<ClassModel> classOfTerm = [];

  TermModel(
      this.termNumber, this.counterVahed, this.classNumber, this.classOfTerm);
}