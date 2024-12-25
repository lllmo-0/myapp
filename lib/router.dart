import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/layoutandpositioning.dart';
import 'package:myapp/pages/newspage.dart';
import 'package:myapp/pages/CarsCatalogPage.dart'; // Убедись, что этот импорт правильный

import 'pages/homepage.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

Page<void> noTransitionPageBuilder(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // No animation
    },
  );
}

final router = GoRouter(navigatorKey: _parentKey, routes: [
  ShellRoute(
    navigatorKey: _shellKey,
    builder: (context, state, child) => HomePage(child: child),
    routes: [
      GoRoute(
        path: "/",
        name: 'news',
        parentNavigatorKey: _shellKey,
        pageBuilder: (context, state) => noTransitionPageBuilder(
          context,
          state,
          const Newspage(),
        ),
      ),
      GoRoute(
        path: CarsCatalogPage
            .route, // Здесь используй CarsCatalogPage.route вместо CarsCatalogPage().route
        parentNavigatorKey: _shellKey,
        name: 'settings',
        pageBuilder: (context, state) =>
            noTransitionPageBuilder(context, state, const CarsCatalogPage()),
      ),
      GoRoute(
        path: LayoutAndPositioning
            .route, // Убедись, что здесь также правильно указан маршрут
        parentNavigatorKey: _shellKey,
        name: 'layout',
        pageBuilder: (context, state) => noTransitionPageBuilder(
            context, state, const LayoutAndPositioning()),
      ),
    ],
  ),
]);
