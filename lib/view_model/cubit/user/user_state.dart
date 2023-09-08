part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserDataLoading extends UserState {}

class UserDataSuccess extends UserState {}

class UserDataFail extends UserState {}
