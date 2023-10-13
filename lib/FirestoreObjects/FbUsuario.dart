import 'package:cloud_firestore/cloud_firestore.dart';

class FbUsuario{

  final String Nombre;
  final int edad;
  final double altura;
  final String colorPelo;

  FbUsuario ({
    required this.Nombre,
    required this.edad,
    required this.altura,
    required this.colorPelo
  });

  factory FbUsuario.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FbUsuario(
        Nombre: data?['nombre'],
      edad: data?['edad'] != null ?data! ['edad']:0,
      altura: data?['altura'] != null ?data! ['altura']:0,
      colorPelo:data?['colorPelo'] != null ?data! ['colorPelo']:""
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (Nombre != null) "nombre": Nombre,
      if (edad != null) "edad": edad,
      if (altura != null) "altura": altura,
      if (colorPelo != null) "colorPelo": colorPelo,
    };
  }

}