import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blah2/data/models/wine_model.dart';
import 'package:blah2/presentation/widgets/favourite_button.dart';

class WineCard extends StatelessWidget {
  final WineModel wine;
  bool isAvailable;
  bool isFavourite;

  WineCard({super.key, required this.wine,this.isAvailable = true , this.isFavourite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 182,
                    decoration: const BoxDecoration(
                      border: Border(),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        wine.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: isAvailable
                                  ? const Color.fromARGB(190, 139, 195, 74)
                                  : const Color.fromARGB(189, 195, 74, 74),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              isAvailable ? "Available" : "Unavailable",
                              style: TextStyle(
                                color: isAvailable
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          wine.name,
                          maxLines: 4,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/wine.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${wine.type} wine",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "(${wine.type})",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [

                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "From ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "${wine.country}, ${wine.city}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 222, 221, 221),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FavouriteButton(
                        isSelected: isFavourite,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("Critics' Score: ${wine.criticScore}/100"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "\$ ${wine.price}",
                        style: const TextStyle(
                          fontSize: 20,
                          height: 0.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        wine.bottleSize,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 113, 113, 113),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}