import 'package:flutter/material.dart';


Text myTextWidget(label,[size=14.0,color=Colors.indigo]) {
  return Text(
    label,
    style: TextStyle( color: color, fontWeight: FontWeight.w600,fontSize:size, fontFamily: 'Play'),);

}
Widget myButtonWidget(label,action){
  return Card(
    child: ElevatedButton(
        onPressed:action,
        child: Text(label)
    ),
  );
}