import 'package:flutter/material.dart';


class AvatarBtn extends StatelessWidget {
  final text;
  final onChange;
  const AvatarBtn({this.onChange,this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onChange, child: Container(child: Text('$text')));
  }
}
