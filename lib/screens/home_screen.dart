import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/screens/account_screen.dart';
import 'package:grocerry/screens/cart_screen.dart';
import 'package:grocerry/screens/explore_screen.dart';
import 'package:grocerry/screens/favourite_screen.dart';
import 'package:grocerry/screens/loginScreen.dart';
import 'package:grocerry/screens/module.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
  }

  final List<Map<String, dynamic>> _categoryBubbles = [
    {
      'name': 'Fruits',
      'icon': Icons.apple_rounded,
      'color': const Color(0xFFFFEBEE),
      'accent': Colors.redAccent,
    },
    {
      'name': 'Veggies',
      'icon': Icons.eco_rounded,
      'color': const Color(0xFFE8F5E9),
      'accent': const Color(0xFF53B175),
    },
    {
      'name': 'Meat & Fish',
      'icon': Icons.set_meal_rounded,
      'color': const Color(0xFFFFF3E0),
      'accent': const Color(0xFFF18701),
    },
    {
      'name': 'Dairy',
      'icon': Icons.egg_rounded,
      'color': const Color(0xFFFFFDE7),
      'accent': Colors.amber,
    },
    {
      'name': 'Bakery',
      'icon': Icons.cookie_rounded,
      'color': const Color(0xFFF3E5F5),
      'accent': Colors.purpleAccent,
    },
    {
      'name': 'Drinks',
      'icon': Icons.local_drink_rounded,
      'color': const Color(0xFFE3F2FD),
      'accent': Colors.blueAccent,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addToCart(String title, String img, double price) {
    final alreadyExists = cart.any((item) => item.title == title);
    if (alreadyExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title is already in your cart.'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        cart.add(Module(title: title, img: img, price: price, count: 1));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title added to cart successfully!'),
          backgroundColor: const Color(0xFF53B175),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Color(0xFF181725),
              size: 26,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            const Text(
              "Nector",
              style: TextStyle(
                color: Color(0xFF181725),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF181725),
                  size: 26,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Cartscreen()),
                  ).then((_) => setState(() {}));
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF53B175),
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xFF53B175),
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Deliver to: Sector F-7, Islamabad',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Search Store or Products',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF181725),
                    ),
                    suffixIcon: ((_searchQuery ?? '').isNotEmpty)
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.92,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              items: [
                _buildPromoBanner(
                  title: 'Fresh Vegetables',
                  subtitle: 'Get Up To 40% OFF',
                  bgGradient: const [Color(0xFF53B175), Color(0xFF2E7D32)],
                  img: 'assets/images/vege.png',
                ),
                _buildPromoBanner(
                  title: 'Organic Pulses',
                  subtitle: '100% Farm Fresh Quality',
                  bgGradient: const [Color(0xFFF8A44C), Color(0xFFE65100)],
                  img: 'assets/images/pulses.png',
                ),
                _buildPromoBanner(
                  title: 'Fresh Meat Deals',
                  subtitle: 'Special Weekend Discount',
                  bgGradient: const [Color(0xFFFF4D6D), Color(0xFFC2185B)],
                  img: 'assets/images/product_5.png',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF181725),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Explorescreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF53B175),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _categoryBubbles.length,
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final cat = _categoryBubbles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Explorescreen(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: cat['color'],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: cat['accent'].withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Icon(
                            cat['icon'],
                            color: cat['accent'],
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cat['name'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF181725),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFFB74D)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.flash_on_rounded,
                      color: Color(0xFFF18701),
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Flash Sale Deals',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF181725),
                            ),
                          ),
                          Text(
                            'Special discounts ending soon!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF18701),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '04h 25m',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Exclusive Offer', () {}),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_1.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    badgeTag: '20% OFF',
                    badgeColor: Colors.redAccent,
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Organic Bananas',
                      'assets/images/product_1.png',
                      4.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Red Apple',
                    img: 'assets/images/product_2.png',
                    price: 4.99,
                    unit: '1kg, Priceg',
                    badgeTag: 'HOT',
                    badgeColor: const Color(0xFFF18701),
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Red Apple',
                      'assets/images/product_2.png',
                      4.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Fresh Tomatoes',
                    img: 'assets/images/product_3.png',
                    price: 7.99,
                    unit: '1kg, Priceg',
                    badgeTag: 'DEAL',
                    badgeColor: const Color(0xFF53B175),
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Fresh Tomatoes',
                      'assets/images/product_3.png',
                      7.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Ginger Pack',
                    img: 'assets/images/product_4.png',
                    price: 2.99,
                    unit: '250g, Priceg',
                    badgeTag: 'FRESH',
                    badgeColor: Colors.purpleAccent,
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Ginger Pack',
                      'assets/images/product_4.png',
                      2.99,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Best Selling Products', () {}),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ProductCard(
                    title: 'Beef Bone Meat',
                    img: 'assets/images/product_5.png',
                    price: 8.99,
                    unit: '1kg, Priceg',
                    badgeTag: 'BEST',
                    badgeColor: const Color(0xFF53B175),
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Beef Bone Meat',
                      'assets/images/product_5.png',
                      8.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Fresh Tomatoes',
                    img: 'assets/images/product_3.png',
                    price: 4.99,
                    unit: '1kg, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Fresh Tomatoes',
                      'assets/images/product_3.png',
                      4.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Organic Bananas',
                    img: 'assets/images/product_1.png',
                    price: 4.99,
                    unit: '7pcs, Priceg',
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Organic Bananas',
                      'assets/images/product_1.png',
                      4.99,
                    ),
                  ),
                  ProductCard(
                    title: 'Red Bell Pepper',
                    img: 'assets/images/product_4.png',
                    price: 3.49,
                    unit: '500g, Priceg',
                    badgeTag: 'NEW',
                    badgeColor: Colors.blueAccent,
                    onFavoriteChanged: () => setState(() {}),
                    onAddToCart: () => _addToCart(
                      'Red Bell Pepper',
                      'assets/images/product_4.png',
                      3.49,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _trustItem(
                      Icons.electric_bolt_rounded,
                      'Fast 30 Min',
                      'Delivery',
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      color: Colors.grey.shade300,
                    ),
                    _trustItem(
                      Icons.verified_user_rounded,
                      '100% Organic',
                      'Guaranteed',
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      color: Colors.grey.shade300,
                    ),
                    _trustItem(
                      Icons.lock_rounded,
                      'Secure Payment',
                      'Checkout',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner({
    required String title,
    required String subtitle,
    required List<Color> bgGradient,
    required String img,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: bgGradient),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: bgGradient.first.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      color: bgGradient.first,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(img, height: 90, fit: BoxFit.contain),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181725),
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'See All',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF53B175),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _trustItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF53B175), size: 24),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF53B175), Color(0xFF2E7D32)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 36,
                      color: Color(0xFF53B175),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Abdul Basit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'basit@nector.com',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _drawerTile(
                  context,
                  icon: Icons.home_rounded,
                  label: 'Home ',
                  color: const Color(0xFF53B175),
                  onTap: () => Navigator.pop(context),
                ),
                _drawerTile(
                  context,
                  icon: Icons.explore_rounded,
                  label: 'Explore Products',
                  color: const Color(0xFF4F6EF7),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Explorescreen()),
                    );
                  },
                ),
                _drawerTile(
                  context,
                  icon: Icons.shopping_cart_rounded,
                  label: 'My Cart ',
                  color: const Color(0xFFF18701),
                  badge: cart.isNotEmpty ? '${cart.length}' : null,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Cartscreen()),
                    ).then((_) => setState(() {}));
                  },
                ),
                _drawerTile(
                  context,
                  icon: Icons.favorite_rounded,
                  label: 'Favourites ',
                  color: const Color(0xFFE91E63),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Favouritescreen(),
                      ),
                    );
                  },
                ),
                _drawerTile(
                  context,
                  icon: Icons.person_rounded,
                  label: 'My Account ',
                  color: const Color(0xFF9C27B0),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Accountscreen()),
                    );
                  },
                ),
               
               
              ],
            ),
          ),
          Spacer(),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFe5383b),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: ()async{

                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Loginscreen()));
                }, child: Text("Log Out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
                 SizedBox(height: 10),

        ],
      ),
    );
  }

  Widget _drawerTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    String? badge,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String img;
  final double price;
  final String unit;
  final String? badgeTag;
  final Color? badgeColor;
  final VoidCallback onAddToCart;
  final VoidCallback? onFavoriteChanged;

  const ProductCard({
    super.key,
    required this.title,
    required this.img,
    required this.price,
    required this.unit,
    this.badgeTag,
    this.badgeColor,
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      height: 240,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF181725),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                widget.unit,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
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
                      color: Color(0xFF53B175),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onAddToCart,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF53B175),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.badgeTag != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: widget.badgeColor ?? const Color(0xFF53B175),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.badgeTag!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Positioned(
            top: -4,
            right: -4,
            child: IconButton(
              icon: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: isFavorite ? Colors.redAccent : Colors.grey.shade400,
                size: 22,
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
