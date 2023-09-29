import 'package:base_project/services/api_services/account_services.dart';
import 'package:flutter/material.dart';

showBlockAndReportBottomSheet(BuildContext context, String id) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.block),
            title: Text('Block User'),
            onTap: () async {
              await AccountServices.blockUser(id);
              Navigator.of(context).pop(); // Close the bottom sheet
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Report User'),
            onTap: () async {
              // Perform report user action here
              await AccountServices.unBlockUser(id);
              Navigator.of(context).pop(); // Close the bottom sheet
            },
          ),
        ],
      );
    },
  );
}
