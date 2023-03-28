import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String ?name;

   const CategoryItem({this.name,super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).highlightColor),
        child: Wrap(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              height: 120,
              padding: const EdgeInsets.all(38),
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 226, 243, 227),

                // color: Colors.amberAccent,
                image: const DecorationImage(
                  scale: 0.6,
                  // image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  image: AssetImage('assets/images/women4.png'),
                  fit: BoxFit.scaleDown,
                ),
                // border: Border.all(
                //   width: 0,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Text(widget.name!),
                ],
              ),
            )
          ],
        ),
      );
   
  }
}