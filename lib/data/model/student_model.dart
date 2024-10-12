// Student summary model
class StudentSummary {
  final String studentName;
  final String summaryText;
  final String teacherName;
  final String imageUrl;

  StudentSummary({
    required this.studentName,
    required this.summaryText,
    required this.teacherName,
    required this.imageUrl,
  });
}

// Dummy static data
List<StudentSummary> studentSummaries = [
  StudentSummary(
    studentName: 'Al-Baigi Samaan',
    summaryText: 'Rangkuman singkat dalam Bahasa Sunda.',
    teacherName: 'Bapak Samaan',
    imageUrl: 'assets/1.png',
  ),
  StudentSummary(
    studentName: 'Zhare Amara',
    summaryText: 'Ringkasan teks panjang menjadi singkat.',
    teacherName: 'Ibu Amara',
    imageUrl: 'assets/2.png',
  ),
  StudentSummary(
    studentName: 'Afiq Zhara',
    summaryText: 'Rangkuman Bahasa Sunda dengan gaya yang bagus.',
    teacherName: 'Pak Zhara',
    imageUrl: 'assets/3.png',
  ),
  StudentSummary(
    studentName: 'Fauzan Ramdan',
    summaryText: 'Siswa merangkum cerita panjang dengan efektif.',
    teacherName: 'Pak Ramdan',
    imageUrl: 'assets/4.png',
  ),
  StudentSummary(
    studentName: 'Yusuf Ahmad',
    summaryText: 'Rangkuman dengan pemahaman tinggi terhadap teks asli.',
    teacherName: 'Ibu Ahmad',
    imageUrl: 'assets/5.png',
  ),
];
