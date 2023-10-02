import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/widgets/appbarContainer.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/FavoritesScreen';
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: SafeArea(
        child: Column(
          children: [
            AppBarContainer(labelText: 'Favorites'),
            Expanded(
              child: gridViewFavorites(),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridViewFavorites() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: List.generate(21, (index) {
        return Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 58,
              height: 58,
              decoration: ShapeDecoration(
                color: SColors.color14,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
