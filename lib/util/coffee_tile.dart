import 'package:flutter/material.dart';

class CoffeeTiles extends StatelessWidget {

  final String coffeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTiles({
    required this.coffeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black54,
        ),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(coffeImagePath,
                height: 230,
                width: 180,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName,
                    style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 5,),
                  Text('With almond milk',
                    style: TextStyle(color: Colors.grey[700]),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + coffeePrice),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            )

          ],
        ),


      ),

    );
  }
}