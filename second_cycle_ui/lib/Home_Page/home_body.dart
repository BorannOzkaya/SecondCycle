import 'package:flutter/material.dart';

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
      await Future.delayed(Duration(milliseconds: 500));
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text("Sample Text"),
          SizedBox(height: 10),
          Text(
            "Ürün Listesi",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
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
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(displayedProducts[index]["name"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
