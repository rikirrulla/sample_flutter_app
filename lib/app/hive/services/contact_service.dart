import 'package:hive/hive.dart';

import '../models/contact.dart';

class ContactService {
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    var contactsBox = await Hive.openBox<Contact>('contacts');

    contacts = contactsBox.values.toList();
    return contacts;
  }
}
