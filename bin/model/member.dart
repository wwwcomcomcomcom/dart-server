// ignore_for_file: unnecessary_getters_setters

class Member {

  Member(int id,String name);

  late final int _id;
  late final String _name;


  int get id => _id;
  set id(int id) => _id = id;

  String get name => _name;
  set name(String name) => _name = name;
}