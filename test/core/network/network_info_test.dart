import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_tdd_cleanarch/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl mockNetworkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;
  
  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    mockNetworkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });
  
  group('isConnected', () {
    test(
        'should forward the call to DataConnectionChecker.hasConnection'
        , () {
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture);

      final result = mockNetworkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(result,tHasConnectionFuture);
    });
  });
}