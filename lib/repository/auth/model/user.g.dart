// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      email: json['email'] as String,
      username: json['username'] as String,
      portfolioName: json['portfolio_name'] as String,
      uid: json['uid'] as String,
      portfolio: json['portfolio'] as List<dynamic>,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'portfolio_name': instance.portfolioName,
      'portfolio': instance.portfolio,
      'profile_image': instance.profileImage,
    };
