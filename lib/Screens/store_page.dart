import 'package:ecommerce_task/Providers/stores.dart';
import 'package:ecommerce_task/Widgets/category_cards.dart';
import 'package:ecommerce_task/Widgets/home_titles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class StorePage extends StatelessWidget {
  static const routeName = '/store';
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String storeId =
        ModalRoute.of(context)!.settings.arguments.toString();
    final store = Provider.of<Stores>(context).findById(storeId);
    final sliderImages = store.coverImages;
    List<Widget> getImages() {
      List<Widget> images = List.generate(
        sliderImages.length,
        (index) => Image.asset(
          sliderImages[index],
          fit: BoxFit.cover,
        ),
      );
      return images;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          store.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {},
            autoPlayInterval: 3000,
            isLoop: true,
            children: getImages(),
          ),
          const Divider(
            thickness: 1,
          ),
          const HomePageTitle('Categories'),
          GridView.builder(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: store.categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: store.categories[index],
                storeId: store.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
