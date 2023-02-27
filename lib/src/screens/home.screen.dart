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
  PageController page = PageController(initialPage: 0, viewportFraction: 0.9);

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
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
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          // onPressed: showBottom,
          backgroundColor: Theme.of(context).primaryColor,
          tooltip: 'Increment',
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
              Container(
                decoration:  BoxDecoration(
                      // color: Colors.amber,
                // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(3)
                      ),
                // margin: const EdgeInsets.only(left: 3,right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Text(
                    //   'You have pushed the button this many times:',
                    // ),
                    // Text(
                    //   '$_counter',
                    //   style: Theme.of(context).textTheme.headlineMedium,
                    // ),
                    const  Padding(
                      padding:  EdgeInsets.only(left:8.0),
                      child: CircleAvatar(
                        // backgroundImage: AssetImage('assets/images/women4.png'),
                      ),
                    ),
                    Expanded(
                      child:
                     Container(
                      height: 80,
                      margin: const EdgeInsets.only(left: 15),
                      
                      child: const Center(child: Text("ፍኖተMarket",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontFamily: 'LosAngeleno'),)),
                      )),
                    IconButton(
                        icon: const Icon(Icons.sunny),
                        onPressed: c.toogleThemeMode),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // SizedBox(height: 50,width: MediaQuery.of(context).size.width,child: TextField(),),
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  color: const Color.fromARGB(255, 233, 233, 228),
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.fast),
                      itemCount: 5,
                      controller: page,
                      itemBuilder: (_, int i) => PageViewElement(
                          img: ImageConst.exclusiveProducts[i]))),
              // Container(
              //   margin: new EdgeInsets.only(
              //     top: 16.0,
              //     bottom: 16.0,
              //   ),
              //   child: new CircleIndicator(
              //       page, 3, 6.0, Colors.white70, Colors.white)),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 5, 20),
                child: Text(
                  "Discover Anything",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                  child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 3, crossAxisSpacing: 3),
                children: const [
                  ProductCard(
                    img: 'bag1',
                  ),
                  ProductCard(
                    img: 'flower3',
                  ),
                  ProductCard(
                    img: 'men6',
                  ),
                  ProductCard(
                    img: 'women4',
                  ),
                  ProductCard(
                    img: 'men4',
                  ),
                  ProductCard(
                    img: 'flower1',
                  ),
                  ProductCard(
                    img: 'sport1',
                  ),
                  ProductCard(
                    img: 'men1',
                  ),
                  ProductCard(
                    img: 'women1',
                  ),
                  ProductCard(
                    img: 'glass',
                  ),
                  ProductCard(
                    img: 'men5',
                  ),
                  ProductCard(
                    img: 'necklace1',
                  ),
                  ProductCard(
                    img: 'headset1',
                  ),
                  ProductCard(
                    img: 'flower4',
                  ),
                  ProductCard(
                    img: 'coffeetable',
                  ),
                  ProductCard(
                    img: 'mic1',
                  ),
                  ProductCard(
                    img: 'women11',
                  ),
                  ProductCard(
                    img: 'flower2',
                  ),
                  ProductCard(
                    img: 'men2',
                  ),
                  ProductCard(
                    img: 'women5',
                  ),
                  ProductCard(
                    img: 'camera1',
                  ),
                  ProductCard(
                    img: 'bag2',
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
