import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: _dark.value ? Colors.black : Colors.white,
                appBar: AppBar(
                  actions: [
                    Switch(
                      value: _dark.value,
                      onChanged: (value) {
                        _dark.value = value;
                      },
                    ),
                    DropdownButton<double>(
                      value: _widthFactor.value,
                      onChanged: (value) {
                        _widthFactor.value = value!;
                      },
                      items: [
                        DropdownMenuItem<double>(
                          value: 0.5,
                          child: Text('Size: 50%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 0.75,
                          child: Text('Size: 75%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.0,
                          child: Text('Size: 100%'),
                        ),
                      ],
                    ),
                  ],
                ),
                body: Center(
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width * _widthFactor.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [VersiculoDeInicioScreen()],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class VersiculoDeInicioScreen extends StatelessWidget {
  const VersiculoDeInicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 390,
        height: 844,
        decoration: const BoxDecoration(color: Color(0xFF000513)),
        child: Stack(
          children: [
            // Fondo de estrellas personalizado
            Positioned.fill(
              child: Image.asset('lib/Imagenes/primeros_pasos/Fondo.png', fit: BoxFit.cover),
            ),
            // Botón de retroceso
            Positioned(
              left: 12,
              top: 18,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            // Botón de volumen
            Positioned(
              right: 12,
              top: 18,
              child: Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            // Imagen central cuadrada personalizada
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('lib/Imagenes/primeros_pasos/Logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Texto del versículo
            Positioned(
              left: 24,
              right: 24,
              top: 300,
              child: Column(
                children: [
                  Text(
                    '“Este es el pan bajado del cielo;\nno como el que comieron vuestros padres, y murieron; el que coma este pan vivirá para siempre..”',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFEFEFEF),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'SAN JUAN 6,58',
                    style: const TextStyle(
                      color: Color(0xFFEFEFEF),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      letterSpacing: 2.02,
                    ),
                  ),
                ],
              ),
            ),
            // Barra de progreso
            Positioned(
              left: 39,
              right: 39,
              top: 610,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 65,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            // Botón Continuar
            Positioned(
              left: 38,
              right: 38,
              bottom: 48,
              child: SizedBox(
                width: 314,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, -0.01),
                        end: Alignment(-1, 0.01),
                        colors: [
                          Color(0xFF563FE4),
                          Color(0xFFD7763F),
                          Color(0xFFF04094),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 314,
                      height: 48,
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
