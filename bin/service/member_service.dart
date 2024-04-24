import '../model/member.dart';
import '../repository/member_repo.dart';
import '../repository/memory_member_repo.dart';

class MemberService {
  late final MemberRepository _memberRepository;

  MemberService(MemberRepository memberRepository){_memberRepository = memberRepository;}

  int join(Member member){
    checkDuplicateMember(member);
    _memberRepository.save(member);
    return member.id;
  }

  void checkDuplicateMember(Member member){
    if(_memberRepository.findByName(member.name) != null) throw Exception("Illegal State Exception");
  }

  List<Member> findMembers(){
    return _memberRepository.findAll();
  }

  Member? fineOne(int id){
    return _memberRepository.findById(id);
  }
}