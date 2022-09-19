//
//  FileUtils.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import Foundation

public class FileUtils {
	static func loadFileFromBundle(_ filename: String) -> Data? {
		let prefix = (filename as NSString).pathExtension
		let name = (filename as NSString).deletingPathExtension

		guard let fullPath = Bundle.main.path(forResource: name, ofType: prefix) else { return nil }

		do {
			return try String(contentsOfFile: fullPath).data(using: .utf8)
		} catch {
			return nil
		}
	}

	static func loadFileFromBundle(filename: String, type: String) -> Data? {
		guard let fullPath = Bundle.main.path(forResource: filename, ofType: type) else { return nil }

		do {
			return try String(contentsOfFile: fullPath).data(using: .utf8)
		} catch {
			return nil
		}
	}
}
