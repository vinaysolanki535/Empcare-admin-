import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  dynamic color, titleColor, title, icon,onPressed,iconColor,fontSize;

  ListItems({ this.color,this.titleColor,this.title,this.icon,this.fontSize = 16.0,this.onPressed,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          hoverColor: Colors.blueAccent,

          onTap: (){
            onPressed();
          },
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:color,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: fontSize,
                    ),
                ),
                Icon(
                  icon,
                  color: iconColor,
                )
              ],
            ),

          ),
        ),
      );
  }
}
