import '../models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    // Simulating network call or database fetch
    return [
      Product(
        id: '1',
        name: 'Design Ebook',
        description: 'Ultimate Guide to Digital Design',
        price: 19.99,
        imageUrl: 'assets/ebook.png',
        downloadLink: 'https://example.com/download/design-ebook',
      ),
      Product(
        id: '2',
        name: 'Photography Course',
        description: 'Professional Photography Masterclass',
        price: 49.99,
        imageUrl: 'assets/photography.png',
        downloadLink: 'https://example.com/download/photo-course',
      ),
    ];
  }

  Future<Product?> getProductById(String id) async {
    final products = await getProducts();
    return products.firstWhere((product) => product.id == id);
  }
}
