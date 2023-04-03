import 'package:flutter/cupertino.dart';

double width(BuildContext context, double size){
  return MediaQuery.of(context).size.width*size;
}

double height(BuildContext context, double size){
  return MediaQuery.of(context).size.height*size;
}