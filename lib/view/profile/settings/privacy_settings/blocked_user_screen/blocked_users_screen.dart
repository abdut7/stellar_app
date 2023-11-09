import 'package:stellar_chat/models/api_models/blocked_user_model.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/utils/colors.dart';

class BlockedUsersScreen extends StatefulWidget {
  const BlockedUsersScreen({super.key});

  @override
  State<BlockedUsersScreen> createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: const Text("Blocked Users"),
      ),
      body: FutureBuilder(
        future: AccountServices.getBlockedUserList(),
        builder: (BuildContext context,
            AsyncSnapshot<List<BlockedUsers>?> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No blocked users"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showModalBottomSheet(
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
                              leading: const Icon(Icons.report),
                              title: const Text('Unblock User'),
                              onTap: () async {
                                // Perform report user action here
                                await AccountServices.unBlockUser(
                                    snapshot.data![index].strUserId);

                                // ignore: use_build_context_synchronously
                                Navigator.of(context)
                                    .pop(); // Close the bottom sheet
                                setState(() {});
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data![index].strProfileIcon),
                  ),
                  title: Text(
                    snapshot.data![index].strFullName,
                  ),
                  subtitle: Text(
                    snapshot.data![index].strMobileNo,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data!.length);
        },
      ),
    );
  }
}
