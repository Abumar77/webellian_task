part of 'works_bloc.dart';

sealed class WorksEvent {}

final class WorksRequested extends WorksEvent {}

final class MoreWorksRequested extends WorksEvent {}
