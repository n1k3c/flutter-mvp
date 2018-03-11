import 'package:flutter_mvp/model/contact.dart';

abstract class HomeContract {

  void showContactList(List<Contact> items);

  void showError();
}