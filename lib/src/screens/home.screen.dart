import 'package:finotemarket_app/src/controllers/product.controller.dart';
import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finotemarket_app/src/widgets/product_card.dart';
import 'package:finotemarket_app/src/widgets/pageview.dart';
import 'package:finotemarket_app/src/constants/images.constants.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxBool isLightTheme = false.obs;
  int _selectedIndex = 0;
  final ThemeController c = Get.put(ThemeController());
  final ProductController pc = Get.put(ProductController());

  PageController page = PageController(initialPage: 0, viewportFraction: 0.9);

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    pc.setProducts();
    c.getThemeStatus();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Welcome To Tutor Joes'),
                TextButton(
                  // color: Colors.red,
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          // onPressed: showBottom,
          backgroundColor: Theme.of(context).primaryColor,
          tooltip: 'Call',

          child: const Icon(
            Icons.phone_in_talk_rounded,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          // type: BottomNavigationBarType.shifting,
          selectedIconTheme: const IconThemeData(size: 30),
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.houseboat),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist_outlined),
              label: 'My Orders',
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // const SizedBox(
              //   height: 7,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("ፍኖተMarket",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,fontFamily: 'LosAngeleno'),),
                  ),
                  IconButton(
                      icon: const Icon(Icons.sunny),
                      onPressed: c.toogleThemeMode),
                ],
              ),
              SearchBarAnimation(
                textEditingController: TextEditingController(),
                isOriginalAnimation: false,
                buttonBorderColour: Colors.black45,
                buttonWidget: const Icon(Icons.search),
                secondaryButtonWidget: const Icon(Icons.search),
                trailingWidget: const Icon(Icons.search),
                enableKeyboardFocus: true,
                // onFieldSubmitted: (String value){
                //     debugPrint('onFieldSubmitted value $value');
                // },
                onChanged: (String value) {
                  debugPrint('onFieldSubmitted value $value');
                },
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),

                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  // color: const Color.fromARGB(255, 233, 233, 228),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 3,color: Theme.of(context).highlightColor,),bottom: BorderSide(width: 3,color: Theme.of(context).highlightColor,))
                  ),
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.fast),
                      itemCount: 5,
                      controller: page,
                      itemBuilder: (_, int i) => PageViewElement(
                          img: ImageConst.exclusiveProducts[i]))),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 5, 20),
                child: Text(
                  "Discover Anything",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3),
                    itemCount: pc.products.length,
                    itemBuilder: (context, int i) => ProductCard(
                          img: pc.products[i].images[0],
                          index: i,
                        )),
              )
            
            ],
          ),
        ));
  }
}
