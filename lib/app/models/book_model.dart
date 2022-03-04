import 'dart:convert';

List<Books> booksFromJson(String str) => List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

List<Books> bookModelFromJson(String str) => List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

class Books {
  Books({
    this.id,
    this.authors,
    this.bookshelves,
    this.downloadCount,
    this.formats,
    this.languages,
    this.mediaType,
    this.subjects,
    this.title,
  });

  int? id;
  List<Author>? authors;
  List<String>? bookshelves;
  int? downloadCount;
  Formats? formats;
  List<dynamic>? languages;
  String? mediaType;
  List<String>? subjects;
  String? title;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        downloadCount: json["download_count"],
        formats: Formats.fromJson(json["formats"]),
        languages: json["languages"],
        mediaType: json["media_type"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        title: json["title"],
      );
}

class Author {
  Author({
    this.birthYear,
    this.deathYear,
    this.name,
  });

  int? birthYear;
  int? deathYear;
  String? name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        birthYear: json["birth_year"] ?? 1960,
        deathYear: json["death_year"] ?? 2010,
        name: json["name"] ?? "",
      );
}

class Formats {
  Formats(
      {this.textPlain,
      this.textHtml,
      this.applicationXMobipocketEbook,
      this.textPlainCharsetUsAscii,
      this.applicationRdfXml,
      this.applicationEpubZip,
      this.applicationZip,
      this.textHtmlCharsetUsAscii,
      this.textHtmlCharsetIso88591,
      this.textPlainCharsetIso88591,
      this.textPlainCharsetUtf8,
      this.textHtmlCharsetUtf8,
      this.imageJpeg});

  String? textPlain;
  String? textHtml;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUsAscii;
  String? applicationRdfXml;
  String? applicationEpubZip;
  String? applicationZip;
  String? textHtmlCharsetUsAscii;
  String? textHtmlCharsetIso88591;
  String? textPlainCharsetIso88591;
  String? textPlainCharsetUtf8;
  String? textHtmlCharsetUtf8;
  String? imageJpeg;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        textPlain: json["text/plain"] ?? "",
        textHtml: json["text/html"] ?? "",
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"] ?? "",
        applicationRdfXml: json["application/rdf+xml"],
        applicationEpubZip: json["application/epub+zip"],
        applicationZip: json["application/zip"] ?? "",
        textHtmlCharsetUsAscii: json["text/html; charset=us-ascii"] ?? "",
        textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"] ?? "",
        textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"] ?? "",
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"] ?? "",
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"] ?? "",
        imageJpeg: json["image/jpeg"],
      );
}
