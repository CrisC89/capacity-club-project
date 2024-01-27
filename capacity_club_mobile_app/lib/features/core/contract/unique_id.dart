class UniqueId {
  final String id;

  const UniqueId._(this.id);

  factory UniqueId.fromString(String id) {
    return UniqueId._(id);
  }
}

class CredentialId extends UniqueId {
  const CredentialId._(id) : super._(id);

  factory CredentialId.fromString(String id) {
    return CredentialId._(id);
  }
}

class MemberId extends UniqueId {
  const MemberId._(id) : super._(id);

  factory MemberId.fromString(String id) {
    return MemberId._(id);
  }
}

class AddressId extends UniqueId {
  const AddressId._(id) : super._(id);

  factory AddressId.fromString(String id) {
    return AddressId._(id);
  }
}

class CollectiveTrainingSessionId extends UniqueId {
  const CollectiveTrainingSessionId._(id) : super._(id);

  factory CollectiveTrainingSessionId.fromString(String id) {
    return CollectiveTrainingSessionId._(id);
  }
}

class CollectiveTrainingId extends UniqueId {
  const CollectiveTrainingId._(id) : super._(id);

  factory CollectiveTrainingId.fromString(String id) {
    return CollectiveTrainingId._(id);
  }
}

class PersonnalTrainingId extends UniqueId {
  const PersonnalTrainingId._(id) : super._(id);

  factory PersonnalTrainingId.fromString(String id) {
    return PersonnalTrainingId._(id);
  }
}

class WorkoutId extends UniqueId {
  const WorkoutId._(id) : super._(id);

  factory WorkoutId.fromString(String id) {
    return WorkoutId._(id);
  }
}

class TrainingId extends UniqueId {
  const TrainingId._(id) : super._(id);

  factory TrainingId.fromString(String id) {
    return TrainingId._(id);
  }
}
