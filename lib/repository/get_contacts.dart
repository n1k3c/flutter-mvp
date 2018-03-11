import 'dart:async';
import 'dart:convert';
import 'package:flutter_mvp/model/contact.dart';
import 'package:flutter_mvp/repository/get_contacts_contract.dart';
import 'package:flutter_mvp/util/fetch_data_exception.dart';
import 'package:http/http.dart' as http;


class GetContactsRepository implements ContactsRepository {

  static const url = 'http://api.randomuser.me/?results=15';

  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<Contact>> fetchContacts(){
    return http
        .get(url)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

      if(statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
      }

      final contactsContainer = _decoder.convert(jsonBody);
      final List contactItems = contactsContainer['results'];

      return contactItems.map((contactRaw) => new Contact.fromMap(contactRaw))
          .toList();
    });
  }
}