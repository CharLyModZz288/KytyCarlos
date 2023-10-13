import 'package:cloud_firestore/cloud_firestore.dart';

class FbPost{


  final String titulo;
  final String Cuerpo;

  FbPost ({
    required this.titulo,
    required this.Cuerpo
  });

  factory FbPost.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FbPost(
        titulo: data?['titulo'],
        Cuerpo: data?['cuerpo']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (Cuerpo != null) "cuerpo": Cuerpo
    };
  }
}