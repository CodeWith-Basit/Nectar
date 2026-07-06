import 'package:flutter/material.dart';
import 'package:grocerry/screens/module.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

int quantity = 1;

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                'Add to cart item or no item yet',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cart[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 90,
                    child: ListTile(
                      tileColor: Colors.blue.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue.shade200, width: 1),
                      ),
                      leading: Image.asset(item.img),
                      title: Text(item.title),
                      subtitle: Text(item.price),
                      
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            cart.removeAt(index);
                          });
                        },
                      
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Icon(Icons.close),
                            ),
                            SizedBox(height: 10,),
                            Row(
               
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove, size: 20),
                                ),
                    
                                Text("$quantity", style: TextStyle(fontSize: 20)),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Icon(Icons.add, size: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
