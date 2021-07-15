import 'package:flutter_test/flutter_test.dart';
import 'package:customer/extensions/string_extensions.dart';

void main() {
 group('StringTest -', (){
   group('toCityDocument -', () {
    test('When called with "Cape Town" should return "cape-town"', () {
      final result = 'Cape Town'.toCityDocument;
      expect(result, 'cape-town');
    });
   });
 });
}