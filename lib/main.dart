import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/screens/cart_page.dart';
import 'package:flutter_catalog/screens/home_detail_page.dart';
import 'package:flutter_catalog/screens/home_page.dart';
import 'package:flutter_catalog/screens/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // remove # in url
  setPathUrlStrategy();

  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp.router(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        routeInformationParser: VxInformationParser(),
        routerDelegate: VxNavigator(routes: {
          "/": (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (uri, __) {
            final catalog = (VxState.store as MyStore)
                .catalog
                .getById(int.parse(uri.queryParameters["id"]));
            return MaterialPage(
              child: HomeDetailPage(
                catalog: catalog,
              ),
            );
          },
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
        }),
        // initialRoute: MyRoutes.homeRoute,
        // routes: {
        //   "/": (context) => LoginPage(),
        //   MyRoutes.homeRoute: (context) => HomePage(),
        //   MyRoutes.loginRoute: (context) => LoginPage(),
        //   MyRoutes.cartRoute: (context) => CartPage(),
        // },
      ),
    );
  }
}
