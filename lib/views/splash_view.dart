import 'package:flutter/material.dart';
import 'package:griyabayar/viewmodels/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(context: context),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(),
                      Image.asset(
                        "assets/images/g-logo-transparent.png",
                        scale: 6.5,
                      ),
                      Text(
                        "v1.0",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
