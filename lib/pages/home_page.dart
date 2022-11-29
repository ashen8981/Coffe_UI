import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/coffee_tile.dart';
import '../util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List coffeeType = [
    ['cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i =0; i<coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.person),
        )],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                  fontSize: 54
              ),
            ),
          ),

          const SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee....',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15,),

          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index){
                  return CoffeeType(
                      coffeetype: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: (){
                        coffeeTypeSelected(index);
                      });
                }),
          ),

          Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTiles(
                    coffeImagePath: 'lib/imagess/images.jpeg',
                    coffeeName: 'Cappucino',
                    coffeePrice: '4.00',
                  ),
                  CoffeeTiles(
                    coffeImagePath: 'lib/imagess/latte.jpeg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.00',
                  ),
                  CoffeeTiles(
                    coffeImagePath: 'lib/imagess/milk.jpeg',
                    coffeeName: 'Milk',
                    coffeePrice: '4.00',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}