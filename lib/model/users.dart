class Users {
  String name;
  String email;
  String pass;
  String image;
  String status;
  String template;
  int guests;
  int galleries;
  int greetings;
  List<String> imgGalleries;

  Users ({
    required this.name,
    required this.email,
    required this.pass,
    required this.image,
    required this.status,
    required this.template,
    required this.guests,
    required this.galleries,
    required this.greetings,
    required this.imgGalleries,
  });
}

var userList = [
  Users(
    name: 'Bintang Saputra',
    email: 'bintang@gmail.com',
    pass: '1234',
    image: 'bintang.png',
    status: 'Starred',
    template: 'Elegant',
    guests: 35,
    galleries: 3,
    greetings: 12,
    imgGalleries: [
      'bintang1.jpg',
      'bintang2.jpg',
      'bintang3.jpg',
    ],
  ),
  Users(
    name: 'Bulan Putri',
    email: 'bulan@gmail.com',
    pass: '1234',
    image: 'bulan.png',
    status: 'Free',
    template: 'Real Wedding',
    guests: 21,
    galleries: 4,
    greetings: 5,
    imgGalleries: [
      'bulan1.jpg',
      'bulan2.jpg',
      'bulan3.jpg',
      'bulan4.jpg',
    ],
  ),
];