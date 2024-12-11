import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: (size.width > 100) ? size.height * .05 : null,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onPressed: () {
              print('link bar clickeable');
            },
          ),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Service'),
          LinkText(text: 'Privacy Policy'),
          LinkText(text: 'CookiePolicy'),
          LinkText(text: 'Ads info'),
          LinkText(text: 'Blogs'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Brand Resources'),
          LinkText(text: 'About'),
        ],
      ),
    );
  }
}
