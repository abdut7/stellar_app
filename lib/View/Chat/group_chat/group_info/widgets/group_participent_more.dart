import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4.0,
                  width: Get.width * 0.5,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 51, 142, 0.5),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  messageCallback.call();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Message User',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 51, 142, 1),
                      fontFamily: 'Inter',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  viewUserCallback.call();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'View User',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 51, 142, 1),
                      fontFamily: 'Inter',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  makeGroupAdminCallback.call();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    isAdmin ? "Remove Admin" : 'Make Group Admin',
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 51, 142, 1),
                      fontFamily: 'Inter',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  removeUserCallback.call();
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Remove User',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 51, 142, 1),
                      fontFamily: 'Inter',
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
