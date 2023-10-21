import 'dart:math';

class Propriete {
  final int metreCarre;
  final int nbChambre;
  final double prix;
  final bool vendre;
  final bool appartement;

  Propriete({required this.metreCarre, required this.nbChambre, required this.prix, this.vendre = false, this.appartement = false});
}
final defaultPropriete = _createProps();

List<Propriete> _createProps(){
  final listeVendre = List.generate(10, (index) =>Propriete(metreCarre: Random().nextInt(300), nbChambre: 1+Random().nextInt(10), prix:5000+Random().nextDouble()*(100000-5000),vendre: true));
  final listeLouer = List.generate(10, (index) =>Propriete(metreCarre: Random().nextInt(300), nbChambre: 1+Random().nextInt(10), prix:5000+Random().nextDouble()*(100000-5000),appartement: true));
  return [...listeLouer,...listeVendre];
}



