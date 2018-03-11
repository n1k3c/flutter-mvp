import 'package:flutter_mvp/di/injection.dart';
import 'package:flutter_mvp/features/home/home_contract.dart';
import 'package:flutter_mvp/repository/get_contacts_contract.dart';

class HomePresenter {

  HomeContract _view;

  ContactsRepository _repository;

  HomePresenter(this._view) {
    _repository = new Injector().contactRepository;
  }

  void loadContacts() {
    assert(_view != null);

    _repository
        .fetchContacts()
        .then((contacts) => _view.showContactList(contacts))
        .catchError((onError) {
      print(onError);
      _view.showError();
    });
  }
}
