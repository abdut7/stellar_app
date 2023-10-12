import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';
import 'package:stellar_chat/utils/colors.dart';

class FlickGridView extends StatefulWidget {
  final IconData? icon;
  final String id;

  FlickGridView({this.icon, required this.id});

  @override
  _FlickGridViewState createState() => _FlickGridViewState();
}

class _FlickGridViewState extends State<FlickGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FlickItem>?>(
        future: FliqServices().getFlicksById(id: widget.id),
        builder: (context, AsyncSnapshot<List<FlickItem>?> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return LinearProgressIndicator(
              color: colorPrimary,
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: SColors.color9.withOpacity(0.4),
                      ),
                      child: widget.icon != null
                          ? Icon(
                              widget.icon,
                              color: Colors.grey.withOpacity(0.7),
                              size: 40,
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
