import 'product.dart';
class Client {
  int id;
  String name;
  String phoneNumber;
  List<Product> products = new List();
  Client({this.id, this.name, this.phoneNumber});
  void AddProduct(Product product) {
    this.products.add(product);
  }
  void PrintProduct() {
    products.forEach((product) { print(product.name);});
  }
}