class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
}


final List<Product> products = [
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 149.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 1',
  ),
  const Product(
    name: 'Laptop',
    category: 'Electronics',
    price: 100.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is a description of the product 2',
  ),
  const Product(
    name: 'Jordan',
    category: 'Footwear',
    price: 59.00,
    oldPrice: 185.00,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is a description of the product 3',
  ),
  const Product(
    name: 'Puma',
    category: 'Footwear',
    price: 65.00,
    oldPrice: 160.00,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is a description of the product 4',
  ),
  const Product(
    name: 'Adidas',
    category: 'Shirt',
    price: 45.00,
    oldPrice: 155.00,
    imageUrl: 'assets/images/adidasshirt.jpeg',
    description: 'This is a description of the product 4',
  ),
  const Product(
    name: 'Street Wear',
    category: 'Trouser',
    price: 60.00,
    oldPrice: 179.00,
    imageUrl: 'assets/images/street-wear.jpeg',
    description: 'This is a description of the product 4',
  ),
  const Product(
    name: 'Street-Shoes',
    category: 'Footwear',
    price: 78.00,
    oldPrice: 180.00,
    imageUrl: 'assets/images/shoe1.png',
    description: 'This is a description of the product 3',
  ),
  // const Product(
  //   name: 'Designer shoe 1',
  //   category: 'Footwear',
  //   price: 69.00,
  //   oldPrice: 189.00,
  //   imageUrl: 'assets/images/shoe2.png',
  //   description: 'This is a description of the product 3',
  // ),const Product(
  //   name: 'Designer shoe 2',
  //   category: 'Footwear',
  //   price: 69.00,
  //   oldPrice: 189.00,
  //   imageUrl: 'assets/images/shoe3.png',
  //   description: 'This is a description of the product 3',
  // ),const Product(
  //   name: 'Designer shoe 3',
  //   category: 'Footwear',
  //   price: 69.00,
  //   oldPrice: 189.00,
  //   imageUrl: 'assets/images/shoe4.png',
  //   description: 'This is a description of the product 3',
  // ),const Product(
  //   name: 'Designer shoe 4',
  //   category: 'Footwear',
  //   price: 69.00,
  //   oldPrice: 189.00,
  //   imageUrl: 'assets/images/shoe5.png',
  //   description: 'This is a description of the product 3',
  // ),
  // const Product(
  //   name: 'Designer shoe 5',
  //   category: 'Footwear',
  //   price: 69.00,
  //   oldPrice: 189.00,
  //   imageUrl: 'assets/images/shoe6.png',
  //   description: 'This is a description of the product 3',
  // ),


];
