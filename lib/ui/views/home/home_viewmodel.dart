import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../../app/app.locator.dart';
import '../../widgets/custom/button.dart';
import '../../widgets/custom/dropdown.dart';
import '../../widgets/custom/text_field.dart';
import '../../../app/hive/models/contact.dart';
import '../../widgets/texts/plus_jakarta_sans.dart';
import '../../../app/hive/services/contact_service.dart';

class HomeViewModel extends BaseViewModel {
  final bottomSheetService = locator<BottomSheetService>();
  final ContactService contactService = ContactService();

  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  Future<void> getContacts() async {
    try {
      contacts = await contactService.getContacts();
      filteredContacts = List.from(contacts);
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  void updateContacts() {
    getContacts();
  }

  void addContactBS(BuildContext context) {
    TextEditingController notesController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController nickNameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController relationshipController = TextEditingController();

    String selectedGroup = 'Select Group';
    List<String> groups = [
      'Select Group',
      'Group 1',
      'Group 2',
      'Group 3',
      'Group 4',
      'Group 6',
    ];

    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  verticalSpaceMedium,
                  const PlusJakartaSans.medium(
                    'Add Contact',
                  ),
                  verticalSpaceMedium,
                  ContactTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone No.',
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: nickNameController,
                    hintText: 'Nick Name',
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  verticalSpaceSmall,
                  ContactDropDown(
                    value: selectedGroup,
                    mandatory: 'Groups',
                    options: groups,
                    color: AppColors.kcDarkGreyColor,
                    onChanged: (value) {
                      if (value != 'Select Group' && value.isNotEmpty) {
                        HapticFeedback.selectionClick();
                        setState(() {
                          selectedGroup = value;
                        });
                      }
                    },
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: notesController,
                    hintText: 'Notes',
                  ),
                  verticalSpaceSmall,
                  ContactTextField(
                    controller: relationshipController,
                    hintText: 'Relationship',
                  ),
                  verticalSpaceMedium,
                  ContactButton(
                    onPressed: () async {
                      try {
                        var uuid = const Uuid();
                        String id = uuid.v4();
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        String phoneNumber = phoneNumberController.text;
                        String nickName = nickNameController.text;
                        String email = emailController.text;
                        String notes = notesController.text;
                        String relationship = relationshipController.text;

                        Contact newContact = Contact()
                          ..id = id
                          ..firstName = firstName
                          ..lastName = lastName
                          ..phoneNo = phoneNumber
                          ..nickName = nickName
                          ..email = email
                          ..notes = notes
                          ..relationship = relationship
                          ..groups = selectedGroup;

                        var contactsBox =
                            await Hive.openBox<Contact>('contacts');

                        await contactsBox.add(newContact);

                        getContacts();
                        notifyListeners();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Contact saved successfully!'),
                        ));

                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    text: 'Save',
                  ),
                ],
              ),
            );
          });
        });
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      filteredContacts = contacts;
    } else {
      filteredContacts = contacts
          .where((contact) =>
              contact.firstName.toLowerCase().contains(value.toLowerCase()) ||
              contact.lastName.toLowerCase().contains(value.toLowerCase()) ||
              contact.phoneNo.contains(value) ||
              contact.nickName.toLowerCase().contains(value.toLowerCase()) ||
              contact.email.toLowerCase().contains(value.toLowerCase()) ||
              contact.notes.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
