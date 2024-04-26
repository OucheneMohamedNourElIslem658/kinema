import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinema/features/auth/screens/birth_day.dart';
import 'package:kinema/features/fidelity/screens/card.dart';
import 'package:kinema/features/fidelity/screens/fidelity_market.dart';
import 'package:kinema/features/fidelity/screens/invoice.dart';
import 'package:kinema/features/movies/screens/movie_selected.dart';
import 'package:kinema/features/movies/screens/movies.dart';
import 'package:kinema/features/profile/screens/profile.dart';
import 'package:kinema/features/profile/screens/profile_settings.dart';
import 'package:kinema/features/program/screens/program.dart';
import 'package:kinema/features/reservations/screens/seat_choice.dart';
import 'package:kinema/features/reservations/screens/ticket.dart';
import 'package:kinema/features/trailers/screens/trailers.dart';

import '../screens/home.dart';

class CustomNavigation {
  CustomNavigation._();

  static String initialRoute = '/Profile';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorMovies = GlobalKey<NavigatorState>(
    debugLabel: 'shellMovie'
  );

  static final _rootNavigatorProgram = GlobalKey<NavigatorState>(
    debugLabel: 'shellProgram'
  );

  static final _rootNavigatorTrailers = GlobalKey<NavigatorState>(
    debugLabel: 'shellTrailers'
  );

  static final _rootNavigatorFidelity = GlobalKey<NavigatorState>(
    debugLabel: 'shellFidelity'
  );

  static final _rootNavigatorProfile = GlobalKey<NavigatorState>(
    debugLabel: 'shellProfile'
  );

  static final _rootNavigatorProfileSettings = GlobalKey<NavigatorState>(
    debugLabel: 'shellProfileSettings'
  );

  static final _rootNavigatorMovie = GlobalKey<NavigatorState>(
    debugLabel: 'shellMovie'
  );

  static final _rootNavigatorCard = GlobalKey<NavigatorState>(
    debugLabel: 'shellCard'
  );

  static final _rootNavigatorInvoice = GlobalKey<NavigatorState>(
    debugLabel: 'shellInvoice'
  );

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return  HomeScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorMovies,
            routes: [
              GoRoute(
                path: '/movies',
                name: 'Movies',
                builder: (context, state) {
                  return MoviesScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProgram,
            routes: [
              GoRoute(
                path: '/program',
                name: 'Program',
                builder: (context, state) {
                  return ProgramScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorTrailers,
            routes: [
              GoRoute(
                path: '/trailers',
                name: 'Trailers',
                builder: (context, state) {
                  return TrailersScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorFidelity,
            routes: [
              GoRoute(
                path: '/fidelity',
                name: 'Fidelity',
                builder: (context, state) {
                  return FidelityMarketScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfileSettings,
            routes: [
              GoRoute(
                path: '/profileSettings',
                name: 'ProfileSettings',
                builder: (context, state) {
                  return ProfileSettingsScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorMovie,
            routes: [
              GoRoute(
                path: '/movie',
                name: 'Movie',
                builder: (context, state) {
                  return MovieScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCard,
            routes: [
              GoRoute(
                path: '/card',
                name: 'Card',
                builder: (context, state) {
                  return CardScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorInvoice,
            routes: [
              GoRoute(
                path: '/invoice',
                name: 'Invoice',
                builder: (context, state) {
                  return InvoiceScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfile,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) {
                  return ProfileScreen(
                    key: state.pageKey,
                  );
                },
              )
            ]
          ),
        ]
      ),
      GoRoute(
        path: '/birthDay',
        builder: (context, state) => const BirthDayScreen(),
      ),
      GoRoute(
        path: '/seatChoice',
        builder: (context, state) => const SeatChoiceScreen(),
      ),
      GoRoute(
        path: '/Ticket',
        builder: (context, state) => const TicketScreen(),
      ),
    ] 
  );
}