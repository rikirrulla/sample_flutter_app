import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:contact_app/ui/common/app_colors.dart';
import 'package:contact_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';
import '../../widgets/custom/text_field.dart';
import '../../widgets/global/contact_card.dart';
import '../../widgets/texts/plus_jakarta_sans.dart';

typedef UpdateHomeViewCallback = void Function();

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getContacts();
      },
      builder: (context, viewModel, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  verticalSpaceLarge,
                  verticalSpaceSmall,
                  GestureDetector(
                    onTap: () => viewModel.addContactBS(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.persianGreen.withOpacity(0.4),
                      ),
                      child: const PlusJakartaSans.medium(
                        'Create New Contact',
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ContactTextField(
                      hintText: 'Search Contacts',
                      onChanged: viewModel.onSearch,
                    ),
                  ),
                  verticalSpaceMedium,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: PlusJakartaSans.medium(
                        'All Contacts',
                        size: 15,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: viewModel.filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = viewModel.filteredContacts[index];
                        return ContactCard(
                          contact: contact,
                          onTap: () {
                            GoRouter.of(context).push(
                              '/contact-details',
                              extra: {
                                'contact': contact,
                              },
                            ).then((_) {
                              viewModel.updateContacts();
                            });
                          },
                        );
                      },
                    ),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
