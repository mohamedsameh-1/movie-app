// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'list_movie_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class ListMovieResponseModelAdapter
//     extends TypeAdapter<ListMovieResponseModel> {
//   @override
//   final int typeId = 0;

//   @override
//   ListMovieResponseModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ListMovieResponseModel()
//       ..statusHive = fields[0] as dynamic
//       ..statusMessageHive = fields[1] as dynamic
//       ..movieCountHive = fields[2] as dynamic
//       ..limitHive = fields[3] as dynamic
//       ..pageNumberHive = fields[4] as dynamic
//       ..moviesHive = fields[5] as dynamic;
//   }

//   @override
//   void write(BinaryWriter writer, ListMovieResponseModel obj) {
//     writer
//       ..writeByte(6)
//       ..writeByte(0)
//       ..write(obj.statusHive)
//       ..writeByte(1)
//       ..write(obj.statusMessageHive)
//       ..writeByte(2)
//       ..write(obj.movieCountHive)
//       ..writeByte(3)
//       ..write(obj.limitHive)
//       ..writeByte(4)
//       ..write(obj.pageNumberHive)
//       ..writeByte(5)
//       ..write(obj.moviesHive);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ListMovieResponseModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class MovieModelAdapter extends TypeAdapter<MovieModel> {
//   @override
//   final int typeId = 1;

//   @override
//   MovieModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return MovieModel()
//       ..hiveId = fields[0] as dynamic
//       ..hiveUrl = fields[1] as dynamic
//       ..hiveImdbCode = fields[2] as dynamic
//       ..hiveTitle = fields[3] as dynamic
//       ..hiveTitleEnglish = fields[4] as dynamic
//       ..hiveTitleLong = fields[5] as dynamic
//       ..hiveSlug = fields[6] as dynamic
//       ..hiveYear = fields[7] as dynamic
//       ..hiveRating = fields[8] as dynamic
//       ..hiveRuntime = fields[9] as dynamic
//       ..hiveGenres = fields[10] as dynamic
//       ..hiveSummary = fields[11] as dynamic
//       ..hiveDescriptionFull = fields[12] as dynamic
//       ..hiveSynopsis = fields[13] as dynamic
//       ..hiveYtTrailerCode = fields[14] as dynamic
//       ..hiveLanguage = fields[15] as dynamic
//       ..hiveMpaRating = fields[16] as dynamic
//       ..hiveBackgroundImage = fields[17] as dynamic
//       ..hiveBackgroundImageOriginal = fields[18] as dynamic
//       ..hiveSmallCoverImage = fields[19] as dynamic
//       ..hiveMediumCoverImage = fields[20] as dynamic
//       ..hiveLargeCoverImage = fields[21] as dynamic
//       ..hiveState = fields[22] as dynamic
//       ..hiveDateUploaded = fields[23] as dynamic
//       ..hiveDateUploadedUnix = fields[24] as dynamic;
//   }

//   @override
//   void write(BinaryWriter writer, MovieModel obj) {
//     writer
//       ..writeByte(25)
//       ..writeByte(0)
//       ..write(obj.hiveId)
//       ..writeByte(1)
//       ..write(obj.hiveUrl)
//       ..writeByte(2)
//       ..write(obj.hiveImdbCode)
//       ..writeByte(3)
//       ..write(obj.hiveTitle)
//       ..writeByte(4)
//       ..write(obj.hiveTitleEnglish)
//       ..writeByte(5)
//       ..write(obj.hiveTitleLong)
//       ..writeByte(6)
//       ..write(obj.hiveSlug)
//       ..writeByte(7)
//       ..write(obj.hiveYear)
//       ..writeByte(8)
//       ..write(obj.hiveRating)
//       ..writeByte(9)
//       ..write(obj.hiveRuntime)
//       ..writeByte(10)
//       ..write(obj.hiveGenres)
//       ..writeByte(11)
//       ..write(obj.hiveSummary)
//       ..writeByte(12)
//       ..write(obj.hiveDescriptionFull)
//       ..writeByte(13)
//       ..write(obj.hiveSynopsis)
//       ..writeByte(14)
//       ..write(obj.hiveYtTrailerCode)
//       ..writeByte(15)
//       ..write(obj.hiveLanguage)
//       ..writeByte(16)
//       ..write(obj.hiveMpaRating)
//       ..writeByte(17)
//       ..write(obj.hiveBackgroundImage)
//       ..writeByte(18)
//       ..write(obj.hiveBackgroundImageOriginal)
//       ..writeByte(19)
//       ..write(obj.hiveSmallCoverImage)
//       ..writeByte(20)
//       ..write(obj.hiveMediumCoverImage)
//       ..writeByte(21)
//       ..write(obj.hiveLargeCoverImage)
//       ..writeByte(22)
//       ..write(obj.hiveState)
//       ..writeByte(23)
//       ..write(obj.hiveDateUploaded)
//       ..writeByte(24)
//       ..write(obj.hiveDateUploadedUnix);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MovieModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
