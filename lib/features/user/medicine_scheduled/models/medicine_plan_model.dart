class MedicinePlanModel {
  final String medicineName;
  final int time;
  final int perDay;
  final String userId;

  MedicinePlanModel(
      {required this.medicineName,
      required this.time,
      required this.perDay,
      required this.userId});
  factory MedicinePlanModel.fromJson(Map<String, dynamic> json) {
    return MedicinePlanModel(
        medicineName: json['medicine_name'],
        time: json['time'],
        perDay: json['per_day'],
        userId: json['user_id']);
  }
  toJson() => {
        'medicine_name': medicineName,
        'time': time,
        'per_day': perDay,
        'user_id': userId
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'MedicinePlanModel(medicineName: $medicineName, time: $time, perDay: $perDay, userId: $userId)';
  }
}
