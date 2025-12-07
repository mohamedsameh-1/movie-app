// // import 'package:dartz/dartz.dart';
// // import 'package:hive/hive.dart';
// // import 'package:movie_app/core/utils/failure.dart';
// // import 'package:movie_app/feature/home/profiletab/data/datasource/local/profile/profile_local_data_source.dart';
// // import 'package:movie_app/feature/home/profiletab/data/model/history_model.dart';
// // import 'package:movie_app/feature/home/profiletab/domain/entities/history_entity.dart';

// // class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
// //   final Box<HistoryMovieModel> box;
// //   ProfileLocalDataSourceImpl({required this.box});

// //     @override
// //   Future<Either<Failure, HistoryMovieEntity>> saveHistory(
// //     HistoryMovieEntity historyMovie,
// //   ) async {
// //         // remove if exists → to avoid duplicates
// //     final existing = box.values
// //         .where((m) => m.movieId == historyMovie.movieId)
// //         .toList();

// //     for (var item in existing) {
// //       await item.delete();
// //     }

// //     await box.add(HistoryMovieModel.fromMap(historyMovie));
// //   }

// //   @override
// //   Future<Either<Failure, HistoryMovieEntity>> getHistory() {
// //        return box.values
// //         .map((e) => e.toEntity())
// //         .toList()
// //         .reversed
// //         .toList(); // latest first
// //   }

// // }

// // import 'package:dartz/dartz.dart';
// // import 'package:hive/hive.dart';
// // import 'package:movie_app/core/utils/failure.dart';
// // import 'package:movie_app/feature/home/profiletab/data/model/history_model.dart';
// // import 'package:movie_app/feature/home/profiletab/domain/entities/history_entity.dart';
// // import 'package:movie_app/feature/home/profiletab/data/datasource/local/profile/profile_local_data_source.dart';

// // class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
// //   final Box<HistoryMovieModel> box;
// //   ProfileLocalDataSourceImpl({required this.box});

// //   @override
// //   Future<Either<Failure, HistoryMovieEntity>> saveHistory(
// //       HistoryMovieEntity historyMovie) async {
// //     try {
// //       // remove duplicates if exists
// //       final existing = box.values
// //           .where((m) => m.movieId == historyMovie.movieId)
// //           .toList();

// //       for (var item in existing) {
// //         await item.delete();
// //       }

// //       final added = await box.add(HistoryMovieModel.fromMap(historyMovie));
// //       return Right(historyMovie);
// //     } catch (e) {
// //       return Left(Failure(failureMessage: e.toString()));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, List<HistoryMovieEntity>>> getHistory() async {
// //     try {
// //       final history = box.values
// //           .map((e) => e.toEntity())
// //           .toList()
// //           .reversed
// //           .toList(); // latest first
// //       return Right(history);
// //     } catch (e) {
// //       return Left(Failure(failureMessage: e.toString()));
// //     }
// //   }
// // }

// import 'package:dartz/dartz.dart';
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import 'package:movie_app/core/utils/failure.dart';
// import 'package:movie_app/feature/home/profiletab/data/model/history_model.dart';
// import 'package:movie_app/feature/home/profiletab/domain/entities/history_entity.dart';
// import 'package:movie_app/feature/home/profiletab/data/datasource/local/profile/profile_local_data_source.dart';

// @Injectable(as: ProfileLocalDataSource)
// class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
//   final Box<Map<String, dynamic>> box; // نخزن الماب بدل الـ HiveObject
//   ProfileLocalDataSourceImpl({required this.box});

//   @override
//   Future<Either<Failure, HistoryMovieEntity>> saveHistory(
//     HistoryMovieEntity historyMovie,
//   ) async {
//     try {
//       final model = HistoryMovieModel.fromEntity(historyMovie);
//       await box.put(model.movieId, model.toMap());
//       return Right(historyMovie);
//     } catch (e) {
//       return Left(Failure(failureMessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<HistoryMovieEntity>>> getHistory() async {
//     try {
//       final history = box.values
//           .map((map) => HistoryMovieModel.fromMap(map).toEntity())
//           .toList()
//           .reversed
//           .toList(); // latest first
//       return Right(history);
//     } catch (e) {
//       return Left(Failure(failureMessage: e.toString()));
//     }
//   }
// }
