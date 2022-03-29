import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kalkulator_kuchenny/pages/components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: false,
        leadingWidth: 0,
        toolbarHeight: (MediaQuery.of(context).size.height < 700 ? 60 : 100),
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset('assets/Kuchenny.png',
            height: (MediaQuery.of(context).size.height < 700 ? 60 : 100),
          ),
          )
        ),
      body: Body(),
    );
  }
}
