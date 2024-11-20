import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({super.key, required this.location, required this.address});
  final String location;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(
                width: 3,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          Text(
            address,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
