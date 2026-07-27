import 'package:flutter/material.dart';
import 'package:grocerry/screens/module.dart';

class CategoryItem {
  final String name;
  final IconData icon;
  final Color bgColor;
  final Color borderColor;
  final int itemLength;

  CategoryItem({
    required this.name,
    required this.icon,
    required this.bgColor,
    required this.borderColor,
    required this.itemLength,
  });
}

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<CategoryItem> _categories = [
    CategoryItem(
      name: 'Fresh Fruits & Veggies',
      icon: Icons.eco_rounded,
      bgColor: const Color(0xFFEEF7F2),
      borderColor: const Color(0xFF53B175),
      itemLength: 18,
    ),
    CategoryItem(
      name: 'Cooking Oil & Ghee',
      icon: Icons.opacity_rounded,
      bgColor: const Color(0xFFFFF6EE),
      borderColor: const Color(0xFFF8A44C),
      itemLength: 12,
    ),
    CategoryItem(
      name: 'Meat & Fish',
      icon: Icons.set_meal_rounded,
      bgColor: const Color(0xFFFDE8E4),
      borderColor: const Color(0xFFF7A593),
      itemLength: 9,
    ),
    CategoryItem(
      name: 'Bakery & Snacks',
      icon: Icons.bakery_dining_rounded,
      bgColor: const Color(0xFFF4EBF7),
      borderColor: const Color(0xFFD3B0E0),
      itemLength: 24,
    ),
    CategoryItem(
      name: 'Dairy & Eggs',
      icon: Icons.egg_rounded,
      bgColor: const Color(0xFFFFFCEB),
      borderColor: const Color(0xFFFDE598),
      itemLength: 15,
    ),
    CategoryItem(
      name: 'Beverages',
      icon: Icons.local_drink_rounded,
      bgColor: const Color(0xFFEDF7FC),
      borderColor: const Color(0xFFB7DFF5),
      itemLength: 30,
    ),
    CategoryItem(
      name: 'Pulses & Grains',
      icon: Icons.grain_rounded,
      bgColor: const Color(0xFFFFF3E0),
      borderColor: const Color(0xFFFFB74D),
      itemLength: 16,
    ),
    CategoryItem(
      name: 'Beauty & Personal Care',
      icon: Icons.face_retouching_natural_rounded,
      bgColor: const Color(0xFFFCE4EC),
      borderColor: const Color(0xFFF48FB1),
      itemLength: 21,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CategoryItem> get _filteredCategories {
    if (_searchQuery.isEmpty) return _categories;
    return _categories
        .where(
          (cat) => cat.name.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  void _showCategoryDetails(CategoryItem category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: category.bgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: category.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      category.icon,
                      color: category.borderColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF181725),
                          ),
                        ),
                        Text(
                          '${category.itemLength} items available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 20),
                  itemBuilder: (context, index) {
                    final mockTitles = [
                      'Premium Quality ${category.name.split(" ").first}',
                      'Organic Special Pack',
                      'Farm Fresh Harvest',
                      'Family Deal Pack',
                    ];
                    final mockPrices = [3.99, 5.49, 2.99, 8.99];

                    return Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: category.bgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            category.icon,
                            color: category.borderColor,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mockTitles[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${mockPrices[index].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Color(0xFF53B175),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF53B175),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {
                            cart.add(
                              Module(
                                title: mockTitles[index],
                                img: 'assets/images/product_1.png',
                                price: mockPrices[index],
                                count: 1,
                              ),
                            );
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${mockTitles[index]} added to cart!',
                                ),
                                duration: const Duration(seconds: 2),
                                backgroundColor: const Color(0xFF53B175),
                              ),
                            );
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredCategories;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Find Products',
          style: TextStyle(
            color: Color(0xFF181725),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Search Category or Product',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF181725),
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
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
              const SizedBox(height: 20),
              // Grid of Categories
              Expanded(
                child: filtered.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No category found for "$_searchQuery"',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: filtered.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.82,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                        itemBuilder: (context, index) {
                          final cat = filtered[index];
                          return InkWell(
                            onTap: () => _showCategoryDetails(cat),
                            borderRadius: BorderRadius.circular(18),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: cat.bgColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: cat.borderColor.withValues(alpha: 0.7),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: cat.borderColor.withValues(
                                      alpha: 0.08,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(
                                          alpha: 0.8,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        cat.icon,
                                        size: 34,
                                        color: cat.borderColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      cat.name,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF181725),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${cat.itemLength}+ Items',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
