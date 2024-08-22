class RPet {
  int? id;
  String name;
  String? description;
  String? parent1;
  String? phone;
  String? parent2;
  String? location;
  String? gender; // Assuming gender is always provided
  String? age;
  String? petType;
  String? breed; // Assuming breed is always provided
  String? dob; // Assuming dob is always provided
  String? weight; // Assuming weight is always provided
  String? instaId;
  String? tiktokId;
  String uniqueId; // Assuming uniqueId is always provided
  String? userId; // Assuming userId is always provided
  String? petCategory; // Assuming petCategory is always provided
  String? additionalBreed;
  String? vaccinationStatus;
  String? neuteredStatus;
  String? behaviour; // Assuming behaviour is always provided
  String? anxiety; // Assuming anxiety is always provided
  String? diet; // Assuming diet is always provided
  String? notificationStatus;
  String? address;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? createdAt; // Assuming createdAt is always provided
  String? updatedAt; // Assuming updatedAt is always provided

  RPet({
    required this.id,
    required this.name,
    this.phone,
     this.gender,
     this.breed,
     this.dob,
     this.weight,
    required this.uniqueId,
     this.userId,
     this.petCategory,
     this.behaviour,
     this.anxiety,
     this.diet,
     this.createdAt,
     this.updatedAt,
    this.description,
    this.parent1,
    this.parent2,
    this.location,
    this.age,
    this.petType,
    this.instaId,
    this.tiktokId,
    this.additionalBreed,
    this.vaccinationStatus,
    this.neuteredStatus,
    this.notificationStatus,
    this.address,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
  });

  RPet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        parent1 = json['parent1'],
        phone = json['phone'],
        parent2 = json['parent2'],
        location = json['location'],
        gender = json['gender'],
        age = json['age'],
        petType = json['pet_type'],
        breed = json['breed'],
        dob = json['dob'],
        weight = json['weight'],
        instaId = json['insta_id'],
        tiktokId = json['tiktok_id'],
        uniqueId = json['unique_id'],
        userId = json['user_id'],
        petCategory = json['pet_category'],
        additionalBreed = json['additional_breed'],
        vaccinationStatus = json['vaccination_status'],
        neuteredStatus = json['neutered_status'],
        behaviour = json['behaviour'],
        anxiety = json['anxiety'],
        diet = json['diet'],
        notificationStatus = json['notification_status'],
        address = json['address'],
        image1 = json['image1'],
        image2 = json['image2'],
        image3 = json['image3'],
        image4 = json['image4'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
