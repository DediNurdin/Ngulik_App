import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import '../view_model/theme_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Setting"),
        automaticallyImplyLeading: false,
        actions: [
          GetBuilder<ThemeController>(
            builder: (controller) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.light_mode),
                  Switch(
                    activeColor: Colors.amber,
                    value: controller.isDark,
                    onChanged: (value) {
                      controller.changeTheme(value);
                    },
                  ),
                  const Icon(Icons.dark_mode),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: const [
            UserCard(),
            ActionsRow(),
            Settings(),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  Widget _buildUserRow() {
    return [
      const Icon(
        Icons.account_circle,
        color: Colors.black,
      )
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          )
          .constrained(height: 50, width: 50)
          .padding(right: 10),
      [
        const Text(
          'Rein Gundersen Bentdal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(bottom: 5),
        Text(
          'Creative builder',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  Widget _buildUserStats() {
    return [
      _buildUserStatsItem('846', 'Collect'),
      _buildUserStatsItem('51', 'Attention'),
      _buildUserStatsItem('267', 'Track'),
      _buildUserStatsItem('39', 'Coupons'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 10);
  }

  Widget _buildUserStatsItem(String value, String text) => [
        Text(value).fontSize(20).textColor(Colors.white).padding(bottom: 5),
        Text(text).textColor(Colors.white.withOpacity(0.6)).fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return [_buildUserRow(), _buildUserStats()]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 20, vertical: 10)
        .decorated(
            color: const Color(0xff3977ff),
            borderRadius: BorderRadius.circular(20))
        .elevation(
          5,
          shadowColor: const Color(0xff3977ff),
          borderRadius: BorderRadius.circular(20),
        )
        .height(175)
        .alignment(Alignment.center);
  }
}

class ActionsRow extends StatelessWidget {
  const ActionsRow({super.key});

  Widget _buildActionItem(String name, IconData icon) {
    final Widget actionIcon =
        Icon(icon, size: 20, color: const Color(0xFF42526F))
            .alignment(Alignment.center)
            .ripple()
            .constrained(width: 50, height: 50)
            .backgroundColor(const Color(0xfff6f5f8))
            .clipOval()
            .padding(bottom: 5);

    final Widget actionText = Text(
      name,
      style: const TextStyle(
        // color: Colors.black.withOpacity(0.8),
        fontSize: 12,
      ),
    );

    return [
      actionIcon,
      actionText,
    ].toColumn().padding(vertical: 20);
  }

  @override
  Widget build(BuildContext context) => [
        _buildActionItem('Wallet', Icons.attach_money),
        _buildActionItem('Delivery', Icons.card_giftcard),
        _buildActionItem('Message', Icons.message),
        _buildActionItem('Service', Icons.room_service),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
}

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  const SettingsItemModel({
    required this.color,
    required this.description,
    required this.icon,
    required this.title,
  });
}

const List<SettingsItemModel> settingsItems = [
  SettingsItemModel(
    icon: Icons.location_on,
    color: Color(0xff8D7AEE),
    title: 'Address',
    description: 'Ensure your harvesting address',
  ),
  SettingsItemModel(
    icon: Icons.lock,
    color: Color(0xffF468B7),
    title: 'Privacy',
    description: 'System permission change',
  ),
  SettingsItemModel(
    icon: Icons.menu,
    color: Color(0xffFEC85C),
    title: 'General',
    description: 'Basic functional settings',
  ),
  SettingsItemModel(
    icon: Icons.notifications,
    color: Color(0xff5FD0D3),
    title: 'Notifications',
    description: 'Take over the news in time',
  ),
  SettingsItemModel(
    icon: Icons.question_answer,
    color: Color(0xffBFACAA),
    title: 'Support',
    description: 'We are here to help',
  ),
  SettingsItemModel(
    icon: Icons.question_answer,
    color: Color(0xffBFACAA),
    title: 'Support',
    description: 'We are here to help',
  ),
  SettingsItemModel(
    icon: Icons.question_answer,
    color: Color(0xffBFACAA),
    title: 'Support',
    description: 'We are here to help',
  ),
  SettingsItemModel(
    icon: Icons.question_answer,
    color: Color(0xffBFACAA),
    title: 'Support',
    description: 'We are here to help',
  ),
];

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) => settingsItems
      .map((settingsItem) => SettingsItem(
            settingsItem.icon,
            settingsItem.color,
            settingsItem.title,
            settingsItem.description,
          ))
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  const SettingsItem(this.icon, this.iconBgColor, this.title, this.description,
      {super.key});

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    settingsItem({required Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 80)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => print('onTap'),
        )
        // .scale(pressed ? 0.95 : 1.0, animate: true)
        .animate(const Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: const TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return settingsItem(
      child: [
        icon,
        [
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
