<img width="698" alt="logo" src="https://user-images.githubusercontent.com/98959780/228770091-87679611-0246-40fe-a351-b80bcd0a7339.png">

# KoreanCurrencyKit

[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
[![CodeCoverage](https://img.shields.io/static/v1?label=CodeCoverage&message=90.5&color=green)](https://github.com/PotatoArtie/KoreanCurrencyKit)
[![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=lightgrey)](https://github.com/PotatoArtie/KoreanCurrencyKit)



## Summary

 **KoreanCurrencyKit은 문자열로 입력받은 값에 대해 간편하게 한글금액 표기법으로 변환하여줍니다.**


## Usage 


- Use {String}.toKorean 
표기방법 : 숫자 + 한글표기

    ###### 소수점 앞자리 16자리까지만 화폐단위 표기 
    최대 '조' 단위 까지 표현 
    1,234조 5,678억 9,123만 4,567원

``` swift 
    [요청]
    "123456780".toKorean 
    [출력]
    1억 2,345만 6,780원
```

- Use {String}.spellOut 
표기방법 : 한글표기
``` swift 
    [요청]
    "123456780".spellOut 
    [출력]
    일억 이천삼백사십오만 육천칠백팔십
```

- Use {String}.decimal
표기방법 : 숫자표기
``` swift 
    [요청]
    "123456780".decimal 
    [출력]
    123,456,780
```

- Use {String}.currency
표기방법 : 원화표기
``` swift 
    [요청]
    "123456780".currency 
    [출력]
    ₩123,456,780
```

- Use {String}.ordinal
표기방법 : 서수표기
``` swift 
    [요청]
    "123456780".ordinal
    [출력]
    123,456,780번째
```

- Use {String}.percent
표기방법 : 퍼센트표기
``` swift 
    [요청]
    "123456780".percent
    [출력]
    12,345,678,000%
```

### Quick Help

![quickhelp](https://user-images.githubusercontent.com/98959780/228849192-ba136303-fd4c-4916-b253-c6c1cb115428.gif)

## Requirement

iOS 8.0+/macOS 10.10+/tvOS 9.0+/watchOS 2.0+
[Apple developer](https://developer.apple.com/documentation/swift/array/reduce(_:_:))


## Installation 

File > Swift Packages > Add Package Dependency
Add https://github.com/PotatoArtie/KoreanCurrencyKit.git
Select "Up to Next Major" with 0.0.3

``` swift 
  .package(url: "https://github.com/PotatoArtie/KoreanCurrencyKit.git", .upToNextMajor(from: "0.0.3"))
```

## Coverage
<img width="554" alt="code coverage" src="https://user-images.githubusercontent.com/98959780/228801793-c0d00fe3-a68b-44c7-80d0-1b474afb8214.png">


## License

**KoreanCurrencyKit** is under the MIT license. See the LICENSE for details.
