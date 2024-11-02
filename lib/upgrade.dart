import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hielitos_gourmet/values.dart';

class Upgrade extends StatefulWidget {
  const Upgrade({super.key, });

  @override
  State<Upgrade> createState() => _UpgradeState();
}

class _UpgradeState extends State<Upgrade> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Inicia con azul en la esquina superior izquierda
                end: Alignment.topCenter, // Termina con blanco en la esquina inferior derecha
                colors: [
                  Colors.white, // Color azul
                  Colors.blueAccent, // Color blanco
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Scaffold(
            body: Center(
              child:  SingleChildScrollView(
                child: OrientationBuilder(
                  builder: (context, orientation){
                    double screenWidth = MediaQuery.of(context).size.width;
                    if(screenWidth < 600) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _txtTitulo(),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Inventario",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    _tablaSabores(0),
                                    const Padding(padding: EdgeInsets.all(20)),
                                    _tablaSabores(1)
                                  ],
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: _listaBotones()
                              )
                            ],
                          )
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         _txtTitulo(),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Inventario",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _tablaSabores(0),
                                    _tablaSabores(1)
                                  ],
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: _listaBotones()
                              )
                            ],
                          )
                        ],
                      );
                    }
                  }
                )
              )
            ),
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment
                    .topCenter, // Inicia con azul en la esquina superior izquierda
                end: Alignment
                    .bottomCenter, // Termina con blanco en la esquina inferior derecha
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

  Widget _txtTitulo(){
    return Text("Hielitos Gourmet", 
      style: GoogleFonts.pacifico(
        textStyle: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _listaBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Row(
            children: [
              Icon(Icons.chevron_left_outlined),
              Text('Regresar', style: TextStyle(fontSize: 18)),
            ],
          )
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Iniciar día', style: TextStyle(fontSize: 18)),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Cerrar día', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  List<DataColumn> columna = const [
    DataColumn(
      label: Text(
        'Sabores',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    DataColumn(
      label: Text(
        'Cantidad',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  List<DataRow> _filasG() {
    return items.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (item.quantity > 0) {
                    setState(() {
                      item.quantity--;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_left,size: 35),
              ),
              Text(item.quantity.toString()),
              IconButton(
                onPressed: () {
                  if (item.quantity < 50) {
                    setState(() {
                      item.quantity++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right,size: 35),
              ),
            ],
          ),
        ),
      ]);
    }).toList();
  }

  List<DataRow> _filasA() {
    return itemsA.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (item.quantity > 0) {
                    setState(() {
                      item.quantity--;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_left,size: 35),
              ),
              Text(item.quantity.toString()),
              IconButton(
                onPressed: () {
                  if (item.quantity < 50) {
                    setState(() {
                      item.quantity++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right,size: 35),
              ),
            ],
          ),
        ),
      ]);
    }).toList();
  }

  // VERSIÓN 1
  // List<DataRow> _filas() { 
  //   late List<DataRow> filas = [];
  //   for(int x = 0; x < items.length; x++){
  //     int cant = items[x][1];
  //     filas.add(
  //       DataRow(cells: [
  //         DataCell(
  //           Text(items[x][0].toString(),
  //             style: const TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         DataCell(
  //           Row(
  //             children: [
  //               IconButton(
  //                 onPressed: () {
  //                   if(cant != 0){
  //                     cant++;
  //                     //widget.counterModel.increment();
  //                   }
  //                   items[x][1] = cant;
  //                 },
  //                 icon: const Icon(Icons.arrow_left)
  //               ),
  //               Text(items[x][1].toString()),
  //               IconButton(
  //                 onPressed: () {
  //                   if(cant != 50){
  //                     cant--;
  //                     //widget.counterModel.decrement();
  //                   }
  //                   items[x][1] = cant;
  //                 },
  //                 icon: const Icon(Icons.arrow_right)
  //               )
  //             ],
  //           )
  //         )
  //       ])
  //     );
  //   }
  //   return filas;
  // }

  Widget _tablaSabores(int id){
     return DataTable(
      border: TableBorder.all(
        //color: DefaultTutuliColorPalette.gris300,
        width: 1,
        borderRadius: const BorderRadius.all(Radius.circular(3))
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            //color: DefaultTutuliColorPalette.maestrosSecondary,
            blurRadius: 3,
            offset: Offset(0, 2)
          ),
        ],
      ),
      headingRowHeight: 35,
      // headingRowColor: MaterialStateProperty.resolveWith((states) {
      //   return DefaultTutuliColorPalette.maestrosLight;
      // }),
      columnSpacing: 15,
      columns: columna,
      rows: id == 0 ? _filasG() : _filasA()
    );
    
  }
}
