import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';


class PageViewElement extends StatelessWidget {
  final String ?img;
  const PageViewElement({this.img,super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        // EasyLoading.show(status: 'loading...');
        // EasyLoading.show(status: 'loading...');

// EasyLoading.showProgress(0.8, status: 'downloading...');

// EasyLoading.showSuccess('Great Success!');

// EasyLoading.showError('Failed with Error');

// EasyLoading.showInfo('Useful Information.');
// EasyLoading.show(status: 'Getting Data',indicator: Icon(Icons.join_right));
// EasyLoadingIndicatorType.pulse:


// EasyLoading.showToast('Toast');

// EasyLoading.dismiss();
      },
      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 8, 8.0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image:  DecorationImage(
                              // image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              image: AssetImage('assets/images/$img.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
    );
                  
  }
}