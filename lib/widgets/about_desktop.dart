import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),

          //About Content
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                const Text(
                  "Hello! I'm a passionate Mobile and Web Developer with a strong foundation in creating innovative solutions. "
                  "With expertise in Flutter, Dart, and modern web technologies, I build responsive and user-friendly applications that solve real-world problems.",
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColor.WhiteSecondary,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _AboutCard(
                      icon: Icons.code,
                      title: "Clean Code",
                      description: "Writing maintainable and efficient code following best practices.",
                    ),
                    _AboutCard(
                      icon: Icons.design_services,
                      title: "UI/UX Focus",
                      description: "Creating beautiful and intuitive user interfaces.",
                    ),
                    _AboutCard(
                      icon: Icons.speed,
                      title: "Performance",
                      description: "Optimizing applications for speed and efficiency.",
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  "I'm always eager to learn new technologies and collaborate with teams to create exceptional digital experiences. "
                  "When I'm not coding, you can find me exploring new frameworks or contributing to open-source projects.",
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColor.WhiteSecondary,
                    height: 1.8,
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

class _AboutCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<_AboutCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? CustomColor.yellowPrimary : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered ? CustomColor.yellowSecondary : Colors.transparent,
            width: 2,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.yellowPrimary.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: 40,
              color:
                  isHovered ? Colors.black : CustomColor.yellowPrimary,
            ),
            const SizedBox(height: 15),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isHovered ? Colors.black : CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 12,
                color: isHovered
                    ? Colors.black87
                    : CustomColor.WhiteSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
