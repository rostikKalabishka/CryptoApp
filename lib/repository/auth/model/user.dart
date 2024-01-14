import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserDetails extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String portfolioName;
  final List portfolio;
  final String? profileImage;
  final double balance;

  const UserDetails(
      {required this.email,
      required this.username,
      required this.portfolioName,
      required this.uid,
      required this.portfolio,
      required this.profileImage,
      required this.balance});

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  List<Object?> get props =>
      [uid, email, username, portfolio, profileImage, portfolioName, balance];
}
