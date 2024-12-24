import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/app_widgets/product_card.dart';
import 'package:shopping_app/app_pages/product_details.dart';
import 'package:shopping_app/global_variables.dart';


class ProductList extends StatefulWidget {
   const ProductList({super.key});
  

  @override
  State<ProductList> createState() => _ProductListState();

}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Flex', 'Flocks', 'Glitters', 'Printables'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(225, 225, 225, 1),
                            ),
                        );

    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'HTV\nCollection',
                        style: Theme.of(context).textTheme.titleLarge,
                        ),
                    ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                        ),
                      ),
                  ],
                ),
                 SizedBox(
                  height: 120,
                   child: ListView.builder(
                          itemCount: filters.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final filter = filters[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0
                                ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                     selectedFilter = filter;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedFilter == filter 
                                  ? Theme.of(context).colorScheme.primary
                                  : Color.fromRGBO(245, 247, 249, 1),
                                  side: BorderSide(
                                    color: Color.fromRGBO(245, 247, 249, 1),
                                  ),
                                  label: Text(filter),
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                              ),
                            );
                          },
                          ),
                 ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final isSmallScreen = constraints.maxHeight < 600;

                    return isSmallScreen 
                    ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: products.length,
                      itemBuilder:(context, index) {
                        final product = products[index];
                       return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: 
                            (context) {
                              return ProductDetails(product: product);
                          },
                          ),
                          );
                        },
                         child: ProductCard(
                          title: product['title'] as String,
                          price: product['price']as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                          ? Color.fromRGBO(224, 147, 224, 1) 
                          : Color.fromRGBO(245, 247, 249, 1),
                          ),
                       );
                     },
                     )
                     : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ), 
                      itemCount: products.length,
                      itemBuilder:(context, index) {
                        final product = products[index];
                       return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: 
                            (context) {
                              return ProductDetails(product: product);
                          },
                          ),
                          );
                        },
                         child: ProductCard(
                          title: product['title'] as String,
                          price: product['price']as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                          ? Color.fromRGBO(224, 147, 224, 1) 
                          : Color.fromRGBO(245, 247, 249, 1),
                          ),
                       );
                     },
                     ) ;
                  }
                  )
                ),
              ],
            ),
      ),
    );
  }
}