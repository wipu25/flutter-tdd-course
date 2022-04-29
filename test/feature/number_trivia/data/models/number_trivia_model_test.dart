import 'dart:convert';

import 'package:flutter_tdd_cleanarch/feature/number_trivia/data/model/number_trivia_model.dart';
import 'package:flutter_tdd_cleanarch/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final  tNumverTriviaModel = NumberTriviaModel(number: 1, text: "Test Text");
  test("should be a subclass of NumberTrivia entity", (){
    expect(tNumverTriviaModel, isA<NumberTrivia>());
  });

  group("From json", () {
    test(
      'should return a valid model when the JSON number is an integer',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumverTriviaModel);
      },
    );
    test('should return a valid model when the JSON number is an double', () {
      final Map<String,dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumverTriviaModel);
    });
  });

  group('To json', () {
    test('should return a JSON map containing the proper data', () {
      final result = tNumverTriviaModel.toJson();
      final expectedJsonMap = {
        "text": "Test Text",
        "number": 1,
      };
      expect(result, expectedJsonMap);
    });
  });
}