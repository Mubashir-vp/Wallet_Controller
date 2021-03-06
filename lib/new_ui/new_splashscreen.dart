import 'package:flutter/material.dart';
import 'package:wallet_controller/widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Newsplashscreen extends StatefulWidget {
  const Newsplashscreen({Key? key}) : super(key: key);

  @override
  _NewsplashscreenState createState() => _NewsplashscreenState();
}

bool isLoggedIn = false;
const IS_LOGGEDIN = 'loggedin';

trueFunction() async {
  final sharedPreference = await SharedPreferences.getInstance();
  sharedPreference.setBool(IS_LOGGEDIN, true);
}

class _NewsplashscreenState extends State<Newsplashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkButtonSwitched();
  }

  Future<void> checkButtonSwitched() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    final logeedin = sharedPreference.getBool(IS_LOGGEDIN);
    if (logeedin == true) {
      Navigator.pushReplacementNamed(context, "Home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: obj.yellow,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
            ),
            img(),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Your Wallet\nControl In\nOne App.",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: obj.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => setState(() {
                isLoggedIn == true;
                trueFunction();
                checkButtonSwitched();
              }),
              child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: obj.black),
                  margin: const EdgeInsets.only(left: 80, right: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: obj.Primarywhite),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: obj.Primarywhite,
                        size: 34.77,
                      )
                    ],
                  )),
            ),
            Divider()
          ],
        ),
      ),
    ));
  }

  Route _createRoute({required Widget child}) {
    return PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
              scale: animation,
              child: child,
            ));
  }
}



//onTap: () =>
            //    Navigator.push(context, _createRoute(child: Homepage())),