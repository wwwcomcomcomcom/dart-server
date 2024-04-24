// ignore_for_file: unnecessary_getters_setters

class Member {

  Member(String name,{int id = 0}){
    _name = name;
    _id = id;
  }

  late int _id;
  late String _name;


  int get id => _id;
  set id(int id) => _id = id;

  String get name => _name;
  set name(String name) => _name = name;
}