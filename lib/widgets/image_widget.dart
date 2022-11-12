import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String country;
  const ImageWidget({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Image.network(
          width: double.infinity,
          country,
          fit: BoxFit.contain,
        ),
      ),

    );
  }
}
