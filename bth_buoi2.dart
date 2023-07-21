import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final int dpi;
  final bool hasLED;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.dpi,
    required this.hasLED,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Chuột DareU',
      description: 'Chi tiết sản phẩm',
      imageUrl:
      'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/g/r/group_155_2.png',
      price: 500000,
      dpi: 1600,
      hasLED: true,
    ),
    Product(
      id: 2,
      name: 'Chuột LANGTU G509',
      description: 'Chi tiết sản phẩm',
      imageUrl:
      'https://salt.tikicdn.com/ts/tmp/21/d6/e0/b044b5eefc99ec5e548e15318bd790f7.png',
      price: 350000,
      dpi: 2400,
      hasLED: false,
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: ${product.price} VND'),
            leading: Image.network(
              product.imageUrl,
              width: 100,
              height: 100,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imageUrl,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Product Name: ${product.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${product.price} VND',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'DPI: ${product.dpi}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Has LED: ${product.hasLED ? "Yes" : "No"}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}
