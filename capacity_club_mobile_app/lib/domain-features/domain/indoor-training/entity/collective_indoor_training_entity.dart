class CollectiveIndoorTrainingEntity {
  String workoutName;
  String date;
  String startTime;
  String endTime;
  int totalSlots;
  int registeredSlots;
  bool isUserRegistered;
  bool isCollective;

  CollectiveIndoorTrainingEntity(
      {required this.workoutName,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.totalSlots,
      required this.registeredSlots,
      required this.isUserRegistered,
      required this.isCollective});

  factory CollectiveIndoorTrainingEntity.empty() {
    return CollectiveIndoorTrainingEntity(
        workoutName: '',
        date: '',
        startTime: '',
        endTime: '',
        totalSlots: 0,
        registeredSlots: 0,
        isUserRegistered: false,
        isCollective: false);
  }
}
