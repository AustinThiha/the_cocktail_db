class Cocktail {
  late String strDrink;
  late String strDrinkThumb;
  late String idDrink;

  Cocktail(
      {required this.strDrink,
      required this.strDrinkThumb,
      required this.idDrink});

  Cocktail.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['strDrink'] = strDrink;
    data['strDrinkThumb'] = strDrinkThumb;
    data['idDrink'] = idDrink;
    return data;
  }
}
