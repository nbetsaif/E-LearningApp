class RegisterModel{
  late String nom;
  late String prenom;
  late String uid;
  late String age;
  late dynamic score;
  late List<dynamic> scoresMath;
  late List<dynamic> scoresArabic;


  RegisterModel({
    required this.nom,
    required this.prenom,
    required this.age,
    required this.uid,
    this.score=0,
    required this.scoresMath,
    required this.scoresArabic
});
  RegisterModel.fromJson(Map<String,dynamic> json)
  {
    nom=json['nom'];
    prenom=json['prenom'];
    age=json['age'];
    uid=json['uid'];
    scoresMath=json['scoresMath'];
    scoresArabic=json['scoresArabic'];
    score=json['score'];
  }


  Map<String,dynamic> toMap(){
    return
      {
        'nom':nom,
        'prenom':prenom,
        'age':age,
        'uid':uid,
        'score':score,
        'scoresMath':scoresMath,
        'scoresArabic':scoresArabic
      };
  }
}