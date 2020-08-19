//
//  VerifyMethod.swift
//  verifyID
//
//  Created by 19003471Claud on 2020/8/19.
//  Copyright © 2020 1900347_Claud. All rights reserved.
//

import Foundation

func verifyResidentCertificate(ResidentCertificateNum:String) -> Bool{
    var resultBool = false
    let PredicateFormat = "^[A-Za-z][A-Da-d][0-9]{8}$"
    let Predicate = NSPredicate(format:"SELF MATCHES %@", PredicateFormat)
    resultBool = Predicate.evaluate(with: ResidentCertificateNum)
    var verifyNum = 0
    var verifyStr = ""
    if resultBool{
        let strArr = Array(ResidentCertificateNum)
        let pidCharArray = [ "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V" , "X", "Y", "W" , "Z" , "I" , "O" ]
        let IntNum = pidCharArray.stringMatch(Str: String(strArr[0]))
        let IntNum2 = pidCharArray.stringMatch(Str: String(strArr[1]))
        if IntNum >= 0 && IntNum2 >= 0{
            verifyStr = String(IntNum + 10) + String((IntNum2 + 10) % 10) + String(strArr[2]) + String(strArr[3]) + String(strArr[4]) + String(strArr[5]) + String(strArr[6]) + String(strArr[7]) + String(strArr[8]) + String(strArr[9])
            let verifyStrArray = Array(verifyStr)
            let num1 = Int(String(verifyStrArray[0]))!
            let num2 = Int(String(verifyStrArray[1]))! * 9
            let num3 = Int(String(verifyStrArray[2]))! * 8
            let num4 = Int(String(verifyStrArray[3]))! * 7
            let num5 = Int(String(verifyStrArray[4]))! * 6
            let num6 = Int(String(verifyStrArray[5]))! * 5
            let num7 = Int(String(verifyStrArray[6]))! * 4
            let num8 = Int(String(verifyStrArray[7]))! * 3
            let num9 = Int(String(verifyStrArray[8]))! * 2
            let num10 = Int(String(verifyStrArray[9]))!
            let num11 = Int(String(verifyStrArray[10]))!
            verifyNum = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9 + num10
            if ((10 - verifyNum % 10) == num11){
                resultBool = true
            }else{
                resultBool = false
            }
        }
    }
    return resultBool
}

func verifyIdentifier(_ twid: String) -> Bool {
    //1. 先做基本檢查
    //1-1 長度為10
    //1-2 第一碼為a-z
    //1-3 第二碼為1或2
    //1-4 其他二到十碼皆為0~9
    var ret: Bool
    let regex = try! NSRegularExpression(pattern: "^[A-Z][12][0-9]{8}$", options: [])
    let match = regex.firstMatch(in: twid, options: [], range: NSRange(location: 0, length: twid.count))
    
    if (match != nil) {
        //2. 再做驗證碼檢查
        let letter = "ABCDEFGHJKLMNPQRSTUVXYWZIO"
        let number = "0123456789"
        
        let i0 = (twid as NSString).substring(with: NSRange(location: 0, length: 1))
        let i1 = (twid as NSString).substring(with: NSRange(location: 1, length: 1))
        let i2 = (twid as NSString).substring(with: NSRange(location: 2, length: 1))
        let i3 = (twid as NSString).substring(with: NSRange(location: 3, length: 1))
        let i4 = (twid as NSString).substring(with: NSRange(location: 4, length: 1))
        let i5 = (twid as NSString).substring(with: NSRange(location: 5, length: 1))
        let i6 = (twid as NSString).substring(with: NSRange(location: 6, length: 1))
        let i7 = (twid as NSString).substring(with: NSRange(location: 7, length: 1))
        let i8 = (twid as NSString).substring(with: NSRange(location: 8, length: 1))
        let i9 = (twid as NSString).substring(with: NSRange(location: 9, length: 1))
        let pos = Int((letter as NSString).range(of: i0).location) + 10
        let ie1 = Int((number as NSString).range(of: i1).location)
        let ie2 = Int((number as NSString).range(of: i2).location)
        let ie3 = Int((number as NSString).range(of: i3).location)
        let ie4 = Int((number as NSString).range(of: i4).location)
        let ie5 = Int((number as NSString).range(of: i5).location)
        let ie6 = Int((number as NSString).range(of: i6).location)
        let ie7 = Int((number as NSString).range(of: i7).location)
        let ie8 = Int((number as NSString).range(of: i8).location)
        let ie9 = Int((number as NSString).range(of: i9).location)
        let n1 = pos / 10 ;let n2 = pos % 10 ;
        let n3 = ie1 ;let n4 = ie2 ;let n5 = ie3 ;let n6 = ie4 ;let n7 = ie5 ;
        let n8 = ie6 ;let n9 = ie7 ;let n10 = ie8 ;let n11 = ie9
        let result = n1 * 1 + n2 * 9 + n3 * 8 + n4 * 7 + n5 * 6 + n6 * 5 + n7 * 4 + n8 * 3 + n9 * 2 + n10 * 1 + n11 * 1
        if result % 10 == 0 {
            ret = true
        }
        else {
            ret = false
        }
    }else {
        ret = false
    }
    return ret
}

func verifyEmail(_ EmailStr:String) -> Bool {
    // print("validate calendar: \(testStr)")
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let emailString = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailString.evaluate(with: EmailStr)
}

func verifyMobliePhone(_ phoneStr:String) -> Bool {
    // print("validate calendar: \(testStr)")
    let phoneRegEx = "^09[0-8][0-9][0-9]{6}$"
    
    let phoneString = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
    return phoneString.evaluate(with: phoneStr)
}

extension Array{
    func stringMatch(Str:String) -> Int{
        var result:Int = -1
        for i in 0...self.count - 1{
            let string = self[i] as! String
            if Str == string{
                result = i
                break
            }
        }
        return result
    }
}
