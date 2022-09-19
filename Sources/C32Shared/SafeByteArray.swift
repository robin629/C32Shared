//
//  SafeByteArray.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import Foundation

class SafeByteArray {
	private var _data = [UInt8]()
	private var _pos = 0

	public var count: Int { get { _data.count } }
	public var remaining: Int { get { _data.count - _pos } }
	public var endIndex: Int { get { _data.endIndex } }
	
	init(_ data: [UInt8] = []) {
		_data = data
	}
	
	func split(from: Int, to: Int) -> SafeByteArray? {
		guard from < _data.count, from + to < _data.count else { return nil }

		return SafeByteArray(Array(_data[from...(from+to)]))
	}

	func read(_ length: UInt8, _ moveCursor: Bool = true) -> SafeByteArray? {
		return readBytes(Int(length), moveCursor)
	}

	func read(_ length: UInt16, _ moveCursor: Bool = true) -> SafeByteArray? {
		return readBytes(Int(length), moveCursor)
	}
	
	func read(_ length: UInt32, _ moveCursor: Bool = true) -> SafeByteArray? {
		return readBytes(Int(length), moveCursor)
	}
	
	func read(_ length: Int, _ moveCursor: Bool = true) -> SafeByteArray? {
		return readBytes(Int(length), moveCursor)
	}
	
	func readU8(_ moveCursor: Bool = true) -> UInt8? {
		guard _data.count >= _pos + 1 else { return nil }

		let retval = UInt8(_data[_pos])

		if (moveCursor) {
			_pos += 1
		}

		return retval
	}

	func readU16(_ moveCursor: Bool = true) -> UInt16? {
		guard _data.count >= _pos + 2 else { return nil }
		
		let retval = UInt16(_data[_pos]) << 8 | UInt16(_data[_pos + 1])

		if (moveCursor) {
			_pos += 2
		}

		return retval
	}

	func readU32(_ moveCursor: Bool = true) -> UInt32? {
		guard _data.count >= _pos + 4 else { return nil }
		
		let retval = UInt32(_data[_pos]) << 24 | UInt32(_data[_pos + 1]) << 16 | UInt32(_data[_pos + 2]) << 8 | UInt32(_data[_pos + 3])

		if (moveCursor) {
			_pos += 4
		}

		return retval
	}

	func readVar(_ moveCursor: Bool = true) -> UInt32? {
		guard _data.count >= _pos + 1, _data[_pos] <= 4, _data.count >= _pos + Int(_data[_pos]) + 1 else { return nil }
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

	func writeVar(_ value: UInt8) {
		_data += [0x01, value]
	}

	func writeVar(_ value: UInt16) {
		_data += [0x02, UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
	}

	func writeVar(_ value: UInt32) {
		if (value <= 0xFFFFFF) {
			_data += [0x03, UInt8((value >> 16) & 0xFF), UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
		} else {
			_data += [0x04, UInt8((value >> 24) & 0xFF), UInt8((value >> 16) & 0xFF), UInt8((value >> 8) & 0xFF), UInt8(value & 0xFF)]
		}
	}

	static func +=(lhs: SafeByteArray, rhs: UInt8) {
		lhs._data.append(rhs)
	}
	
	static func +=(lhs: SafeByteArray, rhs: UInt16) {
		lhs._data.append(contentsOf: [UInt8((rhs >> 8) & 0xFF), UInt8(rhs & 0xFF)])
	}
	
	static func +=(lhs: SafeByteArray, rhs: UInt32) {
		lhs._data.append(contentsOf: [UInt8((rhs >> 24) & 0xFF), UInt8((rhs >> 16) & 0xFF), UInt8((rhs >> 8) & 0xFF), UInt8(rhs & 0xFF)])
	}
	
	static func +=(lhs: SafeByteArray, rhs: [UInt8]) {
		lhs._data.append(contentsOf: rhs)
	}

	subscript(index: Int) -> UInt8 {
		get {
			if (index < _data.count) {
				return _data[index]
			} else {
				return 0
			}
		}
	}
	
	private func readBytes(_ length: Int, _ moveCursor: Bool = true) -> SafeByteArray? {
		guard length > 0, _pos + (length - 1) < _data.count else { return nil }

		let retval = SafeByteArray(Array(_data[_pos...(_pos + length - 1)]))

		if (moveCursor) {
			_pos += length
		}

		return retval
	}
}

extension SafeByteArray: Sequence {
	typealias Iterator = Array<UInt8>.Iterator

	func makeIterator() -> Iterator {
		_data.makeIterator()
	}
}
