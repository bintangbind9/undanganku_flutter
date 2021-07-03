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
    galleries: 7,
    greetings: 12,
  ),
  Users(
    name: 'Bulan Putri',
    email: 'bulan@gmail.com',
    pass: '1234',
    image: 'bulan.png',
    status: 'Free',
    template: 'Real Wedding',
    guests: 21,
    galleries: 2,
    greetings: 5,
  ),
];