import 'package:flutter/material.dart';
import 'package:second_cycle_ui/constants.dart';

import 'category.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<Map> allProducts =
      List.generate(100, (index) => {"id": index, "name": "Product $index"})
          .toList();
  List<Map> displayedProducts = [];
  int itemCount = 20;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadMoreItems();
    searchController.addListener(() {
      filterProducts(searchController.text);
    });
  }

  Future<void> loadMoreItems() async {
    if (itemCount < allProducts.length) {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        itemCount = itemCount + 20 < allProducts.length
            ? itemCount + 20
            : allProducts.length;
        displayedProducts = allProducts.sublist(0, itemCount);
      });
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedProducts = allProducts.sublist(0, itemCount);
      });
    } else {
      setState(() {
        displayedProducts = allProducts
            .where((product) => product["name"]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search for products...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kategorilere Göz At",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tümünü Gör",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryWidget(icon: Icons.car_crash, title: 'Araba'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Teknoloji'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Mobilya'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Kategori 4'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Kategori 5'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Kategori 6'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Kategori 7'),
                SizedBox(width: 12),
                CategoryWidget(icon: Icons.abc, title: 'Kategori 8'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Tüm İlanlar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _gridviewWidget(),
        ],
      ),
    );
  }

  Card AdCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Özel Teklif",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              "https://statics.olx.com.tr/olxtr/autos/light/v1/letgo-buy-banner-desktop_2560.png",
              width: 350,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              "Sadece Bugün İndirimli Fırsatları Kaçırmayın!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Reklama tıklama işlemleri burada yapılabilir
              },
              child: const Text("Detayları Gör"),
            ),
          ],
        ),
      ),
    );
  }

  _gridviewWidget() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.7 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: displayedProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          if (index == itemCount - 1) {
            loadMoreItems();
          }
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: pastel_yesil,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Image.asset(
                  "assets/images/product.png", // Ürün görselinin yolunu eklemelisiniz
                  width: 200,
                  height: 90,
                ),
                const SizedBox(height: 10), // Fiyat ve konum arasındaki boşluk
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "TL 120",
                        //\$${displayedProducts[index]["price"].toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 10), // İsim ve alt bileşenler arasındaki boşluk
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        displayedProducts[index]["name"],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Bursa/Turkey",
                      //displayedProducts[index]["location"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
