  import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T,Params>{
    Future<Either> call(Params params);
  }
  class NoParams extends Equatable {
  @override
  List<Object?> get props =>[];
  }