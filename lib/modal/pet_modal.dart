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
  int? vaccination = 1;
  int? spayed = 1;
  String? behaviour;
  String? anxiety;
  String? diet;
  int? weight = 1;
  int? notify = 1;

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
