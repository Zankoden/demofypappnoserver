import 'package:demofypappnoserver/views/dash_board_screen.dart';
import 'package:flutter/material.dart';

import '../preview_views/preview_dashboard_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      Transform.rotate(
                        angle: 0.5,
                        child: Card(
                          elevation: 10,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Card(
                        elevation: 10,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 100,
                          height: 100,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Container(
                margin: const EdgeInsets.only(left: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " Let's Get \n Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      " Stay hungry, stay foolish omnis iste natsu \n error sit volupatatem",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 40),
                    // Row(
                    //   children: [
                    //     const SizedBox(width: 16),
                    //     Container(
                    //       margin: const EdgeInsets.only(left: 70),
                    //       height: 50,
                    //       width: 160,
                    //       decoration: const BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(10))),
                    //       child: const Padding(
                    //         padding: EdgeInsets.all(14.0),
                    //         child: Text(
                    //           "Preview",
                    //           style: TextStyle(
                    //             color: Colors.red,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w900,
                    //           ),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return PreviewDashBoard();
                              }),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 160,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                "Preview",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16),
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return DashboardScreen();
                              }),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 25),
                            height: 50,
                            width: 160,
                            decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                "Debug Mode",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 160,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16),
                        const Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          height: 50,
                          width: 160,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
