import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 60),
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "My Skills",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 25),

          //Skills Grid
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillsItems.length; i++)
                if (skillsItems[i]['img'] != null &&
                    skillsItems[i]['title'] != null)
                  _SkillCardMobile(
                    imagePath: skillsItems[i]['img'] as String,
                    title: skillsItems[i]['title'] as String,
                  )
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCardMobile extends StatelessWidget {
  final String imagePath;
  final String title;

  const _SkillCardMobile({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 30, height: 30),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
