import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    required this.onPressedIcon,required this.onPressedSearch,
  });
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Expanded(
          child: TextFormField(
              decoration: InputDecoration(
        prefixIcon:
            IconButton(onPressed: onPressedSearch, icon: const Icon(Icons.search)),
        hintText: titleappbar,
        hintStyle: const TextStyle(fontSize: 15),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[200],
      ))),
      const SizedBox(
        width: 10,
      ),
      Container(
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: IconButton(
              icon: Icon(Icons.notifications_active_outlined,
                  size: 30, color: Colors.grey[600]),
              onPressed: onPressedIcon)),
    ]));
  }
}
