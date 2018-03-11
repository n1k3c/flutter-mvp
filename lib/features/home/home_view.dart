import 'package:flutter/material.dart';
import 'package:flutter_mvp/features/home/home_contract.dart';
import 'package:flutter_mvp/features/home/home_presenter.dart';
import 'package:flutter_mvp/model/contact.dart';

class Home extends StatelessWidget {

  static const String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter MVP'),
      ),
      body: new ContactList()
    );
  }
}

class ContactList extends StatefulWidget {

  ContactList({ Key key }) : super(key: key);

  @override
  _ContactListState createState() => new _ContactListState();
}


class _ContactListState extends State<ContactList> implements HomeContract {

  HomePresenter _presenter;

  List<Contact> _contacts;

  bool _isLoading;

  _ContactListState() {
    _presenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadContacts();
  }


  @override
  void showContactList(List<Contact> items) {

    setState(() {
      _contacts = items;
      _isLoading = false;
    });
  }

  @override
  void showError() {
    // TODO: implement showError
  }

  @override
  Widget build(BuildContext context) {

    var widget;

    if(_isLoading) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()
          )
      );
    } else {
      widget = new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _buildContactList()
      );
    }

    return widget;
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts.map((contact) =>
    new _ContactListItem(
        contact: contact,
      onTap:   () {  }
    ))
        .toList();
  }

}

class _ContactListItem extends ListTile {

  _ContactListItem({ Contact contact,
     GestureTapCallback onTap}) :
        super(
          title : new Text(contact.fullName),
          subtitle: new Text(contact.email),
          leading: new CircleAvatar(
              child: new Text(contact.fullName[0])
          ),
          onTap: onTap
      );
}