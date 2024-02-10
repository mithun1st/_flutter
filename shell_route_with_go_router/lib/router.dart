import 'dart:developer';
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
          routes: [
            GoRoute(
              name: RouterConstant.pageB,
              path: 'page_b',
              builder: (context, state) {
                double p1 = double.parse(state.uri.queryParameters["p1"] ?? "0");
                String p2 = state.uri.queryParameters["p2"] ?? "";
                return PageB(
                  pi: p1,
                  srt: p2,
                );
              },
            ),
          ]),
      GoRoute(
        name: RouterConstant.pageA,
        path: '/page_a',
        builder: (context, state) {
          return const PageA();
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
    redirect: ((context, state) async {
      log(state.fullPath.toString());
      bool tokenExp = await Future.delayed(const Duration(seconds: 0), () => false);
      if (!(state.fullPath == "/") && tokenExp) {
        return "/token_page";
      }

      return null;
    }),
  );
}
