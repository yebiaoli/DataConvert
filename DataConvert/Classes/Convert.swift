//
//  DataConvert.swift
//  DataConvert
//
//  Created by abiaoyo on 2025/1/24.
//

import Foundation

public enum CTBit: UInt8 {
    case bit0 = 0
    case bit1 = 1
}

extension Int {
    public var ctUInt8: UInt8 { UInt8(self & 0xFF) }
    public var ctUInt16:UInt16 { UInt16(self & 0xFFFF) }
    public var ctUInt32:UInt32 { UInt32(self & 0xFFFFFFFF) }
    public var ctCGFloat: CGFloat { CGFloat(self) }
    public var ctFloat: Float { Float(self) }
    public var ctDouble: Double { Double(self) }
}

extension UInt8 {
    public var ctInt:Int { Int(self) }
    public var ctCGFloat: CGFloat { CGFloat(self) }
    public var ctFloat: Float { Float(self) }
    public var ctDouble: Double { Double(self) }
}

extension UInt16 {
    public var ctInt:Int { Int(self) }
    public var ctCGFloat: CGFloat { CGFloat(self) }
    public var ctFloat: Float { Float(self) }
    public var ctDouble: Double { Double(self) }
}

extension UInt32 {
    public var ctInt:Int { Int(self) }
    public var ctCGFloat: CGFloat { CGFloat(self) }
    public var ctFloat: Float { Float(self) }
    public var ctDouble: Double { Double(self) }
}

extension UInt8 {
        
    public func ctLeftShift(_ position:UInt8) -> UInt8 {
        guard position >= 0 && position < 8 else {
            assert(false,"Index out of range. Must be between 0 and 7.")
            return self
        }
        return self << position
    }
    public func ctRightShift(_ position:UInt8) -> UInt8 {
        guard position >= 0 && position < 8 else {
            assert(false,"Index out of range. Must be between 0 and 7.")
            return self
        }
        return self >> position
    }
    
    public func ctSet(bit:CTBit, at index:Int) -> UInt8 {
        guard index >= 0 && index < 8 else {
            assert(false,"Index out of range. Must be between 0 and 7.")
            return self
        }
        if bit == .bit1 {
            let mask = UInt8(1 << index)
            return self | mask
        }else{
            let mask = ~(UInt8(1 << index))
            return self & mask
        }
    }
    
    public func ctGetBit(at index:Int) -> UInt8 {
        guard index >= 0 && index < 8 else {
            assert(false,"Index out of range. Must be between 0 and 7.")
            return 0
        }
        let mask = UInt8(1) << index
        return (self & mask) != 0 ? 1 : 0
    }
    
    public func ctGet(startAt startIndex: Int, length n: Int) -> UInt8 {
        guard startIndex >= 0 && startIndex < 8 && n > 0 && startIndex + n <= 8 else {
            assert(false,"Invalid index or bit count. Ensure index is between 0 and 7, and that index + count does not exceed 8.")
            return 0
        }
        let mask = UInt8((1 << n) - 1) << startIndex
        return (self & mask) >> startIndex
    }
    
}

extension UInt16 {
    public func ctLeftShift(_ position:UInt8) -> UInt16 {
        guard position >= 0 && position < 16 else {
            assert(false,"Index out of range. Must be between 0 and 15.")
            return self
        }
        return self << position
    }
    public func ctRightShift(_ position:UInt8) -> UInt16 {
        guard position >= 0 && position < 16 else {
            assert(false,"Index out of range. Must be between 0 and 15.")
            return self
        }
        return self >> position
    }
    public func ctSet(bit:CTBit, at index:Int) -> UInt16 {
        guard index >= 0 && index < 16 else {
            assert(false,"Index out of range. Must be between 0 and 15.")
            return self
        }
        if bit == .bit1 {
            let mask = UInt16(1 << index)
            return self | mask
        }else{
            let mask = ~(UInt16(1 << index))
            return self & mask
        }
    }
    public func ctGetBit(at index:Int) -> UInt8 {
        guard index >= 0 && index < 16 else {
            assert(false,"Index out of range. Must be between 0 and 15.")
            return 0
        }
        let mask = UInt16(1) << index
        return (self & mask) != 0 ? 1 : 0
    }
    public func ctGet(startAt startIndex: Int, length n: Int) -> UInt16 {
        guard startIndex >= 0 && startIndex < 16 && n > 0 && startIndex + n <= 16 else {
            assert(false,"Invalid index or bit count. Ensure index is between 0 and 15, and that index + count does not exceed 16.")
            return 0
        }
        let mask = UInt16((1 << n) - 1) << startIndex
        return (self & mask) >> startIndex
    }
    
