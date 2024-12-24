import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({super.key,  required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedColour = '';

  void onTap() {
    if (selectedColour != '') {
      Provider.of<CartProvider>(context, listen: false)
         .addProduct(
          {
  'id' : widget.product['id'],
  'title' : widget.product['title'],
  'price' : widget.product['price'],
  'colour' : selectedColour,
  'imageUrl' : widget.product['imageUrl'],
  'length' : widget.product['length'],
  }
         );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar
      (content: Text('Product added Successfully!'),
      ),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar
      (content: Text('Please select a colour'),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Image.asset(widget.product['imageUrl'] as String,
          height: 250,
          ),
          Spacer(flex: 2),
          Container(
            height: 209,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Column(
                children: [
                  Text('#${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['colours'] as List<String>).length,
                      itemBuilder: (context, index) {
                        final amountOfColors = (widget.product['colours'] as List<String>)[index];
                    
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColour = amountOfColors;
                              });
                            },
                            child: Chip(
                              label: Text(amountOfColors.toString()),
                              backgroundColor: selectedColour == amountOfColors
                              ? Theme.of(context).colorScheme.primary 
                              : null,
                            ),
                          ),
                        );
                      }
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: Size(350, 50),
                      ),
                      icon: Icon(Icons.shopping_cart,
                       color:Colors.black),
                      label: Text('Add To Cart', 
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
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