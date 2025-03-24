class Auth {
  final UserData user;
  final Role role;
  Auth(this.user, this.role);

  factory Auth.fromMap(Map<String, dynamic> json) {
    try {
      // Get the 'auth' value
      final user = UserData.fromMap(json["user"]);
      return Auth(
        user,
        json['role'] != null ? Role.values[json['role'] as int] : Role.member,
      );
    } catch (e) {
      print("Error in Auth.fromJson: $e");
      return Auth(
        UserData(
            status: AuthStatus.pending,
            name: "",
            mail: "",
            localGroup: "",
            userUid: ""),
        Role.member,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(), // Ruft die toMap-Funktion von UserData auf
      'role': role.index, // Speichert den Index des Enums
    };
  }
}

class UserData {
  final String name;
  final String mail;
  AuthStatus status = AuthStatus.pending;
  final String localGroup;
  final String userUid;

  UserData({
    required this.status,
    required this.name,
    required this.mail,
    required this.localGroup,
    required this.userUid,
  });

  factory UserData.fromMap(Map<Object?, Object?> json) {
    final map = json.map((key, value) => MapEntry(key.toString(), value));

    return UserData(
      name: map['name'] as String, // Provide default if null
      mail: map['mail'] as String? ?? '', // Provide default if null, allow null
      status: map['status'] != null
          ? AuthStatus.values[map['status'] as int]
          : AuthStatus.pending, // Handle enum conversion safely
      localGroup: map['localGroup'] as String? ??
          '', // Provide default if null, allow null
      userUid: map['userUid'] as String? ??
          '', // Provide default if null, allow null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mail': mail,
      'status': status.index, // Speichert den Index des Enums
      'localGroup': localGroup,
      'userUid': userUid,
    };
  }
}

enum AuthStatus { pending, confirmed }

enum Role { admin, member }
