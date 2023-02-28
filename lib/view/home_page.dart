import 'package:flutter/material.dart';
import 'package:oyinlar/provider/home_provider.dart';
import 'package:oyinlar/view/history.dart';
import 'package:provider/provider.dart';// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  int redCar = 0;
  int bluCar = 0;
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            children: [
              InkWell(
                onTap: () {
                  homeProvider.onFerrariGamerTop();
                  if (homeProvider.isRedGamerWin) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Ferrari win"),
                          content: SizedBox(
                            height: 230,
                            child: Column(
                              children: [Image.asset("assets/winner.gif")],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                redCar++;
                                homeProvider.restartGame();
                                Navigator.pop(context);
                              },
                              child: const Text("Restart"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                redCar++;
                                homeProvider.historyGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return History(
                                          redGamewinner: redCar,
                                          blueGamewinner: bluCar);
                                    }),
                                  ),
                                );
                              },
                              child: const Text("History"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      homeProvider.redGamer,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.wallpaperscraft.ru/image/single/ferrari_krasnyj_avto_sport_95424_1680x1050.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  homeProvider.onTeslaGamerTop();
                  if (homeProvider.isBlueGamerWin) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Tesla win"),
                          content: SizedBox(
                            height: 230,
                            child: Column(
                              children: [Image.asset("assets/winner.gif")],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                bluCar++;
                                homeProvider.restartGame();
                                Navigator.pop(context);
                              },
                              child: const Text("Restart"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                homeProvider.historyGame();
                                bluCar++;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return History(
                                          redGamewinner: redCar,
                                          blueGamewinner: bluCar);
                                    }),
                                  ),
                                );
                              },
                              child: const Text("History"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      homeProvider.blueGamer,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.bmwblog.com/wp-content/uploads/2022/06/BMW-i7-10.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}