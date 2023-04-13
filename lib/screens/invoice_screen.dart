import 'dart:ffi';

import 'package:app_restaurante/theme/app_theme.dart';
import 'package:app_restaurante/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Facturas'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          BackGround(size: size, image: AppTheme.backgroundImage),
          Container(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ZoomTapAnimation(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 150,
                  child: Stack(
                    children: [
                      Container(
                        // Background
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(15),
                            color:const Color.fromARGB(
                                226, 255, 255, 255)),
                      ),
                      Column(
                        //Content
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text.rich(
                              TextSpan(text: 'Factura: ', children: [
                                TextSpan(
                                    text: '1502c11200',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic)),
                              ]),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _invoiceCardContent(
                                                'Restaurante: ', 'Nombre'),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            _invoiceCardContent(
                                                'Empresa: ', 'Nombre'),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            _invoiceCardContent(
                                                'Fecha: ', 'Fecha'),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                    child: _invoiceCardContent(
                                        'Total: ', '150.0€'))
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                        113, 130, 176, 211))),
                                    child: const Text('Ver Factura'),
                                  ),
                                  const Divider(),
                                  TextButton(
                                      onPressed: () {},
                                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                          255, 196, 255, 204))),
                                      child: const Text('Editar Factura', style: TextStyle(color: Colors.green),)),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Text _invoiceCardContent(String title, String content) {
    return Text.rich(
      TextSpan(text: title, children: [
        TextSpan(
            text: content,
            style: const TextStyle(
                fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)),
      ]),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
