import 'package:flutter/material.dart';

import '../../../../models/api_models/get_contacts_model.dart';

class AddUserGroupTileWidget extends StatelessWidget {
  final bool isSelcted;
  const AddUserGroupTileWidget({
    super.key,
    required this.user,
    required this.isSelcted,
  });

  final RecievedPhoneUser user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: isSelcted ? Colors.blue : Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        const CircleAvatar(
          radius: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(user.strFullName)
      ],
    );
  }
}
