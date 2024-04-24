// ignore_for_file: unnecessary_getters_setters

class MemberForm {
  late String _name;

  MemberForm(String name){
    _name = name;
  }

  String get name => _name;

  set name(String name) => _name = name;
}