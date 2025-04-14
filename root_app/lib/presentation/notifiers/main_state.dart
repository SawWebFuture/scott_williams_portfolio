enum MainStatus {
  login,
  home,
  loading,
}

class MainState {
  final MainStatus status;
  final String name;
  final String errorMessage;

  MainState({
    required this.status,
    this.name = '',
    this.errorMessage = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          name == other.name &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => status.hashCode ^ name.hashCode ^ errorMessage.hashCode;

  MainState copyWith({
    MainStatus? status,
    String? name,
    String? errorMessage,
  }) {
    return MainState(
      status: status ?? this.status,
      name: name ?? this.name,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
