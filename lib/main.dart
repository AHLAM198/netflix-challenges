import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netflix/src/presentation/bindings/bindings.dart';
import 'package:netflix/src/presentation/views/welcome.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:netflix/src/presentation/widgets/scroll_behaviour.dart';
import 'src/config/colors.dart';
import 'src/config/routes.dart' as routes;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const Netflix(),
    );
  });
  FlutterNativeSplash.remove();
}

class Netflix extends StatelessWidget {
  const Netflix({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: ScrollBehaviour(),
      title: 'Netflix Reimagined',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: ThemeData(
        fontFamily: "Netflix Sans",
        visualDensity: VisualDensity.comfortable,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: NFColors.red,
            elevation: 0,
            minimumSize: const Size(
              double.infinity,
              58,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 46.18,
            fontWeight: FontWeight.w900,
            color: NFColors.white,
          ),
          headline2: TextStyle(
            fontSize: 41.05,
            color: NFColors.white,
            fontWeight: FontWeight.w800,
          ),
          headline3: TextStyle(
            fontSize: 32.44,
            fontWeight: FontWeight.w700,
            color: NFColors.white,
          ),
          headline4: TextStyle(
            fontSize: 28.83,
            fontWeight: FontWeight.w600,
            color: NFColors.white,
            height: 1.4,
          ),
          headline5: TextStyle(
            fontSize: 25.63,
            fontWeight: FontWeight.w600,
            color: NFColors.white,
            height: 1.4,
          ),
          headline6: TextStyle(
            fontSize: 22.78,
            fontWeight: FontWeight.w600,
            color: NFColors.white,
            height: 1.4,
          ),
          subtitle1: TextStyle(
            fontSize: 20.25,
            fontWeight: FontWeight.w400,
            color: NFColors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 18.00,
            fontWeight: FontWeight.w400,
            color: NFColors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: NFColors.white,
          ),
        ),
      ),
      home: const Welcome(),
      getPages: routes.NetflixPages.pages,
      initialRoute: routes.NFRoutes.welcome,
      initialBinding: HomeBinding(),
    );
  }
}
