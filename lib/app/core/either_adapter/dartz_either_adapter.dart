import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DartzEitherAdapter<R, L> implements EitherAdapter<R, L> {
  // receive an usecase in constructor
  final Either<R, L> usecase;
  DartzEitherAdapter(this.usecase);

  @override
  T fold<T>(T Function(R l) leftF, T Function(L l) rightF) {
    return usecase.fold(leftF, rightF);
  }

  // Adapter Future Either(Dartz) to Future EitherAdapter(Triple)
  static Future<EitherAdapter<L, R>> adapter<L, R>(
      Future<Either<L, R>> usecase) {
    return usecase.then((value) => DartzEitherAdapter(value));
  }
}
