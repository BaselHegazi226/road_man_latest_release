import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import 'custom_edit_profile_name_field.dart';
import 'edit_profile_email_item.dart';

class EditProfileNamesFieldsSection extends StatefulWidget {
  const EditProfileNamesFieldsSection({
    super.key,
    required this.nameEditingController,
    required this.email,
  });
  final TextEditingController nameEditingController;
  final String email;
  @override
  State<EditProfileNamesFieldsSection> createState() =>
      _EditProfileNamesFieldsSectionState();
}

class _EditProfileNamesFieldsSectionState
    extends State<EditProfileNamesFieldsSection> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEditProfileNameField(
          textEditingController: widget.nameEditingController,
          prefixIcon: Icons.person_outline_outlined,
          underlineColor: Colors.transparent,
          fullColor: kEditProfileContainer1Color,
          shadowColor: Colors.grey.withAlpha(127),
          labelText: 'Full Name',
          textLetterSpacing: .96,
          validator: (name) {
            String? trimmedValue = name?.trim();
            if (trimmedValue == null || trimmedValue.isEmpty) {
              return 'Please enter a name';
            }
            if (trimmedValue.length < 8) {
              return 'Enter at least 8 letters';
            }
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedValue)) {
              return 'Enter a valid name (letters only)';
            }
            return null;
          },
        ),
        SizedBox(height: screenHeight * .03),
        EditProfileEmailItem(hintText: 'hintText', email: widget.email),
      ],
    );
  }
}
