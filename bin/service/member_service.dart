import 'package:dart_server/util.dart';

import '../model/member.dart';
import '../repository/member_repo.dart';

class MemberService {
  late final MemberRepository _memberRepository;

  MemberService(MemberRepository memberRepository){_memberRepository = memberRepository;}

  int join(Member member){
    if(isDuplicateMember(member)){
      member.name = getRandomString(10);
      print(member.name);
    }
    _memberRepository.save(member);
    return member.id;
  }

  bool isDuplicateMember(Member member){
    return _memberRepository.findByName(member.name) == null;
  }

  List<Member> findMembers(){
    return _memberRepository.findAll();
  }

  Member? fineOne(int id){
    return _memberRepository.findById(id);
  }
}