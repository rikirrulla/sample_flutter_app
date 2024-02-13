import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String firstName;

  @HiveField(2)
  late String lastName;

  @HiveField(3)
  late String phoneNo;

  @HiveField(4)
  late String nickName;

  @HiveField(5)
  late String email;

  @HiveField(6)
  late String groups;

  @HiveField(7)
  late String notes;

  @HiveField(8)
  late String relationship;

  Contact({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNo = '',
    this.nickName = '',
    this.email = '',
    this.notes = '',
    this.groups = '',
    this.relationship = '',
  });
}
