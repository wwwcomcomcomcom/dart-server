import 'dart:convert';
import 'dart:io';

import 'package:dart_server/controller.dart';
import 'package:dart_server/view/template.dart';
import 'package:shelf/shelf.dart';

import '../model/member.dart';
import '../repository/memory_member_repo.dart';
import '../service/member_service.dart';

class MemberController extends Controller {
  static final MemberService _memberService = MemberService(MemoryMemberRepository());

  MemberController(super.url);

  MemberController.regist(super.url,super.router) : super.regist();

  @override
  Response get(Request request){
    final file = File("bin/frontend/member_regist.html");
    final fileData = file.readAsStringSync();
    return Response.ok(
      parseTemplate(fileData),
      headers:{"Content-Type":"text/html; charset=utf-8"}
    );
  }
  @override
  Response post(Request request) {
    parseRequestBody(request).then((data) => {
      if(data["name"] != null) joinMember(data["name"]!)
    });
    return get(request);
  }

  void joinMember(String name){
    _memberService.join(Member(name));
    print(_memberService.findMembers().toString());
  }
}