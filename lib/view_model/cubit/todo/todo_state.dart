part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoDataLoading extends TodoInitial {}

class TodoDataSuccess extends TodoInitial {}

class TodoDataFail extends TodoInitial {}

class GetRandomQuote extends TodoInitial {}

class LoadMoreData extends TodoInitial {}

class FilterData extends TodoInitial {}
