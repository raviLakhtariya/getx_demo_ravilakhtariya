import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color:Colors.white38.withOpacity(0.5)
      ),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}