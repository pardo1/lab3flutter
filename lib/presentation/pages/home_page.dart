import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blah2/presentation/controllers/app_controller.dart';
import 'package:blah2/presentation/widgets/address_widget.dart';
import 'package:blah2/presentation/widgets/category_button.dart';
import 'package:blah2/presentation/widgets/decorated_icon_button.dart';
import 'package:blah2/presentation/widgets/image_container.dart';
import 'package:blah2/presentation/widgets/wine_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Address(
                    location: 'Donnerville Drive',
                    address:
                    "4 Donnerville Hall, Donnerville Drive, Admaston...",
                  ),
                  DecoratedIconButton(
                    icon: Icons.notifications_outlined,
                    size: 50,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchBar(
                leading: const Icon(Icons.search),
                trailing: [
                  const VerticalDivider(
                    width: 10,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.mic_outlined)),
                ],
                hintText: 'Search',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Shop wines by',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Obx(() {
                  return ListView.builder( // Make sure to return this widget
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.winesByList.length,
                    itemBuilder: (context, index) {
                      final category = controller.winesByList[index]; // Access the current category

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CategoryButton(
                          name: category.name, // Display the category name
                          onTap: () {
                            // Logic for button tap
                            print('Category ${category.name} selected');
                          },
                          isSelected: index == 0, // Selection logic
                        ),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 200,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.wineList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ImageContainer(
                          image: (controller.wineList[index].type == "White")
                              ? "assets/images/white-wine.png"
                              : "assets/images/red-wine.png",
                          title: "${controller.wineList[index].type} wine", // Use the correct field for title
                        ),
                      );
                    },
                  );
                }),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wines',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('see all'))
                ],
              ),
              SizedBox(
                height: 400,
                child: Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.wineList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: WineCard(wine: controller.wineList[index]),
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}