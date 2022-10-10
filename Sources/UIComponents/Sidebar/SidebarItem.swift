//
//  SidebarItem.swift
//  
//
//  Created by Robin Israel on 10/10/22.
//

import SwiftUI

public struct SidebarItem<V, Label, Destination>: View where V: Hashable, Label: View, Destination: View {
	let destination: () -> Destination
	let label: 	 	 () -> Label
	var tag: 		 V? = nil
	var selection: 	 Binding<V?>? = nil
	
	public init(@ViewBuilder destination: @escaping () -> Destination,
		 @ViewBuilder label: 	   @escaping () -> Label) {
		self.destination = destination
		self.label 	 	 = label
	}
	
	public init(tag: V,
		 selection: Binding<V?>,
		 @ViewBuilder destination: @escaping () -> Destination,
		 @ViewBuilder label: 	   @escaping () -> Label) {
		self.destination = destination
		self.label 	 	 = label
		
		self.tag = tag
		self.selection = selection
	}

	public var body: some View {
		if let tag = self.tag, let selection = self.selection {
			NavigationLink(tag: tag, selection: selection, destination: destination, label: label)
		} else {
			NavigationLink(destination: destination, label: label)
		}
    }
}

struct SidebarItem_Previews: PreviewProvider {
	enum Views {
		case View0
		case View1
		case View2
	}

	struct Preview: View {
		@State private var selection: Views? = .View0

		var body: some View {
			NavigationView {
				Sidebar {
					SidebarItem(tag: Views.View0, selection: $selection) {
						Text("View 0")
					} label: {
						Text("Row 0")
					}
					
					SidebarItem(tag: Views.View1, selection: $selection) {
						Text("View 1")
					} label: {
						Text("Row 1")
					}
					
					SidebarItem(tag: Views.View2, selection: $selection) {
						Text("View 2")
					} label: {
						Text("Row 2")
					}
				}
				.navigationTitle("Sidebar Section")
			}
		}
	}

    static var previews: some View {
		Preview()
    }
}
