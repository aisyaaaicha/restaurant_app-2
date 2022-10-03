part of 'pages.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/home';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  static const String _restaurantText = 'Home';
  static const String _settingsText = 'Settings';

  final NotificationHelper _notificationHelper = NotificationHelper();

  List<Widget> _listWidget() {
    return [
      const ListRestaurantScreen(),
      const SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _bottomNavBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
        title: _restaurantText,
        textStyle: Theme.of(context).textTheme.button,
        activeColorPrimary: yellow,
        inactiveColorPrimary: Colors.grey[200],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
            Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings),
        title: _settingsText,
        textStyle: Theme.of(context).textTheme.button,
        activeColorPrimary: yellow,
        inactiveColorPrimary: Colors.grey[200],
      ),
    ];
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _listWidget(),
      items: _bottomNavBarItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style9,
    );
  }

  Widget _buildIos(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _listWidget(),
      items: _bottomNavBarItems(context),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
      navBarStyle: NavBarStyle.style9,
    );
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(DetailScreen.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
