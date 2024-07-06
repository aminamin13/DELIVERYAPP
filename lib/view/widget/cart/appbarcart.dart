import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
      
    );
  }
}
