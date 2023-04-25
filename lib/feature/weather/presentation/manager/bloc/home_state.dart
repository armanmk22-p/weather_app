part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CwStatus cwStatus;

  HomeState({
    required this.cwStatus,
  });

  HomeState copyWith({
    CwStatus? newCwStatus,
  }) {
    return HomeState(
      cwStatus: newCwStatus ?? this.cwStatus,
    );
  }

  @override
  List<Object?> get props => [cwStatus];
}
