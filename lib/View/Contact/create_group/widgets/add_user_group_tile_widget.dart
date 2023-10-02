import 'package:flutter/material.dart';

import '../../../../models/api_models/get_contacts_model.dart';

class AddUserGroupTileWidget extends StatelessWidget {
  final bool isSelcted;
  const AddUserGroupTileWidget({
    super.key,
    required this.user,
    required this.isSelcted,
  });

  final Contact user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 8,
          backgroundColor: isSelcted ? Colors.blue : Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(user.strProfileUrl.isEmpty
              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
              : user.strProfileUrl),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(user.strFullName),
      ],
    );
  }
}
