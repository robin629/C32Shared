//
//  LoggerExtension.swift
//  
//
//  Created by Robin Israel on 10/23/22.
//

import Foundation

import Foundation
import OSLog

extension Logger {
	func criticalf(_ fmt: String, _ args: CVarArg...) {
		self.critical("\(String(format: fmt, arguments: args))")
	}
	
	func errorf(_ fmt: String, _ args: CVarArg...) {
		self.error("\(String(format: fmt, arguments: args))")
	}
	
	func warningf(_ fmt: String, _ args: CVarArg...) {
		self.warning("\(String(format: fmt, arguments: args))")
	}

	func debugf(_ fmt: String, _ args: CVarArg...) {
		self.debug("\(String(format: fmt, arguments: args))")
	}
}
