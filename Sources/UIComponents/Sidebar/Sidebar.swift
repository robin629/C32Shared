//
//  Sidebar.swift
//  
//
//  Created by Robin Israel on 10/10/22.
//

import SwiftUI

public struct Sidebar<Content>: View where Content: View {
	let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public var body: some View {
		List {
			content()
		}
	#if os(macOS)
		.listStyle(.sidebar)
	#elseif os(iOS)
		.listStyle(.insetGrouped)
	#endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			Sidebar {
				Text("Row 0")
				Text("Row 1")
			}
		}
    }
}
