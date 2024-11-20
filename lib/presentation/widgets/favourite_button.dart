import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final bool isSelected;
  const FavouriteButton({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: isSelected ? Theme.of(context).primaryColor : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.favorite : Icons.favorite_outline,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              isSelected ? "Added" : "Favourite",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
