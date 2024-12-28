import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? role;

  UserModel(
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
  );

  // Phương thức để tạo đối tượng UserModel từ tài liệu Firestore
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      doc.id,
      doc.get('name'),
      doc.get('email'),
      doc.get('password'),
      doc.get('role'),
    );
  }

// Chuyển đối tượng UserModel thành map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
