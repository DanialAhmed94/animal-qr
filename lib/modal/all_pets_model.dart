class UserPet {
  final int id;
  final String name;
  final String? description;
  final String? parent1;
  final String? parent2;
  final String? phone;
  final String? location;
  final String? gender;
  final String? age;
  final String? petType;
  final String? breed;
  final String? dob;
  final String? weight;
  final String? instaId;
  final String? tiktokId;
  final String? uniqueId;
  final String? userId;
  final String? petCategory;
  final String? additionalBreed;
  final String? vaccinationStatus;
  final String? neuteredStatus;
  final String? behaviour;
  final String? anxiety;
  final String? diet;
  final String? notificationStatus;
  final String? address;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? createdAt;
  final String? updatedAt;

  UserPet({
    required this.id,
    required this.name,
    this.description,
    this.parent1,
    this.phone,
    this.parent2,
    this.location,
     this.gender,
    this.age,
    this.petType,
     this.breed,
     this.dob,
     this.weight,
     this.instaId,
     this.tiktokId,
     this.uniqueId,
     this.userId,
     this.petCategory,
    this.additionalBreed,
     this.vaccinationStatus,
     this.neuteredStatus,
     this.behaviour,
     this.anxiety,
     this.diet,
    this.notificationStatus,
    this.address,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
     this.createdAt,
     this.updatedAt,
  });

  factory UserPet.fromJson(Map<String, dynamic> json) {
    return UserPet(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      parent1: json['parent1'],
      phone: json['phone'],
      parent2: json['parent2'],
      location: json['location'],
      gender: json['gender'],
      age: json['age'],
      petType: json['pet_type'],
      breed: json['breed'],
      dob: json['dob'],
      weight: json['weight'],
      instaId: json['insta_id'],
      tiktokId: json['tiktok_id'],
      uniqueId: json['unique_id'],
      userId: json['user_id'],
      petCategory: json['pet_category'],
      additionalBreed: json['additional_breed'],
      vaccinationStatus: json['vaccination_status'],
      neuteredStatus: json['neutered_status'],
      behaviour: json['behaviour'],
      anxiety: json['anxiety'],
      diet: json['diet'],
      notificationStatus: json['notification_status'],
      address: json['address'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
