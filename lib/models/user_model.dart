import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String status;
  final String cid;
  final String username;
  final String name;
  final String firstname;
  final String lastname;
  final String type;
  final String faccode;
  final String facname;
  final String depcode;
  final String depname;
  final String seccode;
  final String secname;
  final String email;
  final String chiefcode;
  final String chiefname;
  final String chieffaccode;
  final String chieffacname;
  final String token;
  UserModel({
    required this.status,
    required this.cid,
    required this.username,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.type,
    required this.faccode,
    required this.facname,
    required this.depcode,
    required this.depname,
    required this.seccode,
    required this.secname,
    required this.email,
    required this.chiefcode,
    required this.chiefname,
    required this.chieffaccode,
    required this.chieffacname,
    required this.token,
  });
 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'cid': cid,
      'username': username,
      'name': name,
      'firstname': firstname,
      'lastname': lastname,
      'type': type,
      'faccode': faccode,
      'facname': facname,
      'depcode': depcode,
      'depname': depname,
      'seccode': seccode,
      'secname': secname,
      'email': email,
      'chiefcode': chiefcode,
      'chiefname': chiefname,
      'chieffaccode': chieffaccode,
      'chieffacname': chieffacname,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      status: (map['status'] ?? '') as String,
      cid: (map['cid'] ?? '') as String,
      username: (map['username'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      firstname: (map['firstname'] ?? '') as String,
      lastname: (map['lastname'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      faccode: (map['faccode'] ?? '') as String,
      facname: (map['facname'] ?? '') as String,
      depcode: (map['depcode'] ?? '') as String,
      depname: (map['depname'] ?? '') as String,
      seccode: (map['seccode'] ?? '') as String,
      secname: (map['secname'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      chiefcode: (map['chiefcode'] ?? '') as String,
      chiefname: (map['chiefname'] ?? '') as String,
      chieffaccode: (map['chieffaccode'] ?? '') as String,
      chieffacname: (map['chieffacname'] ?? '') as String,
      token: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
