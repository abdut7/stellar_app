import 'package:flutter/material.dart';

void showParticipentsMoreBottomSheet(
  BuildContext context, {
  required bool isAdmin,
  required Function() messageCallback,
  required Function() viewUserCallback,
  required Function() makeGroupAdminCallback,
  required Function() removeUserCallback,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(159, 196, 232, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.0,
              width: 80.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            ListTile(
              title: const Text(
                'Message User',
                style: TextStyle(
                  color: Color.fromRGBO(0, 51, 142, 1),
                  fontFamily: 'Inter',
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.0,
                ),
              ),
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                messageCallback.call();
              },
            ),
            ListTile(
              title: const Text(
                'View User',
                style: TextStyle(
                  color: Color.fromRGBO(0, 51, 142, 1),
                  fontFamily: 'Inter',
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.0,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                viewUserCallback.call();
              },
            ),
            isAdmin
                ? const SizedBox()
                : ListTile(
                    title: const Text(
                      'Make Group Admin',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 51, 142, 1),
                        fontFamily: 'Inter',
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.0,
                      ),
                    ),
                    onTap: () {
                      makeGroupAdminCallback.call();
                      Navigator.pop(context);
                    },
                  ),
            ListTile(
              title: const Text(
                'Remove User',
                style: TextStyle(
                  color: Color.fromRGBO(0, 51, 142, 1),
                  fontFamily: 'Inter',
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.0,
                ),
              ),
              onTap: () {
                removeUserCallback.call();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
