import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    required this.onPressedSearch,
    required this.onPressedIconFavorite,
    this.onChanged, required this.myController,
  });
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final Function(String)? onChanged;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Expanded(
          child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
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
              icon: const Icon(Icons.favorite,
                  size: 30, color: AppColor.primaryColor),
              onPressed: onPressedIconFavorite)),
    ]));
  }
}
