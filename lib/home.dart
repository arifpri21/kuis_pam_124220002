import 'package:flutter/material.dart';
import 'package:kuis_pam_124220002/daftar_barang_dummy.dart';
import 'package:kuis_pam_124220002/login.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Navigate to LoginPage and replace current page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 145, 237),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          title: const Text(
            'Home Page',
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
                height: 600,
                width: 500,
                child: Card(
                  color: const Color.fromARGB(255, 190, 192, 197),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.9),
                    itemCount: supermarketItemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final SupermarketItem place = supermarketItemList[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              place.imageUrls[0],
                              width: 150,
                              height: 100,
                            ),
                            Text(
                              supermarketItemList[index].name,
                            ),
                            Text(supermarketItemList[index].price),
                          ],
                        ),
                      );
                    },
                  ),
                )),
          ],
        ));
  }
}
