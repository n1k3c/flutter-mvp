import 'package:flutter_mvp/repository/get_contacts.dart';
import 'package:flutter_mvp/repository/get_contacts_contract.dart';

class Injector {

  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ContactsRepository get contactRepository {
    return new GetContactsRepository();
  }
}