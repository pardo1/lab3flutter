import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String title;
  final String image;
  const ImageContainer({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: 150,
          height: 175,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                width: 150,
                height: 130,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(title),
              ),
            ],
          ),
        ),
        Container(
          width: 37,
          height: 24,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: Color.fromARGB(255, 104, 25, 19)),
          child: const Center(
            child: Text(
              '143',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
