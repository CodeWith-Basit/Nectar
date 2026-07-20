class Module {
  final String title;
  final String img;
  final double price;
  int count;
  bool isFav;

  Module({
    required this.title,
    required this.img,
    required this.price,
    required this.count,
    this.isFav = false,
  });
}

List<Module> cart = [];
List<Module> favItems = [];

double getTotalprice() {
  double total = 0;
  for (var item in cart) {
    total += item.price * item.count;
  }
  return total;
}
