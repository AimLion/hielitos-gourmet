import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hielitos_gourmet/upgrade.dart';
import 'package:hielitos_gourmet/values.dart';

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

void _verify() {
  menu.clear();
  menuA.clear();

  for (final item in items) { if (item.quantity != 0) { menu.add(item.name); } }
  for (final item in itemsA) { if (item.quantity != 0) { menuA.add(item.name); } }

  if (menu.length > 7 || menuA.length > 7){
    imageMenu = 'assets/images/image_menu_big.png';
  } else if ((menu.length > 4 && menu.length<= 7) || (menuA.length > 4 && menuA.length <= 7)){
    imageMenu = 'assets/images/image_menu.png';
  } else {
    imageMenu = 'assets/images/image_menu_small.png';
  }
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Inicia con azul en la esquina superior izquierda
                end: Alignment.topCenter, // Termina con blanco en la esquina inferior derecha
                colors: [
                  Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Color.fromARGB(28,27,31,50),
                  Colors.blueAccent, // Color blanco
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Scaffold(
                  body: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        screenWidth < 600 ?
                          Column(
                            children: [
                              Text("Hielitos", 
                                style: GoogleFonts.pacifico(
                                  textStyle: const TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text("Gourmet", 
                                style: GoogleFonts.pacifico(
                                  textStyle: const TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ):
                          Text("Hielitos Gourmet", 
                            style: GoogleFonts.pacifico(
                              textStyle: const TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _verify();
                                _showMenu();
                              },
                              child: const Text('Ver Menú',
                                style: TextStyle(
                                  fontSize: 20
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const Upgrade())),
                                child: const Text('Modificar Menú',
                                  style: TextStyle(
                                    fontSize: 20
                                  )
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, // Inicia con azul en la esquina superior izquierda
                end: Alignment.bottomCenter, // Termina con blanco en la esquina inferior derecha
                colors: [
                  Colors.white, // Color azul
                  Colors.blueAccent, // Color blanco
                ],
              ),
            ),
          )
        )
      ],
    );
  }

  Widget _text(String txt, [double? size]){
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Text(txt,
        style: TextStyle(
          color: Colors.black,
          fontSize: size ?? 18.0,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }

  void _showMenu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Menú de los Hielitos'),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.30,
                image: AssetImage(imageMenu),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              // VERSION ORIENTACIÓN
              child: SingleChildScrollView(
                child: OrientationBuilder(
                  builder: (context, orientation){
                    double screenWidth = MediaQuery.of(context).size.width;
                    if (screenWidth < 600) {//orientation == Orientation.portrait || 
                      return Container(
                        width: (screenWidth - 50),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: _text("Sabor Gourmet",23),
                            ),
                            Column(
                              children: menu.map((item) => _text(item)).toList()
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: _text("Sabor Frutal",23),
                            ),
                            Column(
                              children: menuA.map((item) => _text(item)).toList()
                            ),
                          ],
                        )
                      )
                      ;
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _text("Sabor Gourmet",23),
                                _text("Sabor Gourmet",23),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: menu.map((item) => _text(item)).toList()
                              ),
                              Column(
                                children:menuA.map((item) => _text(item)).toList()
                              )
                            ]
                          )
                        ],
                      );
                    }
                  },
                )
              )
              // VERSION 1
              // child: SingleChildScrollView(
              //   child:Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(top: 70),
              //         child: _text("Sabores",23)
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Column(
              //             children: menu.map((item) => _text(item)).toList()
              //           ),
              //           Column(
              //             children:menuA.map((item) => _text(item)).toList()
              //           )
              //         ]
              //       )
              //     ],
              //   )
              // )
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Compartir'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Descargar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
