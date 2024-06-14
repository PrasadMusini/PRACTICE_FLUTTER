class AppRouter {
  final String name;
  final String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRouter homePage = AppRouter(name: 'home', path: '/');
  static AppRouter profilePage = AppRouter(name: 'profile', path: '/profile');
  static AppRouter menu1 = AppRouter(name: 'menu1', path: '/menu1');
  static AppRouter menu2 = AppRouter(name: 'menu2', path: '/menu2');
  static AppRouter menu3 = AppRouter(name: 'menu3', path: '/menu3');
  static AppRouter menu4 = AppRouter(name: 'menu4', path: '/menu4');
}
