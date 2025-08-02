import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

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
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width * _widthFactor.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [AjustesPerfilMenuScreen()],
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

class AjustesPerfilMenuScreen extends StatelessWidget {
  const AjustesPerfilMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.white),
            title: const Text(
              'Editar Perfil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Notificaciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.church_outlined, color: Colors.white),
            title: const Text(
              'Parroquias',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.card_membership_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Administrar Suscripción',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.white),
            title: const Text(
              'Ayuda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.white),
            title: const Text(
              'Idioma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.description_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Condiciones del Servicio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Política de Privacidad',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Administrar Recordatorio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text(
              'Cerrar Sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: const Text(
              'Eliminar Cuenta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Versión de la Aplicación: 1.0.0',
              style: TextStyle(
                color: Color(0xFFC2C2C2),
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
