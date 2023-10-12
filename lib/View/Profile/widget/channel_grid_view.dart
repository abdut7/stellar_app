import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class ChannelGridView extends StatefulWidget {
  final IconData? icon;
  final String id;

  ChannelGridView({this.icon, required this.id});

  @override
  _ChannelGridViewState createState() => _ChannelGridViewState();
}

class _ChannelGridViewState extends State<ChannelGridView> {
  @override
  void initState() {
    // FliqServices().getFlicksById(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                child: widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: Colors.grey.withOpacity(0.7),
                        size: 40,
                      )
                    : null,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: SColors.color9.withOpacity(0.4),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
