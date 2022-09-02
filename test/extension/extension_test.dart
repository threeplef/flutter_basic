import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/extension/extensions.dart';

void main() {
  const text = '<<<First Grade>>>';

  test('last()는 마지막 문자를 반환해야 한다', () {
    expect(text.last(), '>');
  });

  test('isLetter()는 문자인지 아닌지 판별해야 한다', () {
    expect(text[0].isLetter(), false);
    expect(text[3].isLetter(), true);
    expect(text[8].isLetter(), false);
    expect(text.last().isLetter(), false);
  });

  test('dropLast()는 마지막 문자를 제거해야 한다', () {
    expect(text.dropLast(), '<<<First Grade>>');
  });

  test('count()는 주어진 조건을 만족하는 개수를 반환해야 한다', () {
    expect(text.count((str) => str == '<'), 3);
    expect(text.count((str) => str == '>'), 3);
    expect(text.count((str) => str == ' '), 1);
  });

  test('take()는 앞에서 n개의 문자를 얻는다', () {
    expect(text.take(8), '<<<First');
    expect(text.take(3), '<<<');
    expect(text.take(9), '<<<First ');
  });

  test('takeLast()는 뒤에서 n개의 문자를 얻는다', () {
    expect(text.takeLast(8), 'Grade>>>');
    expect(text.takeLast(3), '>>>');
  });

  test('takeWhileContinue()는 조건에 맞는 연속되는 것을 앞에서부터 찾아서 반환한다', () {
    expect(text.takeWhileContinue((str) => str == '<'), '<<<');
    expect(text.takeWhileContinue((str) => str == '>'), '>>>');
  });

  test('takeWhile()은 조건에 맞는 연속되는 것을 앞에서부터 찾아서 반환한다', () {
    expect(text.takeWhile((str) => str == '<'), '<<<');
    expect(text.takeWhile((str) => str == '>'), '>>>');
  });
  
  test('takeLastWhile', () {
    expect(text.takeLastWhile((str) => str == '<'), '<<<');
    expect(text.takeLastWhile((str) => str == '>'), '>>>');
  });
}
