//
//  File.swift
//  
//
//  Created by Dongju on 2023/03/30.
//

import Foundation

extension Double {
    
    public var decimal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) )) ?? "")
    }
    
    public var spellOut: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.spellOut
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) )) ?? "")
    }
    
    public var currency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) )) ?? "")
    }

    public var ordinal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.ordinal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) )) ?? "")
    }
    
    public var percent: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.percent
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) )) ?? "")
    }
    
    public var toKorean: String {
        let numberFormater = NumberFormatter()
        numberFormater.locale = Locale(identifier: "ko_KR")
        
        let numberArray = "\(self)".components(separatedBy: numberFormater.decimalSeparator)
        if numberArray.count > 1 {
            return numberArray[0].spelloutCurrency()
            + (numberArray[1] == "0" ? "" :numberFormater.decimalSeparator)
            + (numberArray[1] == "0" ? "" : numberArray[1])  + "원"
        }else{
            return numberArray.joined().spelloutCurrency() + "원"
        }
    }
}
