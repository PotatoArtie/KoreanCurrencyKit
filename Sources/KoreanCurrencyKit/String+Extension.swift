//
//  String+Extension.swift
//  
//
//  Created by Dongju on 2023/03/30.
//
import Foundation

extension String {
    /**
            숫자표기 ex)1,234,567
     */
    public var decimal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
    /**
            한글표기 ex)백이십삼만 사천오백육십칠
     */
    public var spellOut: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.spellOut
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
    /**
            원호표기 ex)₩1,234,567
     */
    public var currency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
    /**
            서수표기 ex)1,234,567번째
     */
    public var ordinal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.ordinal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
    /**
            퍼센트표기 ex)123,456,700%
     */
    public var percent: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.percent
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
    
    private enum MonetaryUnit: String, CaseIterable {
        case unit = "원"
        case tenThousand = "만"
        case hundredThousand = "억"
        case trilion = "조"
        case none = ""
        
        static func getPositionBy(_ index: Int) -> Self {
            for (_index,item) in self.allCases.enumerated() {
                if index == _index { return item }
            }
            return .none
        }
        
        var desc: String {
            self.rawValue
        }
    }
    /**
            숫자+한글표기 ex)123만 4,567원
     */
    public var toKorean: String {
        let numberFormater = NumberFormatter()
        numberFormater.locale = Locale(identifier: "ko_KR")
        let numberArray = self.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: numberFormater.decimalSeparator)
        if numberArray.count > 1 {
            return numberArray[0].spelloutCurrency() + numberFormater.decimalSeparator + numberArray[1] + "원"
        }else{
            return numberArray.joined().spelloutCurrency().isEmpty ? ""  : numberArray.joined().spelloutCurrency() + "원"
        }
    }
    
    func spelloutCurrency() -> String {
        let templateArray = Array(self.suffix(16))
        var tmpArray: [String] = []
        var tempString = ""
        
        for (index,item) in templateArray.enumerated().reversed() {
            let count = templateArray.count - index
            tempString += "\(item)"

            if count % 4 == 0 {
                tmpArray.append(tempString)
                tempString.removeAll()
            }
            
            if count == templateArray.count && !tempString.isEmpty{
                tmpArray.append(tempString)
            }
        }
        
        let resultArray = tmpArray.enumerated().reduce("") { partialResult, value in
            return partialResult + getConvertedString(data: value.element, unit: MonetaryUnit.getPositionBy(value.offset))
        }
        
        let resultValue = resultArray.reversed().map({"\($0)"}).joined().replacingOccurrences(of: "-", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        return resultValue.isEmpty ? "" : resultValue
    }
    
    private func getConvertedString(data: String, unit: MonetaryUnit) -> String {
        let zeroArray = Set(data)
        if zeroArray.contains("0") && zeroArray.count < 2 { return "" }
        
        var isFirstIndexZero = true
        
        let tmpArray = Array(data).reversed().enumerated().reduce("") { partialResult, value in
            
            let tmpSet = Set(partialResult+String(value.element))
            if value.offset == 0 && value.element != "0" {
                isFirstIndexZero = false
            }else{
                if isFirstIndexZero && tmpSet.count < 3 && tmpSet.contains("0") {
                    return partialResult + "-"
                }
            }
            return partialResult + String(value.element)
        }

        switch unit {
        case .unit:
            return  tmpArray.appendComma()
        case .none:
            return ""
        default:
            return  " " + unit.desc + tmpArray.appendComma()
        }
    }
    
    private func appendComma() -> Self {
        var array: [String] = []
        for (index,item) in self.reversed().enumerated() {
            if (index + 1) % 3 == 0 && self.count > 3 && !self.contains("-") {
                array.append("\(item),")
            } else {
                array.append("\(item)")
            }
        }
        return array.joined(separator: "")
    }
}
