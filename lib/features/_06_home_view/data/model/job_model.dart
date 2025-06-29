class JobModel {
  final int id;
  final int jobId;
  final String? title;
  final String? description;
  final String? requirements;
  final String? salary;
  final String? url;
  final String? level;
  final String? location;
  final String? workModel;
  final String? jobType;
  final String? jobDetails;
  final String? jobResponsibilities;
  final String? company;

  JobModel({
    required this.id,
    required this.jobId,
    this.title,
    this.description,
    this.requirements,
    this.salary,
    this.url,
    this.level,
    this.location,
    this.workModel,
    this.jobType,
    this.jobDetails,
    this.jobResponsibilities,
    this.company,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: json["id"] ?? 0,
    jobId: json["jobId"] ?? 0,
    title: json["title"],
    description: json["description"],
    requirements: json["requirements"],
    salary: json["salary"],
    url: json["url"],
    level: json["level"],
    location: json["location"],
    workModel: json["workModel"],
    jobType: json["jobType"],
    jobDetails: json["jobDetails"],
    jobResponsibilities: json["jobResponsibilities"],
    company: json["company"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jobId": jobId,
    "title": title,
    "description": description,
    "requirements": requirements,
    "salary": salary,
    "url": url,
    "level": level,
    "location": location,
    "workModel": workModel,
    "jobType": jobType,
    "jobDetails": jobDetails,
    "jobResponsibilities": jobResponsibilities,
    "company": company,
  };
}