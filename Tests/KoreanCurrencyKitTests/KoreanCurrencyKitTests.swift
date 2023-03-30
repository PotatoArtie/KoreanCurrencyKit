import XCTest
@testable import KoreanCurrencyKit

final class KoreanCurrencyKitTests: XCTestCase {
    
    func test_문자열에서_toKorean호출시_숫자_한글포맷으로반환하는지() throws {
        XCTAssertEqual("5500".toKorean, "5,500원")
        XCTAssertEqual("510".toKorean, "510원")
        XCTAssertEqual("710".toKorean, "710원")
        XCTAssertEqual("110".toKorean, "110원")
        XCTAssertEqual("430".toKorean, "430원")
        XCTAssertEqual("800".toKorean, "800원")
        XCTAssertEqual("810".toKorean, "810원")
        XCTAssertEqual("820".toKorean, "820원")
        XCTAssertEqual("830".toKorean, "830원")
        XCTAssertEqual("840".toKorean, "840원")
        XCTAssertEqual("850".toKorean, "850원")
        XCTAssertEqual("860".toKorean, "860원")
        XCTAssertEqual("870".toKorean, "870원")
        XCTAssertEqual("880".toKorean, "880원")
        XCTAssertEqual("890".toKorean, "890원")
        XCTAssertEqual("4440".toKorean, "4,440원")
        XCTAssertEqual("100100".toKorean,"10만 100원")
        XCTAssertEqual("1001000".toKorean, "100만 1,000원")
        XCTAssertEqual("100010".toKorean,"10만 10원")
        XCTAssertEqual("1001000".toKorean, "100만 1,000원")
        XCTAssertEqual("7777777777777777".toKorean, "7,777조 7,777억 7,777만 7,777원")
        XCTAssertEqual("1111111111111111".toKorean, "1,111조 1,111억 1,111만 1,111원")
        XCTAssertEqual("9999999999999999".toKorean, "9,999조 9,999억 9,999만 9,999원")
        XCTAssertEqual("1".toKorean,"1원")
        XCTAssertEqual("12".toKorean,"12원")
        XCTAssertEqual("123".toKorean,"123원")
        XCTAssertEqual("12345".toKorean,"1만 2,345원")
        XCTAssertEqual("123456".toKorean,"12만 3,456원")
        XCTAssertEqual("1234567".toKorean,"123만 4,567원")
        XCTAssertEqual("12345678".toKorean,"1,234만 5,678원")
        XCTAssertEqual("123456789".toKorean,"1억 2,345만 6,789원")
        XCTAssertEqual("10".toKorean,"10원")
        XCTAssertEqual("120".toKorean,"120원")
        XCTAssertEqual("1230".toKorean,"1,230원")
        XCTAssertEqual("123450".toKorean,"12만 3,450원")
        XCTAssertEqual("1234560".toKorean,"123만 4,560원")
        XCTAssertEqual("12345670".toKorean,"1,234만 5,670원")
        XCTAssertEqual("123456780".toKorean,"1억 2,345만 6,780원")
        XCTAssertEqual("1234567890".toKorean,"12억 3,456만 7,890원")
        XCTAssertEqual("100".toKorean,"100원")
        XCTAssertEqual("1200".toKorean,"1,200원")
        XCTAssertEqual("12300".toKorean,"1만 2,300원")
        XCTAssertEqual("1234500".toKorean,"123만 4,500원")
        XCTAssertEqual("12345600".toKorean,"1,234만 5,600원")
        XCTAssertEqual("123456700".toKorean,"1억 2,345만 6,700원")
        XCTAssertEqual("1234567800".toKorean,"12억 3,456만 7,800원")
        XCTAssertEqual("12345678900".toKorean,"123억 4,567만 8,900원")
        XCTAssertEqual("1000".toKorean,"1,000원")
        XCTAssertEqual("12000".toKorean,"1만 2,000원")
        XCTAssertEqual("123000".toKorean,"12만 3,000원")
        XCTAssertEqual("12345000".toKorean,"1,234만 5,000원")
        XCTAssertEqual("123456000".toKorean,"1억 2,345만 6,000원")
        XCTAssertEqual("1234567000".toKorean,"12억 3,456만 7,000원")
        XCTAssertEqual("12345678000".toKorean,"123억 4,567만 8,000원")
        XCTAssertEqual("123456789000".toKorean,"1,234억 5,678만 9,000원")
        XCTAssertEqual("10000".toKorean,"1만원")
        XCTAssertEqual("120000".toKorean,"12만원")
        XCTAssertEqual("1230000".toKorean,"123만원")
        XCTAssertEqual("123450000".toKorean,"1억 2,345만원")
        XCTAssertEqual("1234560000".toKorean,"12억 3,456만원")
        XCTAssertEqual("12345670000".toKorean,"123억 4,567만원")
        XCTAssertEqual("123456780000".toKorean,"1,234억 5,678만원")
        XCTAssertEqual("1234567890000".toKorean,"1조 2,345억 6,789만원")
        XCTAssertEqual("        ".toKorean,"")
        
    }
    
    func test_문자열에서_decimal스타일로반환되는지() throws {
        XCTAssertEqual("1234567891234567".decimal,"1,234,567,891,234,567")
    }
    
    func test_문자열에서_spellOut스타일로반환되는지() throws {
        XCTAssertEqual("1234567891234567".spellOut,"천이백삼십사조 오천육백칠십팔억 구천백이십삼만 사천오백육십칠")
    }
    
    func test_문자열에서_currency스타일로반환되는지() throws {
        XCTAssertEqual("1234567891234567".currency,"₩1,234,567,891,234,567")
    }
    
    func test_문자열에서_ordinal스타일로반환되는지() throws {
        XCTAssertEqual("1234567891234567".ordinal,"1,234,567,891,234,567번째")
    }
    
    func test_문자열에서_percent스타일로반환되는지() throws {
        XCTAssertEqual("1234567891234567".percent,"123,456,789,123,456,700%")
    }
    
}
