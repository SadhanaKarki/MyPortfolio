import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsDesktop extends StatelessWidget {
  const ProjectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      color: CustomColor.scaffoldBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "My Projects",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),

          //Projects Grid
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < projectsItems.length; i++)
                  _ProjectCardDesktop(
                    project: projectsItems[i],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCardDesktop extends StatefulWidget {
  final Map<String, String> project;

  const _ProjectCardDesktop({
    required this.project,
  });

  @override
  State<_ProjectCardDesktop> createState() => _ProjectCardDesktopState();
}

class _ProjectCardDesktopState extends State<_ProjectCardDesktop> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    final String url = widget.project['url'] ?? '';
    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        decoration: BoxDecoration(
          color: isHovered ? CustomColor.bgLight2 : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered
                ? CustomColor.yellowPrimary
                : CustomColor.bgLight2,
            width: isHovered ? 2 : 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.yellowPrimary.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.project['image'] ?? '',
                    width: 60,
                    height: 60,
                    errorBuilder: (_, __, ___) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.project['title'] ?? 'Project',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: CustomColor.WhiteSecondary,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.project['technologies'] ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: CustomColor.yellowSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: _launchURL,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.yellowPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'View Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
