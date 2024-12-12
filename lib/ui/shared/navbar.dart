import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: 60,
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          // TODO : icono del menú
          if (size.width <= 700) ...[
            IconButton(
                onPressed: () {
                  SidemenuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_outlined)),
          ],
          const SizedBox(width: 5),
          // Search input
          if (size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 5),
      ]);
}
