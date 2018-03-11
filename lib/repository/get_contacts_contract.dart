import 'dart:async';
import 'package:flutter_mvp/model/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
}