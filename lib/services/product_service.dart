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
      Product(
        id: '3',
        name: 'UI/UX Masterclass',
        description: 'Comprehensive guide to UI/UX design.',
        price: 39.99,
        imageUrl: 'assets/uiux.png',
        downloadLink: 'https://example.com/download/uiux-masterclass',
      ),
      Product(
        id: '4',
        name: 'Coding Bootcamp',
        description: 'Full-stack development course for beginners.',
        price: 59.99,
        imageUrl: 'assets/coding.png',
        downloadLink: 'https://example.com/download/coding-bootcamp',
      ),
      Product(
        id: '5',
        name: 'Digital Marketing Guide',
        description: 'Learn strategies for effective digital marketing.',
        price: 29.99,
        imageUrl: 'assets/marketing.png',
        downloadLink: 'https://example.com/download/marketing-guide',
      ),
      Product(
        id: '6',
        name: '3D Modeling Basics',
        description: 'Step-by-step guide to 3D modeling and rendering.',
        price: 34.99,
        imageUrl: 'assets/3dmodeling.png',
        downloadLink: 'https://example.com/download/3d-modeling-basics',
      ),
      Product(
        id: '7',
        name: 'Illustration Techniques',
        description: 'Master the art of digital illustration.',
        price: 24.99,
        imageUrl: 'assets/illustration.png',
        downloadLink: 'https://example.com/download/illustration-techniques',
      ),
      Product(
        id: '8',
        name: 'Mobile App Development',
        description: 'Build your first mobile app with this guide.',
        price: 54.99,
        imageUrl: 'assets/mobile-dev.png',
        downloadLink: 'https://example.com/download/mobile-app-development',
      ),
      Product(
        id: '9',
        name: 'Game Development Basics',
        description: 'Create your first game with this beginner course.',
        price: 49.99,
        imageUrl: 'assets/game-dev.png',
        downloadLink: 'https://example.com/download/game-development-basics',
      ),
    ];
  }

  Future<Product?> getProductById(String id) async {
    final products = await getProducts();
    return products.firstWhere((product) => product.id == id);
  }
}
