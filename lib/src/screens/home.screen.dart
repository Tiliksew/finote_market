import 'package:finotemarket_app/src/controllers/product.controller.dart';
import 'package:finotemarket_app/src/controllers/theme.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finotemarket_app/src/widgets/product_card.dart';
import 'package:finotemarket_app/src/widgets/the_search.dart';
import 'package:finotemarket_app/src/widgets/pageview.dart';
import 'package:finotemarket_app/src/constants/images.constants.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:finotemarket_app/src/screens/categories.screen.dart';
import 'package:finotemarket_app/src/controllers/products.controller.dart';
import 'package:finotemarket_app/src/screens/orders.screen.dart';

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
  final ProductsController pcs = Get.put(ProductsController());
  PageController page = PageController(initialPage: 0, viewportFraction: 0.9);

  void _makeCall() async {
    final Uri smsLaunchUri = Uri(
      scheme: 'tel',
      path: '+251919298457',
    );
    if (!await launchUrl(smsLaunchUri)) {
      throw Exception('Could not launch');
    }
    // setState(() {
    // });
  }

  getProductsAndSetState() async {
    await pcs.getProducts();
  }
  Future<void> _showSearch() async {
    await showSearch(
      context: context,
      delegate: TheSearch(),
      // query: "",
    );
  }

  @override
  void initState() {
    super.initState();
    // pc.setProducts();
    print(  'phone number *');

    print(  Get.arguments['phoneNumber']);
    print(  Get.arguments['prifix']);
    getProductsAndSetState();
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _makeCall,
        //   // onPressed: showBottom,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   tooltip: 'Call',

        //   child: const Icon(
        //     Icons.phone_in_talk_rounded,
        //     color: Colors.white,
        //   ),
        // ),

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
        body: _selectedIndex == 0
            ? FutureBuilder(
                future: getProductsAndSetState(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // const SizedBox(
                              //   height: 7,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'ፍኖተMarket',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'LosAngeleno'),
                                    ),
                                  ),
                                  Text(Get.arguments['phoneNumber'],style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'LosAngeleno'),),
                                  IconButton(
                                      icon: const Icon(Icons.sunny),
                                      onPressed: c.toogleThemeMode),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width/0.9,
                                height: 50,
                                // color: Colors.black,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: ListTile(
                                  onTap: () {
                                    // Get.toNamed('/search');
                                    _showSearch();
                                  },
                                  title: const Text('Search',style: TextStyle(),),
                                  trailing: const Icon(Icons.search),
                                ),
                              ),
                              // SearchBarAnimation(
                              //   textEditingController: TextEditingController(),
                              //   isOriginalAnimation: false,
                              //   buttonBorderColour: Colors.black45,
                              //   buttonWidget: const Icon(Icons.search),
                              //   secondaryButtonWidget: const Icon(Icons.search),
                              //   trailingWidget: const Icon(Icons.search),
                              //   enableKeyboardFocus: true,
                              //   // onFieldSubmitted: (String value){
                              //   //     debugPrint('onFieldSubmitted value $value');
                              //   // },
                              //   onChanged: (String value) {
                              //     debugPrint('onFieldSubmitted value $value');
                              //   },
                              // ),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 5),
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  // color: const Color.fromARGB(255, 233, 233, 228),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                            width: 3,
                                            color: Theme.of(context).focusColor,
                                          ),
                                          bottom: BorderSide(
                                            width: 3,
                                            color: Theme.of(context).focusColor,
                                          ))),
                                  child: PageView.builder(
                                      physics: const BouncingScrollPhysics(
                                          decelerationRate:
                                              ScrollDecelerationRate.fast),
                                      itemCount: 5,
                                      controller: page,
                                      itemBuilder: (_, int i) =>
                                          PageViewElement(
                                              img: ImageConst
                                                  .exclusiveProducts[i]))),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 5, 20),
                                child: Text(
                                  "Discover Anything",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 3,
                                            crossAxisSpacing: 3),
                                    itemCount: pcs.products.length,
                                    itemBuilder: (context, int i) =>
                                        ProductCard(
                                          img: pcs.products[i].images[0],
                                          price: pcs.products[i].price,
                                          title: pcs.products[i].title,
                                          description:
                                              pcs.products[i].description,
                                          index: i,
                                        )),
                              )
                            ],
                          ),
                        );
                },
              )
            : _selectedIndex == 1
                ? const CategoriesScreen()
                : const OrdersScreen());
  }
}
