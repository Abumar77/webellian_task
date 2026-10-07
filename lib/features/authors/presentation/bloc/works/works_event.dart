part of 'works_bloc.dart';

@freezed
sealed class WorksEvent with _$WorksEvent {
  const factory WorksEvent.requested() = WorksRequested;
  const factory WorksEvent.moreRequested() = MoreWorksRequested;
}
