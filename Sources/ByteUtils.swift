//
//  ByteUtils.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import Foundation

public class ByteUtils {
	static func hexToStr(_ data: [UInt8] = [], prefix: String = "", suffix: String = " ") -> String {
		var retval = ""
		
		for (i, b) in data.enumerated() {
			retval += prefix + String(format: "%02X", b)
			
			if (i + 1 != data.endIndex) {
				retval += suffix
			}
		}
		
		return retval
	}
	
	static func hexToStr(_ data: ArraySlice<UInt8>, prefix: String = "", suffix: String = " ") -> String {
		var retval = ""
		
		for (i, b) in data.enumerated() {
			retval += prefix + String(format: "%02X", b)
			
			if (i + 1 != data.endIndex) {
				retval += suffix
			}
		}
		
		return retval
	}
	
	static func hexToStr(_ data: ByteArray, prefix: String = "", suffix: String = " ") -> String {
		var retval = ""
		
		for (i, b) in data.enumerated() {
			retval += prefix + String(format: "%02X", b)

			if (i + 1 != data.endIndex) {
				retval += suffix
			}
		}
		
		return retval
	}
	
	static func hexToStr(_ data: SafeByteArray, prefix: String = "", suffix: String = " ") -> String {
		var retval = ""
		
		for (i, b) in data.enumerated() {
			retval += prefix + String(format: "%02X", b)

			if (i + 1 != data.endIndex) {
				retval += suffix
			}
		}
		
		return retval
	}
}
