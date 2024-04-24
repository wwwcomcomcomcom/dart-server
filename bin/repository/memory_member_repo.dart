
import 'dart:collection';

import '../model/member.dart';
import 'member_repo.dart';

class MemoryMemberRepository implements MemberRepository {
  static final Map<int,Member> _store  = HashMap();
  static int _sequence = 0;

  @override
  List<Member> findAll() {
    return _store.values.toList();
  }
  
  @override
  Member? findById(int id) {
    return _store[id];
  }
  
  @override
  Member? findByName(String name) {
    return _store.values.where((element) => element.name == name).firstOrNull;
  }
  
  @override
  Member save(Member member) {
    member.id = _sequence++;
    _store.addAll({member.id:member});
    return member;
  }

}