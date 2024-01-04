import 'package:flutter/material.dart';

class nameDescription extends StatelessWidget { 
  const nameDescription({ 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text( 
          "written by- Create AI Developers",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        SizedBox( 
          height: 2,
        ), 
        Text( 
          "written by- Create AI Developers",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ]
    );
  }
}