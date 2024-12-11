import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsTablet extends StatelessWidget {
  const SkillsTablet({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
   final screenWidth = screenSize.width;
    
    return  Container(
            width: screenWidth,
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 60),
            color: CustomColor.bgLight1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Title
                const Text("My Skills",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary),
                  ),
                const SizedBox(height: 20,),
                //platforms and skills
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //platform
                    ConstrainedBox(                  //we can give wrap a required sizes
                      constraints:const  BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: Wrap(
                        spacing: 5,      //for vertical spacing
                        runSpacing: 5,    //for horizontalspacing between boxes
                        children: [
                          for (int i=0; i<platformItems.length;i++)
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: CustomColor.bgLight2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal:20 ,vertical: 10),
                              leading: Image.asset(platformItems[i]["img"],width: 27,),
                              title: Text(platformItems[i]["title"]),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 60,),

                    //skills
                    Wrap(
                      children: [
                      ConstrainedBox(                  //we can give wrap a required sizes
                      constraints: BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: Wrap(
                        spacing: 5,      //for vertical spacing
                        runSpacing: 5,    //for horizontalspacing between boxes
                        children: [
                          for (int i=0; i<skillsItems.length;i++)
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: CustomColor.bgLight2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal:20 ,vertical: 10),
                              leading: Image.asset(skillsItems[i]["img"],width: 27,),
                              title: Text(skillsItems[i]["title"]),
                            ),
                          )
                        ],
                      ),
                    ),
                      ],
                    )

                  ],
                )
              ],
            ),

          );
  }
}