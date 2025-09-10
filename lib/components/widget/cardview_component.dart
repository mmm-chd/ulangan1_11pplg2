import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/color.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';

class CardviewComponent extends StatelessWidget {
  final Color color;
  final String task;
  final String title;

  const CardviewComponent ({
    super.key,
    required this.color,
    required this.task,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 150,
              height: 100,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius:BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task, 
                    style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: SupportColor.whiteColor,
                    fontSize: 14,
                    ), 
                    ),

                  Text(
                    title, 
                    style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: SupportColor.whiteColor,
                    fontSize: 22,
                    ),
                  ),

                    SpacingComponent(height: 8),
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                    value: 0.4,
                    minHeight: 6,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                    SupportColor.errorColor,
                  ),
                  ),
                  ),
                ],
              )
              
            );
  }
}