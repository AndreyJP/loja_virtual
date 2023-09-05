import 'package:flutter/material.dart';

class ProfileMenuOption extends StatelessWidget {
  final String title;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  const ProfileMenuOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.iconColor,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward_ios,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}
