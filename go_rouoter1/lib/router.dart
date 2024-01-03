import 'package:flutter/material.dart';
import 'package:go_rouoter1/page/generate_token.dart';
import 'package:go_rouoter1/page/home_page.dart';
import 'package:go_rouoter1/page/page_a.dart';
import 'package:go_rouoter1/router_constant.dart';
import 'package:go_router/go_router.dart';

import 'page/page_b.dart';

class AppRouter {
  final GoRouter route = GoRouter(
    routes: [
      GoRoute(
        name: RouterConstant.homePage,
        path: "/",
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: RouterConstant.pageA,
        path: '/page_a',
        builder: (context, state) {
          return const PageA();
        },
      ),
      GoRoute(
        name: RouterConstant.pageB,
        path: '/page_b',
        builder: (context, state) {
          double p1 = double.parse(state.uri.queryParameters["p1"] ?? "0");
          String p2 = state.uri.queryParameters["p2"] ?? "";

          return PageB(
            pi: p1,
            srt: p2,
          );
        },
      ),
      GoRoute(
        name: RouterConstant.token,
        path: '/token_page',
        builder: (context, state) {
          return GenerateToken();
        },
      ),
    ],
    redirect: ((context, state) {

      bool tokenValid = true; //sw to (true or false)
      if (! (state.fullPath == "/") && !tokenValid) {
        return "/token_page";
      }

      return null;
    }),
  );
}
