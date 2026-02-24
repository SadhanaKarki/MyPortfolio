import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class AboutTablet extends StatelessWidget {
  const AboutTablet({super.key});

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
            "About Me",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 25),

          //About Content
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                const Text(
                  "Hello! I'm a passionate Mobile and Web Developer with a strong foundation in creating innovative solutions. "
                  "With expertise in Flutter, Dart, and modern web technologies, I build responsive and user-friendly applications.",
                  style: TextStyle(
                    fontSize: 15,
                    color: CustomColor.WhiteSecondary,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _AboutCardTablet(
                      icon: Icons.code,
                      title: "Clean Code",
                      description: "Maintainable and efficient code.",
                    ),
                    _AboutCardTablet(
                      icon: Icons.design_services,
                      title: "UI/UX Focus",
                      description: "Beautiful user interfaces.",
                    ),
                    _AboutCardTablet(
                      icon: Icons.speed,
                      title: "Performance",
                      description: "Speed and efficiency optimized.",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Always eager to learn and collaborate to create exceptional digital experiences.",
                  style: TextStyle(
                    fontSize: 15,
                    color: CustomColor.WhiteSecondary,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCardTablet extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCardTablet({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_AboutCardTablet> createState() => _AboutCardTabletState();
}

class _AboutCardTabletState extends State<_AboutCardTablet> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 180,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isHovered ? CustomColor.yellowPrimary : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHovered ? CustomColor.yellowSecondary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: 35,
              color:
                  isHovered ? Colors.black : CustomColor.yellowPrimary,
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isHovered ? Colors.black : CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 11,
                color: isHovered
                    ? Colors.black87
                    : CustomColor.WhiteSecondary,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
