
import 'dart:collection';

import '../model/member.dart';
import 'member_repo.dart';

class MemoryMemberRepository implements MemberRepository {
  static final Map<int,Member> _store  = HashMap();
  static int _sequence = 0;

  @override
  List<Member> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }
  
  @override
  Member? findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }
  
  @override
  Member? findByName(String name) {
    // TODO: implement findByName
    throw UnimplementedError();
  }
  
  @override
  Member save(Member member) {
    member.id = _sequence++;
    _store.addAll({member.id:member});
    return member;
  }
  
}