import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {
  final String titulo;
  final Widget contenido;
  final IconData? icono;
  final Color? iconColor;
  final Color? bakcgorundColor;

  const AlertDialogCustom({
    super.key,
    required this.titulo,
    required this.contenido,
    this.icono,
    this.iconColor,
    this.bakcgorundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bakcgorundColor,
      // icon: Icon(icono, size: 120, color: iconColor,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(30)),
      title: Center(child: Text(titulo)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icono != null)
            Icon(
              icono,
              size: 120,
              color: iconColor,
            ),
          contenido,
          const SizedBox(
            height: 5,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar',
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
