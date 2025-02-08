import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getNetworkImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => Center(
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => Center(
      child: Icon(Icons.error, color: Colors.red, size: 40),
    ),
    fit: BoxFit.cover,
    width: 200 // Ensures the image covers the widget properly
  );
}
