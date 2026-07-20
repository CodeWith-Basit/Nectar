import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/screens/banner.dart';
import 'package:grocerry/screens/animation_screen.dart';
import 'package:grocerry/screens/module.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 35,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5),
                Text(
                  "Nector",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 600,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner_4.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Exclusive Offer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_1.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      final alreadyExists = cart.any(
                        (item) => item.title == 'Organic Bananas',
                      );

                      if (alreadyExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This item is already in the cart.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        setState(() {
                          cart.add(
                            Module(
                              title: 'Organic Bananas',
                              img: 'assets/images/product_1.png',
                              price: 4.99,
                              count: 1,
                            ),
                          );
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart successfully.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                  ProductCard(
                    title: 'Apple',
                    img: 'assets/images/product_2.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      final alreadyExists = cart.any(
                        (item) => item.title == 'Apple',
                      );

                      if (alreadyExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This item is already in the cart.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        setState(() {
                          cart.add(
                            Module(
                              title: 'Apple',
                              img: 'assets/images/product_2.png',
                              price: 4.99,
                              count: 1,
                            ),
                          );
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart successfully.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                  ProductCard(
                    title: 'Fresh Tomatos',
                    img: 'assets/images/product_3.png',
                    price: 7.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      final alreadyExists = cart.any(
                        (item) => item.title == 'Fresh Tomatos',
                      );

                      if (alreadyExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This item is already in the cart.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        setState(() {
                          cart.add(
                            Module(
                              title: 'Fresh Tomatos',
                              img: 'assets/images/product_3.png',
                              price: 7.99,
                              count: 1,
                            ),
                          );
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart successfully.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_4.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      final alreadyExists = cart.any(
                        (item) => item.title == 'Organic Bananas',
                      );

                      if (alreadyExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This item is already in the cart.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        setState(() {
                          cart.add(
                            Module(
                              title: 'Organic Bananas',
                              img: 'assets/images/product_4.png',
                              price: 4.99,
                              count: 1,
                            ),
                          );
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart successfully.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Best Selling',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    title: 'Beef Bone',
                    img: 'assets/images/product_5.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Animationscreen(),
                        ),
                      );
                    },
                  ),
                  ProductCard(
                    title: 'Tomatoes',
                    img: 'assets/images/product_3.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Animationscreen(),
                        ),
                      );
                    },
                  ),
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_3.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Animationscreen(),
                        ),
                      );
                    },
                  ),
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_4.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () {
                      final alreadyExists = cart.any(
                        (item) => item.title == 'Organic Bananas',
                      );

                      if (alreadyExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This item is already in the cart.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        setState(() {
                          cart.add(
                            Module(
                              title: 'Organic Bananas',
                              img: 'assets/images/product_4.png',
                              price: 4.99,
                              count: 1,
                            ),
                          );
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart successfully.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Groceries',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 120,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              items: [
                BannerWidget(
                  color: Color(0xFFF8A44C),
                  imgurl: 'assets/images/pulses.png',
                  text: "Pulses",
                ),
                BannerWidget(
                  color: Colors.tealAccent,
                  imgurl: 'assets/images/product_4.png',
                  text: "Vegetables",
                ),
                BannerWidget(
                  color: Color(0xffff4d6d),
                  imgurl: 'assets/images/product_5.png',
                  text: "Fresh Meet",
                ),
                BannerWidget(
                  color: const Color.fromARGB(255, 230, 220, 231),
                  imgurl: 'assets/images/fruits.jpg',
                  text: "Fresh Meet",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String img;
  final double price;
  final String unit;
  final VoidCallback onAddToCart;
  final VoidCallback? onFavoriteChanged;

  const ProductCard({
    super.key,
    required this.title,
    required this.img,
    required this.price,
    required this.unit,
    required this.onAddToCart,
    this.onFavoriteChanged,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favItems.any((item) => item.title == widget.title);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 250,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(widget.img, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                widget.unit,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      onPressed: widget.onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 26,
              ),
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    favItems.removeWhere((item) => item.title == widget.title);
                  } else {
                    favItems.add(
                      Module(
                        title: widget.title,
                        img: widget.img,
                        price: widget.price,
                        count: 1,
                        isFav: true,
                      ),
                    );
                  }
                });
                if (widget.onFavoriteChanged != null) {
                  widget.onFavoriteChanged!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
