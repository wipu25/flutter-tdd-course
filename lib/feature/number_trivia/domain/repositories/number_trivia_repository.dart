
import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_cleanarch/core/error/failures.dart';
import 'package:flutter_tdd_cleanarch/feature/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}