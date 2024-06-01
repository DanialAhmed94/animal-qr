class Pet {
  int? userId;
  String? hiddenId;
  String? petName;
  String? petDob;
  String? petGender;
  String? petType;
  String? petBreed;
  String? petImage;
  String? instagramUsername;
  String? tiktokUsername;
  bool? vaccination = true;
  bool? spayed = true;
  String? behaviour;
  String? anxiety;
  String? diet;
  int? weight = 1;
  bool? notify = true;

  Pet({
    this.userId,
    this.hiddenId,
     this.petName,
     this.petDob,
     this.petGender,
     this.petType,
    this.petBreed,
    this.petImage,
    this.instagramUsername,
    this.tiktokUsername,
    this.vaccination,
    this.spayed,
    this.behaviour,
    this.anxiety,
    this.diet,
    this.weight,
    this.notify,
  });
}
