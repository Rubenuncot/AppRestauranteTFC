import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif',),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                child: 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const FadeInImage(
                      placeholder: AssetImage('utils/images/imagePlaceHolder.gif'), 
                      image: AssetImage('utils/images/imagePlaceHolder.gif'),
                      fit: BoxFit.fill,
                    ),
                  )
              ),
              const SizedBox(height: 50,),
              SizedBox(
                width: size.width / 2,
                child: 
                  ElevatedButton(
                    onPressed: () async {

                      // Navigator.pushNamed(context, '_main');
                      // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#1C4C96", "Cancelar", false, ScanMode.QR);
                      // if(barcodeScanRes == 'hola'){
                      //   Navigator.pushNamedAndRemoveUntil(context, '_main', (route) => false);
                      // }
                      Navigator.pushNamedAndRemoveUntil(context, '_main', (route) => false);
                    },
                      
                    child: const Text('Iniciar Sesión'),
                  ),
              ),
            ],
          ),]
      ),
    );
  }
}