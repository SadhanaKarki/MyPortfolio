import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 60),
      color: CustomColor.bgLight1,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 20),

          //About Content
          Text(
            "Hello! I'm a passionate Flutter Developer with hands-on experience in building scalable, user-friendly mobile applications. Skilled in translating ideas into practical solutions using Flutter, and modern state management techniques. A quick learner and highly motivated individual eager to contribute to real-world projects and continuously grow in mobile app development.",
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.WhiteSecondary,
              height: 1.7,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _AboutCardMobile(
                icon: Icons.code,
                title: "Clean Code",
                description: "Maintainable code",
              ),
              _AboutCardMobile(
                icon: Icons.design_services,
                title: "UI/UX Focus",
                description: "Beautiful interfaces",
              ),
              _AboutCardMobile(
                icon: Icons.speed,
                title: "Performance",
                description: "Optimized speed",
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class _AboutCardMobile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCardMobile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 32,
            color: CustomColor.yellowPrimary,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 11,
              color: CustomColor.WhiteSecondary,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
