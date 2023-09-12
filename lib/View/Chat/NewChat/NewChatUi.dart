import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Chat/HomeChat/HomeChatUi.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatUi extends StatefulWidget {
  static const routeName = '/NewChatUi';
  const NewChatUi({Key? key}) : super(key: key);

  @override
  State<NewChatUi> createState() => _NewChatUiState();
}

class _NewChatUiState extends State<NewChatUi> {
  List<bool> _selectedValues = [false, false, false, false, false];

  void _handleCheckboxValueChange(int index, bool value) {
    setState(() {
      _selectedValues[index] = value;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'NEW CHAT',
        style: TextStyle(
          color: SColors.color3,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.cancel,color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildTitleAndButton(String text, Function() onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w500,),),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 15),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 83,
      decoration: BoxDecoration(color: SColors.color13),
      child: Stack(
        children: [
          Positioned(
            top: 26, right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeChatUi.routeName);
              },
              child: Text('DONE', style: TextStyle(color: SColors.color4)),
              style: ElevatedButton.styleFrom(
                backgroundColor: SColors.color12,
                foregroundColor: SColors.color4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRow(int index, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: _selectedValues[index],
            onChanged: (value) {
              _handleCheckboxValueChange(index, value!);
            },
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: SColors.color14,
            child: SvgPicture.asset(SSvgs.sv06),
          ),
          const SizedBox(width: 15),
          Text(
            labelText, style: TextStyle(
              color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          const SearchTextField(),
          const SizedBox(height: 20),
          _buildTitleAndButton('SELECT ONE OR MORE CONTACTS', () {}),
          _buildTitleAndButton('JOIN PRIVATE GROUP', () {}),
          const SizedBox(height: 30),
          _buildCustomRow(0, 'RAJMOHAN CHOZHIATH'),
          const SizedBox(height: 15),
          _buildCustomRow(1, 'DULQUER SALMAN'),
          const SizedBox(height: 15),
          _buildCustomRow(2, 'ROY MATHEW'),
          const SizedBox(height: 15),
          _buildCustomRow(3, 'OSAMA ABUHMEIDAN'),
          const SizedBox(height: 15),
          _buildCustomRow(4, 'AMITHAB BACHCHAN'),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }
}
