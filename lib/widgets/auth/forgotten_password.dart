import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/widgets/components/button.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/components/input.dart';
import 'package:mostaza/widgets/components/leading.dart';

class Forgotten extends StatelessWidget {
  final controllerInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final int type;
  final VoidCallback onBackPressed;

  Forgotten({Key key, @required this.type, @required this.onBackPressed})
      : super(key: key);

  Widget _field() {
    if (this.type == 0) {
      return Input(
          hintText: 'Correo Electrónico',
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor ingrese su correo electrónico';
            } else if (!value.contains('@')) {
              return 'Por favor ingrese un correo electrónico válido';
            }
            return null;
          },
          controller: this.controllerInput,
          inputType: TextInputType.emailAddress,
          icon: Icon(
            AppIcons.email,
            size: 20.0,
          ));
    } else {
      return Input(
          hintText: 'Número de empleado',
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor ingrese su número de empleado';
            }
            return null;
          },
          controller: this.controllerInput,
          inputType: TextInputType.number,
          icon: Icon(
            AppIcons.fingerprint,
            size: 20.0,
          ));
    }
  }

  String _description() {
    return this.type == 0
        ? 'Ingresa tu correo electrónico para recibir un enlace de restablecimiento de contraseña'
        : 'Ingresa tu número de empleado para recibir un enlace de restablecimiento de contraseña';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Header(
            title: 'RECUPERAR CONTRASEÑA',
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.dixie,
            ),
            onPressed: this.onBackPressed,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Leading(
                        title: 'Reestablece tu contraseña',
                        description: _description(),
                        imagePath: 'assets/images/password_logo.png'),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: _field()),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Button(
                              height: 52.0,
                              color: AppColors.dixie,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  // TODO forgotten stuff according to type
                                }
                              },
                              child: Text(
                                'ACEPTAR',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
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
