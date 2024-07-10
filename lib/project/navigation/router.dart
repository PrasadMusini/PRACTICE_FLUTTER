class AppRouter {
  final String path;
  final String name;
  AppRouter({required this.path, required this.name});
}

class Routes {
  static AppRouter screenHome = AppRouter(path: '/home', name: 'Home');
  static AppRouter screenSearch = AppRouter(path: 'search', name: 'Search');

  static AppRouter screenOrderItem =
      AppRouter(path: '/order-item', name: 'Order-item');

  static AppRouter screenFavorates =
      AppRouter(path: '/favorates', name: 'Favorates'); // wishList
  static AppRouter screenOrders = AppRouter(path: '/orders', name: 'Orders');
  static AppRouter screenProfile = AppRouter(path: '/profile', name: 'Profile');
  static AppRouter screenTest = AppRouter(path: '/test', name: 'Test');
  static AppRouter screen404 = AppRouter(path: '/404', name: '404');
}
