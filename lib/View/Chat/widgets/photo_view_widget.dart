import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imageUrl;
  const PhotoViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      disableGestures: true,
      backgroundDecoration: BoxDecoration(
        color: Colors.black,
      ),
      imageProvider: CachedNetworkImageProvider(
          imageUrl), // Load and cache the network image
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 2,
      enableRotation: true,
      heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
    );
  }
}
