import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/hive/models/contact.dart';

class ContactDetailsViewModel extends BaseViewModel {
  Contact? _contact;

  Contact? get contact => _contact;

  List<String> groups = [
    'Select Group',
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 4',
    'Group 6',
  ];

  String groupSelected = 'Selected Group';
  TextEditingController notesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  void getContactFromExtra(Object? extra) {
    if (extra is Map<String, dynamic> && extra.containsKey('contact')) {
      _contact = extra['contact'] as Contact?;

      groupSelected = _contact!.groups;
      notesController.text = _contact!.notes;
      emailController.text = _contact!.email;
      lastNameController.text = _contact!.lastName;
      nickNameController.text = _contact!.nickName;
      firstNameController.text = _contact!.firstName;
      phoneNumberController.text = _contact!.phoneNo;
      relationshipController.text = _contact!.relationship;

      notifyListeners();
    }
  }

  Future<void> updateContactById(String uid, BuildContext context) async {
    try {
      final contactsBox = await Hive.openBox<Contact>('contacts');
      final contact =
          contactsBox.values.firstWhere((contact) => contact.id == uid);

      contact.groups = groupSelected;
      contact.email = emailController.text;
      contact.firstName = firstNameController.text;
      contact.lastName = lastNameController.text;
      contact.phoneNo = phoneNumberController.text;
      contact.nickName = nickNameController.text;
      contact.notes = notesController.text;
      contact.relationship = relationshipController.text;

      await contact.save();
      GoRouter.of(context).pop();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteContact(String contactId, BuildContext context) async {
    try {
      final contactsBox = await Hive.openBox<Contact>('contacts');
      final contact =
          contactsBox.values.firstWhere((contact) => contact.id == contactId);

      await contact.delete();
      GoRouter.of(context).pop();
    } catch (e) {
      print('Error: $e');
    }
  }
}