    public var ctSplit: (byte1:UInt8, byte0:UInt8, bytes:[UInt8]) {
        let byte0 = UInt8(self & 0xFF)
        let byte1 = UInt8((self >> 8) & 0xFF)
        return (byte1, byte0,[byte1,byte0])
    }
    
    public var ctBytes: [UInt8] {
        let byte0 = UInt8(self & 0xFF)
        let byte1 = UInt8((self >> 8) & 0xFF)
        return [byte1,byte0]
    }
    
    public static func ctCombine(byte1: UInt8, byte0: UInt8) -> UInt16 {
        return (UInt16(byte1) << 8) | UInt16(byte0)
    }
    
}

extension UInt32 {
    public func ctLeftShift(_ position:UInt8) -> UInt32 {
        guard position >= 0 && position < 32 else {
            assert(false,"Index out of range. Must be between 0 and 31.")
            return self
        }
        return self << position
    }
    public func ctRightShift(_ position:UInt8) -> UInt32 {
        guard position >= 0 && position < 32 else {
            assert(false,"Index out of range. Must be between 0 and 31.")
            return self
        }
        return self >> position
    }
    public func ctSet(bit:CTBit, at index:Int) -> UInt32 {
        guard index >= 0 && index < 32 else {
            assert(false,"Index out of range. Must be between 0 and 31.")
            return self
        }
        if bit == .bit1 {
            let mask = UInt32(1 << index)
            return self | mask
        }else{
            let mask = ~(UInt32(1 << index))
            return self & mask
        }
    }
    public func ctGetBit(at index:Int) -> UInt8 {
        guard index >= 0 && index < 32 else {
            assert(false,"Index out of range. Must be between 0 and 31.")
            return 0
        }
        let mask = UInt32(1) << index
        return (self & mask) != 0 ? 1 : 0
    }
    public func ctGet(startAt startIndex: Int, length n: Int) -> UInt32 {
        guard startIndex >= 0 && startIndex < 32 && n > 0 && startIndex + n <= 32 else {
            assert(false,"Invalid index or bit count. Ensure index is between 0 and 31, and that index + count does not exceed 32.")
            return 0
        }
        let mask = UInt32((1 << n) - 1) << startIndex
        return (self & mask) >> startIndex
    }
    public var ctSplit: (byte3:UInt8, byte2:UInt8, byte1:UInt8, byte0:UInt8, bytes:[UInt8]) {
        let byte0 = UInt8(self & 0xFF)
        let byte1 = UInt8((self >> 8) & 0xFF)
        let byte2 = UInt8((self >> 16) & 0xFF)
        let byte3 = UInt8((self >> 24) & 0xFF)
        return (byte3, byte2, byte1, byte0,[byte3, byte2, byte1, byte0])
    }
    
    public var ctBytes: [UInt8] {
        let byte0 = UInt8(self & 0xFF)
        let byte1 = UInt8((self >> 8) & 0xFF)
        let byte2 = UInt8((self >> 16) & 0xFF)
        let byte3 = UInt8((self >> 24) & 0xFF)
        return [byte3, byte2, byte1, byte0]
    }
    
    public static func ctCombine(byte3: UInt8, byte2: UInt8, byte1: UInt8, byte0: UInt8) -> UInt32 {
        return (UInt32(byte3) << 24) | (UInt32(byte2) << 16) | (UInt32(byte1) << 8) | UInt32(byte0)
    }
    
}

extension Data {
    public static func ctJoin(_ byte:UInt8) -> Data {
        Data().ctJoin(byte)
    }
    public static func ctJoin(bytes:[UInt8]) -> Data {
        Data().ctJoin(bytes: bytes)
    }
    
    public func ctJoin(_ byte:UInt8) -> Data {
        var data = self
        data.append(contentsOf: [byte])
        return data
    }
    public func ctJoin(bytes:[UInt8]) -> Data {
        var data = self
        data.append(contentsOf: bytes)
        return data
    }
    public var ctBytes:[UInt8] {
        [UInt8](self)
    }
}
