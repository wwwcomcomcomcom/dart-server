
import '../model/member.dart';

abstract interface class MemberRepository {
  Member save(Member member);

  Member? findById(int id);

  Member? findByName(String name);

  List<Member> findAll();
}