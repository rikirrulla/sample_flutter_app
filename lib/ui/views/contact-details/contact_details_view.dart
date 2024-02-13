import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'contact_details_viewmodel.dart';
import '../../widgets/custom/button.dart';
import '../../widgets/custom/dropdown.dart';
import '../../widgets/custom/text_field.dart';
import '../../widgets/texts/plus_jakarta_sans.dart';

class ContactDetailsView extends StackedView<ContactDetailsViewModel> {
  const ContactDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const PlusJakartaSans.semiBold('Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.persianGreen,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: PlusJakartaSans.black(
                      viewModel.contact!.firstName.isNotEmpty
                          ? viewModel.contact!.firstName.substring(0, 1)
                          : 'X',
                      color: AppColors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall,
              Center(
                child: PlusJakartaSans.semiBold(
                  '${viewModel.contact!.firstName} ${viewModel.contact!.lastName}',
                ),
              ),
              verticalSpaceMedium,
              ContactTextField(
                controller: viewModel.firstNameController,
                overText: 'First Name',
                hintText: 'First Name',
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.lastNameController,
                overText: 'Last Name',
                hintText: 'Last Name',
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.phoneNumberController,
                overText: 'Phone No.',
                hintText: 'Phone No.',
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.nickNameController,
                hintText: 'Nick Name',
                overText: 'Nick Name',
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.emailController,
                overText: 'Email',
                hintText: 'Email',
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.relationshipController,
                overText: 'Relationship',
                hintText: 'Relationship',
              ),
              verticalSpaceSmall,
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: PlusJakartaSans(
                  'Groups',
                  size: 14,
                ),
              ),
              ContactDropDown(
                value: viewModel.groupSelected,
                mandatory: 'Groups',
                options: viewModel.groups,
                color: AppColors.kcDarkGreyColor,
                onChanged: (value) {
                  if (value != 'Select Group' && value.isNotEmpty) {
                    HapticFeedback.selectionClick();
                    viewModel.groupSelected = value;
                    viewModel.notifyListeners();
                  }
                },
              ),
              verticalSpaceSmall,
              ContactTextField(
                controller: viewModel.notesController,
                overText: 'Notes',
                hintText: 'Notes',
              ),
              verticalSpaceMedium,
              ContactTextField(
                controller: viewModel.relationshipController,
                overText: 'Relationship',
                hintText: 'Relationship',
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 40,
                          color: AppColors.sunsetOrange,
                        ),
                        onPressed: () => viewModel.deleteContact(
                          viewModel.contact!.id,
                          context,
                        ),
                      ),
                      const PlusJakartaSans(
                        'Delete',
                        size: 12,
                      ),
                    ],
                  ),
                  horizontalSpaceMedium,
                  Expanded(
                    child: ContactButton(
                      onPressed: () => viewModel.updateContactById(
                        viewModel.contact!.id,
                        context,
                      ),
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactDetailsViewModel()
        ..getContactFromExtra(GoRouterState.of(context).extra);
}
