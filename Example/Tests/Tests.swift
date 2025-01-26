import XCTest
import DataConvert

extension Data {
    var description: String { debugDescription }
    var debugDescription: String { NSData(data: self).debugDescription }
}

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        
        
        //---------------------
        let timeH = 23
        let timeM = 50
        let timeData = Data.ctJoin(0x33).ctJoin(0x23).ctJoin(bytes: [timeH.ctUInt8,timeM.ctUInt8])
        print("timeData:\(timeData.debugDescription)")

        //---------------------
        let time = 0x5023
        print("time:\(time)")
        print("time.ctUint16:\(time.ctUInt16)")
        print("time.ctSplit:(\(time.ctUInt16.ctSplit.byte1),\(time.ctUInt16.ctSplit.byte0))")
        print("time.ctSplit.bytes:(\(time.ctUInt16.ctSplit.bytes))")

        let data = Data().ctJoin(0x33).ctJoin(bytes:[0x01,0x01]).ctJoin(bytes: time.ctUInt16.ctSplit.bytes)
        print(data.debugDescription)

        let data2 = Data().ctJoin(0x33).ctJoin(bytes:[0x01,0x01]).ctJoin(bytes: time.ctUInt16.ctSplit.bytes.reversed())
        print(data2.debugDescription)

        //---------------------
        print("0:\(0.ctUInt8.ctSet(bit: .bit1, at: 0))")
        print("1:\(0.ctUInt8.ctSet(bit: .bit1, at: 1))")
        print("2:\(0.ctUInt8.ctSet(bit: .bit1, at: 2))")
        print("3:\(0.ctUInt8.ctSet(bit: .bit1, at: 3))")
        print("4:\(0b1101.ctUInt8.ctSet(bit: .bit0, at: 3))")

        //---------------------
        print("ctGetBit(0):\(0b1101.ctUInt8.ctGetBit(at:0))")
        print("ctGetBit(1):\(0b1101.ctUInt8.ctGetBit(at:1))")
        print("ctGetBit(2):\(0b1101.ctUInt8.ctGetBit(at:2))")
        print("ctGetBit(3):\(0b1101.ctUInt8.ctGetBit(at:3))")

        print("ctGet(2,2):\(0b1101.ctUInt8.ctGet(startAt: 2, length: 2))")
        print("ctGet(0,1):\(0b1101.ctUInt8.ctGet(startAt: 0, length: 1))")

        print("ctGet(0,4):\(0b11010111.ctUInt8.ctGet(startAt: 0, length: 4))")

        print("ctGet(15,1):\(0b0110111111001111.ctUInt16.ctGet(startAt: 15, length: 1))")
        print("ctGet(14,1):\(0b0110111111001111.ctUInt16.ctGet(startAt: 14, length: 1))")
        print("ctGet(13,2):\(0b0110111111001111.ctUInt16.ctGet(startAt: 13, length: 2))")

        //-----------------------
        let tem = UInt16.ctCombine(byte1: 1, byte0: 2)
        print("tem:\(tem)")
        let temData = Data.ctJoin(bytes:tem.ctBytes)
        print("temData:\(temData.debugDescription)")
        

//        let ff = UInt32(0xff)
//        print("0xff -> uint32:\(ff)")
//        
//        let color1 = (0xFF << 24) | (0 << 16) | (0 << 8) | 0
//        print("color1:\(color1)")
        
        let color = UInt32.ctCombine(byte3: 0xff, byte2: 1, byte1: 1, byte0: 1)
        print("color:\(color)")
        
        let kelvin = UInt16.ctCombine(byte1: 1, byte0: 2)
        print("kelvin:\(kelvin)")
        
        let rgb = 0xaabbcc
        let result = rgb.ctUInt32.ctSplit
        let r = result.byte2
        let g = result.byte1
        let b = result.byte0
        print("r:\(r) g:\(g) b:\(b)")
        
        let kResult = kelvin.ctSplit
        let high = kResult.byte1
        let low = kResult.byte0
        print("high:\(high) low:\(low)")
        
        print("1 << 7 : \(1.ctUInt16.ctLeftShift(15))")
        print("\(0xa3.ctUInt16.ctGet(startAt: 0, length: 7))")
        
        print("Int.max: \(Int.max)")
        print("Int.min: \(Int.min)")
        
        print("UInt8.max: \(UInt8.max)")
        print("UInt8.min: \(UInt8.min)")
        
        print("UInt16.max: \(UInt16.max)")
        print("UInt16.min: \(UInt16.min)")
        
        print("UInt32.max: \(UInt32.max)")
        print("UInt32.min: \(UInt32.min)")
        
        print("UInt64.max: \(UInt64.max)")
        print("UInt64.min: \(UInt64.min)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
