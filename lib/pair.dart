import 'package:equatable/equatable.dart';

class Pair extends Equatable {
  final String _from;
  final String _to;

  Pair(this._from, this._to);

  bool equals(Pair pair) {
    return _from == pair._from && _to == pair._to;
  }

  @override
  // TODO: implement props
  List<Object> get props => [_from, _to];

}