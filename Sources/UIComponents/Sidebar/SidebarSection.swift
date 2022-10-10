//
//  SidebarSection.swift
//  
//
//  Created by Robin Israel on 10/10/22.
//

import SwiftUI

public struct SidebarSection<Content, Header, Footer>: View where Content: View, Header: View, Footer: View {
	private var collapsible = false

	let content: () -> Content
	let header:  () -> Header?
	let footer:  () -> Footer?

	public init(@ViewBuilder content: @escaping () -> Content,
		 @ViewBuilder header:  @escaping () -> Header,
		 @ViewBuilder footer:  @escaping () -> Footer) {
		self.content = content
		self.header = header
		self.footer = footer
	}

    public var body: some View {
		Section {
			content()
		} header: {
			if let label = self.header {
				label()
			}
		} footer: {
			if let label = self.footer {
				label()
			}
		}
		
	#if os(macOS)
		.collapsible(collapsible)
	#endif
    }
}

extension SidebarSection where Header == EmptyView, Footer == EmptyView {
	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
		self.header  = { nil }
		self.footer  = { nil }
	}
}

extension SidebarSection where Footer == EmptyView {
	public init(@ViewBuilder content: @escaping () -> Content,
		 @ViewBuilder header:  @escaping () -> Header) {
		self.content = content
		self.header  = header
		self.footer  = { nil }
	}
}

extension SidebarSection where Header == EmptyView {
	public init(@ViewBuilder content: @escaping () -> Content,
		 @ViewBuilder footer:  @escaping () -> Footer) {
		self.content = content
		self.header  = { nil }
		self.footer  = footer
	}
}

extension SidebarSection where Content: View, Header: View, Footer: View {
	public func collapsible(_ value: Bool) -> some View {
		var newView = self
		
		newView.collapsible = value
		
		return newView
	}
}

struct SidebarSection_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			Sidebar {
				SidebarSection {
					Text("S0-R0")
					Text("S0-R1")
				} header: {
					Text("Section 0 - Header")
				}
				
				SidebarSection {
					Text("S1-R0")
					Text("S1-R1")
				} footer: {
					Text("Section 1 - Footer")
				}
				
				SidebarSection {
					Text("S2-R0")
					Text("S2-R1")
				} header: {
					Text("Section 2 - Header")
				} footer: {
					Text("Section 2 - Footer")
				}
			}
			.navigationTitle("Sidebar Section")
		}
    }
}
