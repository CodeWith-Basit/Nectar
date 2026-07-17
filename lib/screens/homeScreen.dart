import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/screens/banner.dart';
import 'package:grocerry/screens/animationScreen.dart';
import 'package:grocerry/screens/module.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int _currentPage = 0;
final int _totalPages = 3;

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
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_1.png'),
                        SizedBox(height: 20),
                        Text(
                          'Organic Bananas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            final alreadyExists = cart.any(
                              (item) => item.title == 'Organic Bananas',
                            );

                            if (alreadyExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'This item is already in the cart.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cart.add(
                                Module(
                                  title: 'Organic Bananas',
                                  img: 'assets/images/product_1.png',
                                  price: '\$4.99',
                                  count: 1,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Item added to cart successfully.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_2.png'),
                        SizedBox(height: 20),
                        Text(
                          'Apple',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            final alreadyExists = cart.any(
                              (item) => item.title == 'Apple',
                            );

                            if (alreadyExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'This item is already in the cart.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cart.add(
                                Module(
                                  title: 'Apple',
                                  img: 'assets/images/product_2.png',
                                  price: '\$4.99',
                                  count: 1,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Item added to cart successfully.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_3.png'),
                        SizedBox(height: 20),
                        Text(
                          'Fresh Tomatos',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$7.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            final alreadyExists = cart.any(
                              (item) => item.title == 'Fresh Tomatos',
                            );

                            if (alreadyExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'This item is already in the cart.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cart.add(
                                Module(
                                  title: 'Fresh Tomatos',
                                  img: 'assets/images/product_3.png',
                                  price: '\$7.99',
                                  count: 1,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Item added to cart successfully.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_4.png'),
                        SizedBox(height: 20),
                        Text(
                          'Garlic',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '3pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$2.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            final alreadyExists = cart.any(
                              (item) => item.title == 'Fresh Tomatos',
                            );

                            if (alreadyExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'This item is already in the cart.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cart.add(
                                Module(
                                  title: 'Garlic',
                                  img: 'assets/images/product_4.png',
                                  price: '\$2.99',
                                  count: 1,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Item added to cart successfully.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_5.png'),
                        SizedBox(height: 20),
                        Text(
                          'Beef Bone',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Animationscreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_3.png'),
                        SizedBox(height: 20),
                        Text(
                          'Tomatoes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Animationscreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_3.png'),
                        SizedBox(height: 20),
                        Text(
                          'Organic Bananas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Animationscreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset('assets/images/product_4.png'),
                        SizedBox(height: 20),
                        Text(
                          'Organic Bananas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7pcs, Priceg',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$4.99 Per lb',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                         ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            final alreadyExists = cart.any(
                              (item) => item.title == 'Organic Bananas',
                            );
                            if (alreadyExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'This item is already in the cart.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cart.add(
                                Module(
                                  title: 'Organic Bananas',
                                  img: 'assets/images/product_4.png',
                                  price: '\$4.99',
                                  count: 1,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Item added to cart successfully.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                autoPlay: true,
                viewportFraction: 0.5,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
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
