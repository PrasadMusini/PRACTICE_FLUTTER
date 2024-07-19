class AppRouter {
  final String path;
  final String name;
  AppRouter({required this.path, required this.name});
}

class Routes {
  static AppRouter screenSplash = AppRouter(path: '/spalsh', name: 'Splash');
  static AppRouter screenOnBoarding =
      AppRouter(path: '/onBoarding', name: 'OnBoarding');

  static AppRouter screenHome = AppRouter(path: '/home', name: 'Home');
  static AppRouter screenSearch = AppRouter(path: 'search', name: 'Search');
  static AppRouter screenStory = AppRouter(path: '/story', name: 'Story');
  static AppRouter screenNotifications =
      AppRouter(path: '/notifications', name: 'Notifications');
  static AppRouter screenOrderItem =
      AppRouter(path: '/order-item', name: 'Order-item');

  static AppRouter screenFavorates =
      AppRouter(path: '/favorates', name: 'Favorates'); // wishList

  static AppRouter screenOrders = AppRouter(path: '/orders', name: 'Orders');

  static AppRouter screenProfile = AppRouter(path: '/profile', name: 'Profile');
  static AppRouter screenProfileOption =
      AppRouter(path: 'profile-option', name: 'Profile Option');

  static AppRouter screenTest = AppRouter(path: '/test', name: 'Test');
  static AppRouter screen404 = AppRouter(path: '/404', name: '404');

  static AppRouter screenSignin = AppRouter(path: '/signin', name: 'Signin');
  static AppRouter screenSignup = AppRouter(path: '/signup', name: 'Signup');
}
