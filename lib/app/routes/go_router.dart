import 'package:go_router/go_router.dart';

import '../../ui/views/home/home_view.dart';
import '../../ui/views/startup/startup_view.dart';
import '../../ui/views/contact-details/contact_details_view.dart';

abstract class AppRouter {
  static final routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'startup',
        path: '/',
        builder: (context, state) => const StartupView(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: 'contact-details',
        path: '/contact-details',
        builder: (context, state) => const ContactDetailsView(),
      ),
    ],
  );
}
