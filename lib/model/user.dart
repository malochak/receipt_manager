class User {
  String email, password;

  User(this.email, this.password);

  String? validatePasswordMatching(String value) =>
      value != password ? "Potwierdzenie hasła nie jest takie samo." : null;
}
