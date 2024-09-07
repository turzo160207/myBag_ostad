import 'package:flutter/material.dart';
import 'package:my_bag_ostad/model/cart_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CartItem> cartItems = [
    CartItem(name: 'Pullover', color: 'Black', size: 'L', price: 51),
    CartItem(name: 'Pullover', color: 'Black', size: 'L', price: 51),
    CartItem(name: 'Pullover', color: 'Black', size: 'L', price: 51),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "My Bag",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  CartItem item = cartItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Image.asset("assets/images/tshirt.png",
                                fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    )
                                ),
                                Row(
                                  children: [
                                    Text("Color: ${item.color}",
                                        style: TextStyle(
                                            fontSize: 14
                                        )
                                    ),
                                    SizedBox(width: 8),
                                    Text("Size: ${item.size}",
                                        style: TextStyle(
                                            fontSize: 14
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    FloatingActionButton.small(
                                      backgroundColor: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40),
                                      ),
                                      onPressed: () => decrementItem(index),
                                      child: Icon(Icons.remove),
                                    ),
                                    SizedBox(width: 8),
                                    Text("${item.quantity}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18
                                        )
                                    ),
                                    SizedBox(width: 8),
                                    FloatingActionButton.small(
                                      backgroundColor: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40)
                                      ),
                                      onPressed: () => incrementItem(index),
                                      child: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => removeItem(index),
                                icon: Icon(Icons.more_vert),
                              ),
                              Text("\$${item.price * item.quantity}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total amount:",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18
                      )
                  ),
                  Text("\$${getTotalAmount()}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add checkout action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.red,
              ),
              child: Text(
                'CHECK OUT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getTotalAmount() {
    return cartItems.fold(
        0, (total, item) => total + item.price * item.quantity);
  }

  void incrementItem(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementItem(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }
}
