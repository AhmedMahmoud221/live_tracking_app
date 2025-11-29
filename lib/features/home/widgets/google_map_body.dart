import 'package:flutter/material.dart';

class GoogleMapBody extends StatelessWidget {
  const GoogleMapBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text('Google Map Body'),
      ),
    );
  }
}