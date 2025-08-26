import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/config/routes/route_location.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigationKey,
    initialLocation: RouteLocation.home,
    //here declared the initial route above
    routes: appRoutes,
  );
});
