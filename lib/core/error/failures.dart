import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class ServerFailure extends Failure{
final bool sucesso;
  final String? erroCodigo;
  final String? erroDescricao;

  ServerFailure({this.sucesso = false, this.erroCodigo = "", this.erroDescricao = ""});

  @override
  String toString() {

    if(erroDescricao == 'null'){
      return erroCodigo!;
    }    
    if (erroDescricao == "") {
      return erroCodigo!;
    }
    else if (erroCodigo == "") {
      return erroDescricao!;
    }
    else {
      return "[$erroCodigo] - $erroDescricao";
    }
  }

  @override
  List<Object?> get props => [
    sucesso,
    erroCodigo,
    erroDescricao,
  ];

  @override
  bool? get stringify => false;

}

