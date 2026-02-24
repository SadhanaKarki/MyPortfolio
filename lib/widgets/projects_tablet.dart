import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsTablet extends StatelessWidget {
  const ProjectsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 60),
      color: CustomColor.scaffoldBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "My Projects",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 25),

          //Projects Grid
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < projectsItems.length; i++)
                  _ProjectCardTablet(
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

class _ProjectCardTablet extends StatelessWidget {
  final Map<String, String> project;

  const _ProjectCardTablet({
    required this.project,
  });

  Future<void> _launchURL() async {
    final String url = project['url'] ?? '';
    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CustomColor.bgLight2,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                project['image'] ?? '',
                width: 50,
                height: 50,
                errorBuilder: (_, __, ___) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project['title'] ?? 'Project',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project['description'] ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColor.WhiteSecondary,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                project['technologies'] ?? '',
                style: const TextStyle(
                  fontSize: 11,
                  color: CustomColor.yellowSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColor.yellowPrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Visit',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
