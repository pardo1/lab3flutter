import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Function() onTap;
  const CategoryButton(
      {super.key,
      required this.name,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
