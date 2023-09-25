//
//  ByteArray.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import Foundation

public class ByteArray {
	private var _data = [UInt8]()
	private var _pos  = 0

	public var count:	  Int { get { _data.count } }
	public var remaining: Int { get { _data.count - _pos } }
	public var endIndex:  Int { get { _data.endIndex } }
	
	public init(_ data: [UInt8] = []) {
		_data = data
	}
	
	public init(_ data: Data) {
		_data = [UInt8](data)
	}
	
	public init(_ data: ByteArray) {
		_data = data._data
	}
		
	public init(_ ascii: String) {
		let filtered = Array(ascii.filter({ $0.isHexDigit }))
		
		/* The ascii-hex string must have an even number of characters */
		if (0 != (filtered.count & 1)) {
			return
		}

		/* Convert ascii-hex string to uint8 array */
		for i in stride(from: 0, to: filtered.count, by: 2) {
			if let hi = filtered[i].hexDigitValue, let lo = filtered[i + 1].hexDigitValue {
				_data.append(UInt8((hi & 0xF) << 4 | (lo & 0xF)))
			}
		}
	}
	
	public func split(from: Int, to: Int) -> ByteArray {
		guard from < _data.count, from + to < _data.count else { return ByteArray([UInt8]()) }

		return ByteArray(Array(_data[from...(from+to)]))
	}
	
	public func toBytes() -> [UInt8] {
		return _data
	}
	
	public func toData() -> Data {
		return Data(_data)
	}
	
	public func toDebugString(prefix: String = "", suffix: String = "") -> String {
		return ByteUtils.hexToStr(_data, prefix: prefix, suffix: suffix)
	}
	
	public func toAscii() -> String {
		return String(bytes: _data, encoding: .ascii) ?? ""
	}
	
	public func toUtf8() -> String {
		return String(bytes: _data, encoding: .utf8) ?? ""
	}
	
	public func toUtf16() -> String {
		return String(bytes: _data, encoding: .utf16) ?? ""
	}
	
	public func toUtf16BE() -> String {
		return String(bytes: _data, encoding: .utf16BigEndian) ?? ""
	}
	
	public func toUtf16LE() -> String {
		return String(bytes: _data, encoding: .utf16LittleEndian) ?? ""
	}
	
	public func toUtf32() -> String {
		return String(bytes: _data, encoding: .utf32) ?? ""
	}
	
	public func toUtf32BE() -> String {
		return String(bytes: _data, encoding: .utf32BigEndian) ?? ""
	}
	
	public func toUtf32LE() -> String {
		return String(bytes: _data, encoding: .utf32LittleEndian) ?? ""
	}

	public func read(_ length: UInt8, _ moveCursor: Bool = true) -> ByteArray? {
		return readBytes(Int(length), moveCursor)
	}

	public func read(_ length: UInt16, _ moveCursor: Bool = true) -> ByteArray? {
		return readBytes(Int(length), moveCursor)
	}
	
	public func read(_ length: UInt32, _ moveCursor: Bool = true) -> ByteArray? {
		return readBytes(Int(length), moveCursor)
	}
	
	public func read(_ length: Int, _ moveCursor: Bool = true) -> ByteArray? {
		return readBytes(Int(length), moveCursor)
	}

	public func readU8(_ moveCursor: Bool = true) -> UInt8 {
		guard _data.count >= _pos + 1 else { return 0 }

		let retval = UInt8(_data[_pos])

		if (moveCursor) {
			_pos += 1
		}

		return retval
	}

	public func readU16(_ moveCursor: Bool = true) -> UInt16 {
		guard _data.count >= _pos + 2 else { return 0 }
		
		let retval = UInt16(_data[_pos]) << 8 | UInt16(_data[_pos + 1])

		if (moveCursor) {
			_pos += 2
		}

		return retval
	}

	public func readU32(_ moveCursor: Bool = true) -> UInt32 {
		guard _data.count >= _pos + 4 else { return 0 }
		
		let retval = UInt32(_data[_pos]) << 24 | UInt32(_data[_pos + 1]) << 16 | UInt32(_data[_pos + 2]) << 8 | UInt32(_data[_pos + 3])

		if (moveCursor) {
			_pos += 4
		}

		return retval
	}
	
	public func readVar(_ moveCursor: Bool = true) -> UInt32 {
		guard _data.count >= _pos + 1, _data[_pos] <= 4, _data.count >= _pos + Int(_data[_pos]) + 1 else { return 0 }
		var retval: UInt32 = 0

		if (0x1234 == UInt32(0x1234).littleEndian) {

			for i in 0..<Int(_data[_pos]) {
				retval |= UInt32(_data[Int(_data[_pos]) + _pos - i]) << (i * 8)
			}

		} else {

			for i in 0..<Int(_data[_pos]) {
				retval |= UInt32(_data[_pos + i + 1]) << (i * 8)
			}

		}

		if (moveCursor) {
			_pos += Int(_data[_pos]) + 1
		}

		return retval
	}

	public func writeVar(_ value: UInt8) {
		_data += [0x01, value]
	}

	public func writeVar(_ value: UInt16) {
		_data += [0x02, UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
	}

	public func writeVar(_ value: UInt32) {
		if (value <= 0xFFFFFF) {
			_data += [0x03, UInt8((value >> 16) & 0xFF), UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
		} else {
			_data += [0x04, UInt8((value >> 24) & 0xFF), UInt8((value >> 16) & 0xFF), UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
		}
	}

	public static func +=(lhs: ByteArray, rhs: UInt8) {
		lhs._data.append(rhs)
	}
	
	public static func +=(lhs: ByteArray, rhs: UInt16) {
		lhs._data.append(contentsOf: [UInt8((rhs >> 8) & 0xFF), UInt8(rhs & 0xFF)])
	}
	
	public static func +=(lhs: ByteArray, rhs: UInt32) {
		lhs._data.append(contentsOf: [UInt8((rhs >> 24) & 0xFF), UInt8((rhs >> 16) & 0xFF), UInt8((rhs >> 8) & 0xFF), UInt8(rhs & 0xFF)])
	}
	
	public static func +=(lhs: ByteArray, rhs: [UInt8]) {
		lhs._data.append(contentsOf: rhs)
	}
	
	public static func +=(lhs: ByteArray, rhs: Data) {
		lhs._data.append(contentsOf: rhs)
	}
	
	public static func +=(lhs: ByteArray, rhs: ByteArray) {
		lhs._data.append(contentsOf: rhs.toData())
	}

	public subscript(index: Int) -> UInt8 {
		get {
			if (index < _data.count) {
				return _data[index]
			} else {
				return 0
			}
		}
	}
	
	private func readBytes(_ length: Int, _ moveCursor: Bool = true) -> ByteArray? {
		guard length > 0, _pos + (length - 1) < _data.count else { return nil }

		let retval = ByteArray(Array(_data[_pos...(_pos + length - 1)]))

		if (moveCursor) {
			_pos += length
		}

		return retval
	}
}

extension ByteArray: Sequence {
	public typealias Iterator = Array<UInt8>.Iterator

	public func makeIterator() -> Iterator {
		_data.makeIterator()
	}
}
