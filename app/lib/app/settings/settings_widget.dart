import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsWidget extends StatelessWidget {

  const SettingsWidget({super.key});

  static final Uri _githubRepoUrl = Uri.parse('https://github.com/aamxh/buhoor');

  Future<void> _openGithubRepo() async {
    await launchUrl(_githubRepoUrl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: theme.colorScheme.secondary,
              child: Icon(Icons.person, size: 30, color: theme.primaryColor),
            ),
            accountName: Text(
                'GuestUser',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.secondary,
            )),
            accountEmail: Text(
                'guest@buhoor.app',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.secondary,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('تعديل الملف الشخصي'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('سياسة الخصوصية'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.code_outlined),
            title: const Text('Github repository'),
            onTap: _openGithubRepo,
          ),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text('قيم التطبيق'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: MyConstants.errorColor),
            title: Text(
                'تسجيل خروج',
                style: theme.textTheme.bodyLarge!.copyWith(color: MyConstants.errorColor)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

}