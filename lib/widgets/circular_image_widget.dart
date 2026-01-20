import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final ImageProvider imageProvider;
  final double heigth;
  final double width;

  const CircularImageWidget({
    super.key,
    required this.imageProvider,
    this.width = 300,
    this.heigth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 5.0),
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
