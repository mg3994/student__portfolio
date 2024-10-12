// Student summary model
class StudentSummary {
  final String studentName;
  final String summaryText;
  final String teacherName;
  final String imageUrl;
  final Grade grade;

  StudentSummary({
    required this.studentName,
    required this.summaryText,
    required this.teacherName,
    required this.imageUrl,
    required this.grade,
  });
}

// Dummy static data
List<StudentSummary> studentSummaries = [
  StudentSummary(
    studentName: 'Al-Baigi Samaan',
    summaryText: 'Rangkuman singkat \ndalam Bahasa Sunda.',
    teacherName: 'Bapak Samaan',
    imageUrl: 'assets/1.png',
    grade: Grade.A,
  ),
  StudentSummary(
      studentName: 'Zhare Amara',
      summaryText: 'Ringkasan teks \n panjang menjadi singkat.',
      teacherName: 'Ibu Amara',
      imageUrl: 'assets/2.png',
      grade: Grade.A),
  StudentSummary(
      studentName: 'Afiq Zhara',
      summaryText: 'Rangkuman Bahasa \nSunda dengan gaya yang bagus.',
      teacherName: 'Pak Zhara',
      imageUrl: 'assets/3.png',
      grade: Grade.A),
  StudentSummary(
      studentName: 'Fauzan Ramdan',
      summaryText: 'Siswa merangkum \ncerita panjang dengan efektif.',
      teacherName: 'Pak Ramdan',
      imageUrl: 'assets/4.png',
      grade: Grade.A),
  StudentSummary(
      studentName: 'Yusuf Ahmad',
      summaryText: 'Rangkuman dengan \npemahaman tinggi terhadap teks asli.',
      teacherName: 'Ibu Ahmad',
      imageUrl: 'assets/5.png',
      grade: Grade.F),
];

enum Grade { A, B, C, D, E, F }
