

class CategorieModel {
  
  final String id ;

  final String title ;


  CategorieModel({
    required this.id ,
    required this.title,
  });


  static List<CategorieModel> fromJson({required List listeCategorie}) {
    List<CategorieModel> liste = [];
    for (var item in listeCategorie) {

      liste.add(
        CategorieModel(
          id: item['id'] , 
          title: item['attributes']['name'], 
             
          ));
    }
    return liste;
  }

}