import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthService {
  final Client client;
  late final Account account;

  AuthService({required this.client}) {
    account = Account(client);
  }

  Future<User?> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Session?> login(
      {required String email, required String password}) async {
    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return session;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final user = await account.get();
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
