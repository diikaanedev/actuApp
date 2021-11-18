

class ArticleModel {
  
  final String id ;

  final String title ;

  final bool isActif ;
  final bool isUne ;

  final String body ;
  final String categorie ;

  final String urlPhoto ;

  ArticleModel({
    required this.id ,
    required this.title,
    required this.body,
    required this.categorie,
    required this.isActif,
    required this.isUne,
    required this.urlPhoto
  });


  static List<ArticleModel> fromJson({required List listeArticle}) {
    List<ArticleModel> liste = [];
   
    for (var item in listeArticle) {
    
      liste.add(
        ArticleModel(
          id: item['id'] , 
          title: item['attributes']['title'], 
          body:  "",//item['attributes']['body']['value'], 
          // ignore: prefer_if_null_operators
          categorie:  item['relationships']['field_rubrique']['data'] == null  ? "" : item['relationships']['field_rubrique']['data']['id']  , 
          isActif: true, 
          isUne: item['attributes']['field_a_la_une'] == "OUI", 
          urlPhoto: item['relationships']['field_media_image_fields']['data']==null ? "": item['relationships']['field_media_image_fields']['data']['id']      
          ));
    }
    return liste;
  }

}