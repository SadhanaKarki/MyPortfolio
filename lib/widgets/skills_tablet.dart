import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsTablet extends StatelessWidget {
  const SkillsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "My Skills",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 25),
          
          //Skills Grid
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Wrap(
              spacing: 18,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < skillsItems.length; i++)
                  if (skillsItems[i]['img'] != null && skillsItems[i]['title'] != null)
                    _SkillCardTablet(
                      imagePath: skillsItems[i]['img'] as String,
                      title: skillsItems[i]['title'] as String,
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillCardTablet extends StatefulWidget {
  final String imagePath;
  final String title;

  const _SkillCardTablet({
    required this.imagePath,
    required this.title,
  });

  @override
  State<_SkillCardTablet> createState() => _SkillCardTabletState();
}

class _SkillCardTabletState extends State<_SkillCardTablet> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 190,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isHovered ? CustomColor.yellowPrimary : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isHovered ? CustomColor.yellowSecondary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.imagePath, width: 45, height: 45),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isHovered ? Colors.black : CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}