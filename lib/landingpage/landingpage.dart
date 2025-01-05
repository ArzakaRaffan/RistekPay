import 'package:flutter/material.dart';
import 'package:ristekpay/loginpage/login.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _alignmentx = 0.0;
  double _alignmenty = -0.25;
  double _logowidth = 275.0;
  double _logoheight = 275.0;
  double _opacityRistekPay = 0.0;
  double _continueButton = 0.0;

  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (!isAnimated) {
              isAnimated = true;
              _alignmentx = -1.0;
              _alignmenty = -0.2;
              _logowidth = 150.0;
              _logoheight = 150.0;
            }
          });

          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _opacityRistekPay = 1.0;
            });
          });

          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _continueButton = 1.0;
            });
          });
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: Alignment(_alignmentx, _alignmenty),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: _logowidth,
                height: _logoheight,
                child: Image.asset(
                  'assets/LogoR.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacityRistekPay,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const Align(
                alignment: Alignment(-0.73, 0.1),
                child: Text(
                  'RISTEK PAY',
                  style: TextStyle(
                      color: Color.fromARGB(255, 80, 56, 188),
                      fontFamily: 'Inter',
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacityRistekPay,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: const Align(
                alignment: Alignment(-0.65, 0.2),
                child: Text(
                  '#RemarkableEscalation',
                  style: TextStyle(
                      color: Color.fromARGB(255, 80, 56, 188),
                      fontFamily: 'Inter',
                      fontSize: 20),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _continueButton,
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              child: Align(
                alignment: Alignment(0.0, 0.5),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 80, 56, 188),
                      padding: const EdgeInsets.symmetric(horizontal: 100 , vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.9),
              child: const Text(
                'RISTEK Fasilkom UI',
                style: TextStyle(fontFamily: "Inter", fontSize: 13, color: Color.fromARGB(255, 80, 56, 188), fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.93),
              child: const Text(
                'All Rights Reserved ©',
                style: TextStyle(fontFamily: "Inter", fontSize: 10, color: Color.fromARGB(255, 80, 56, 188), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
