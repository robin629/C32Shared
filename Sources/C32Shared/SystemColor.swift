//
//  SystemColor.swift
//  C32Shared
//
//  Created by Robin Israel on 9/18/22.
//

import SwiftUI

#if canImport(UIKit)

import UIKit

fileprivate typealias PlatformColor = UIColor

#elseif canImport (AppKit)

import AppKit

fileprivate typealias PlatformColor = NSColor

#endif

// MARK: Standard Colors

@available(iOS 13.0, macOS 10.15, *)
extension Color {
	/// A blue color that automatically adapts to the current trait environment.
	static let systemBlue 	= Color(PlatformColor.systemBlue)
	
	/// A brown color that automatically adapts to the current trait environment.
	static let systemBrown	= Color(PlatformColor.systemBrown)

	/// A cyan color that automatically adapts to the current trait environment.
	@available(iOS 15.0, macOS 12.0, *)
	static let systemCyan 	= Color(PlatformColor.systemCyan)
	
	/// A green color that automatically adapts to the current trait environment.
	static let systemGreen 	= Color(PlatformColor.systemGreen)
	
	/// An indigo color that automatically adapts to the current trait environment.
	static let systemIndigo	= Color(PlatformColor.systemIndigo)
	
	/// A mint color that automatically adapts to the current trait environment.
	@available(iOS 15.0, *)
	static let systemMint	= Color(PlatformColor.systemMint)
	
	/// An orange color that automatically adapts to the current trait environment.
	static let systemOrange = Color(PlatformColor.systemOrange)
	
	/// A pink color that automatically adapts to the current trait environment.
	static let systemPink	= Color(PlatformColor.systemPink)
	
	/// A purple color that automatically adapts to the current trait environment.
	static let systemPurple	= Color(PlatformColor.systemPurple)

	/// A red color that automatically adapts to the current trait environment.
	static let systemRed 	= Color(PlatformColor.systemRed)
	
	/// A teal color that automatically adapts to the current trait environment.
	static let systemTeal 	= Color(PlatformColor.systemTeal)
	
	/// A yellow color that automatically adapts to the current trait environment.
	static let systemYellow = Color(PlatformColor.systemYellow)
	
}

@available(iOS 13.0, macOS 10.15, *)
extension Color {
	
	/// The standard base gray color that adapts to the environment.
	static let systemGray 	= Color(PlatformColor.systemGray)
	
	#if canImport(UIKit) && !os(tvOS)

	/// A second-level shade of gray that adapts to the environment.
	static let systemGray2 	= Color(PlatformColor.systemGray2)

	/// A third-level shade of gray that adapts to the environment.
	static let systemGray3 	= Color(PlatformColor.systemGray3)
	
	/// A fourth-level shade of gray that adapts to the environment.
	static let systemGray4 	= Color(PlatformColor.systemGray4)
	
	/// A fifth-level shade of gray that adapts to the environment.
	static let systemGray5 	= Color(PlatformColor.systemGray5)
	
	/// A sixth-level shade of gray that adapts to the environment.
	static let systemGray6 	= Color(PlatformColor.systemGray6)

	#endif
}

@available(iOS 13.0, macOS 10.15, *)
extension Color {
	
	#if canImport(UIKit) && !os(tvOS)

	/// The standard base gray color that adapts to the environment.
	static let clear = Color(PlatformColor.clear)

	#endif
}

#if canImport(UIKit)

// MARK: UI Colors - UIKit

@available(iOS 13.0, *)
extension Color {
	
	// MARK: Label colors

	/// The color for text labels that contain primary content.
	static let label 				= Color(PlatformColor.label)

	/// The color for text labels that contain secondary content.
	static let secondaryLabel 		= Color(PlatformColor.secondaryLabel)
	
	/// The color for text labels that contain tertiary content.
	static let tertiaryLabel 		= Color(PlatformColor.tertiaryLabel)
	
	/// The color for text labels that contain quaternary content.
	static let quaternaryLabel 		= Color(PlatformColor.quaternaryLabel)
	
	// MARK: Fill colors
	
	/// An overlay fill color for thin and small shapes.
	static let systemFill 			= Color(PlatformColor.systemFill)
	
	/// An overlay fill color for medium-size shapes.
	static let secondarySystemFill	= Color(PlatformColor.secondarySystemFill)
	
	/// An overlay fill color for large shapes.
	static let tertiarySystemFill	= Color(PlatformColor.tertiarySystemFill)
	
	/// An overlay fill color for large areas that contain complex content.
	static let quaternarySystemFill	= Color(PlatformColor.quaternarySystemFill)
	
	// MARK: Text colors
	
	/// The color for placeholder text in controls or text views.
	static let placeholderText		= Color(PlatformColor.placeholderText)
	
	// MARK: Tint color
	
	/// A color value that resolves at runtime based on the current tint color of the app or trait hierarchy.
	@available(iOS 15.0, *)
	static let tintColor			= Color(PlatformColor.tintColor)
	
	// MARK: Standard content background colors
	
	/// The color for the main background of your interface.
	static let systemBackground					= Color(PlatformColor.systemBackground)
	
	/// The color for content layered on top of the main background.
	static let secondarySystemBackground		= Color(PlatformColor.secondarySystemBackground)
	
	/// The color for content layered on top of secondary backgrounds.
	static let tertiarySystemBackground			= Color(PlatformColor.tertiarySystemBackground)
	
	// MARK: Grouped content background colors
	
	/// The color for the main background of your grouped interface.
	static let systemGroupedBackground			= Color(PlatformColor.systemGroupedBackground)
	
	/// The color for content layered on top of the main background of your grouped interface.
	static let secondarySystemGroupedBackground	= Color(PlatformColor.secondarySystemGroupedBackground)
	
	/// The color for content layered on top of secondary backgrounds of your grouped interface.
	static let tertiarySystemGroupedBackground	= Color(PlatformColor.tertiarySystemGroupedBackground)
	
	// MARK: Separator colors
	
	/// The color for thin borders or divider lines that allows some underlying content to be visible.
	static let separator		= Color(PlatformColor.separator)
	
	/// The color for borders or divider lines that hides any underlying content.
	static let opaqueSeparator	= Color(PlatformColor.opaqueSeparator)
	
	// MARK: Link color
	
	/// The specified color for links.
	static let link	= Color(PlatformColor.link)
	
	// MARK: Nonadaptable colors
	
	/// The nonadaptable system color for text on a light background.
	static let darkText		= Color(PlatformColor.darkText)
	
	/// The nonadaptable system color for text on a dark background.
	static let lightText	= Color(PlatformColor.lightText)
}

#elseif canImport(AppKit)

// MARK: UI Colors - AppKit

@available(macOS 10.15, *)
extension Color {
	
	// MARK: Label colors

	/// The color for text labels that contain primary content.
	static let label 				= Color(PlatformColor.labelColor)

	/// The color for text labels that contain secondary content.
	static let secondaryLabel 		= Color(PlatformColor.secondaryLabelColor)
	
	/// The color for text labels that contain tertiary content.
	static let tertiaryLabel 		= Color(PlatformColor.tertiaryLabelColor)
	
	/// The color for text labels that contain quaternary content.
	static let quaternaryLabel 		= Color(PlatformColor.quaternaryLabelColor)
	
	// MARK: Text colors
	
	/// The color to use for text.
	static let text 					= Color(PlatformColor.textColor)
	
	/// The color to use for placeholder text in controls or text views.
	static let placeholderText			= Color(PlatformColor.placeholderTextColor)
	
	/// The color to use for selected text.
	static let selectedText				= Color(PlatformColor.selectedTextColor)
	
	/// The color to use for the background area behind text.
	static let textBackground			= Color(PlatformColor.textBackgroundColor)
	
	/// The color to use for the background of selected text.
	static let selectedTextBackground	= Color(PlatformColor.selectedTextBackgroundColor)
	
	/// The color to use for the keyboard focus ring around controls.
	static let keyboardFocusIndicator	= Color(PlatformColor.keyboardFocusIndicatorColor)
	
	/// The color to use for selected text in an unemphasized context.
	static let unemphasizedSelectedText	= Color(PlatformColor.unemphasizedSelectedTextColor)

	/// The color to use for the text background in an unemphasized context.
	static let unemphasizedSelectedTextBackground	= Color(PlatformColor.unemphasizedSelectedTextBackgroundColor)

	// MARK: Content colors
	
	/// The color to use for links.
	static let link							= Color(PlatformColor.linkColor)
	
	/// The color to use for separators between different sections of content.
	static let separator					= Color(PlatformColor.separatorColor)
	
	/// The color to use for the background of selected and emphasized content.
	static let selectedContentBackground	= Color(PlatformColor.selectedContentBackgroundColor)
	
	/// The color to use for selected and unemphasized content.
	static let unemphasizedSelectedContentBackground	= Color(PlatformColor.unemphasizedSelectedContentBackgroundColor)
	
	// MARK: Menu color
	
	/// The color to use for the text in menu items.
	static let selectedMenuItemText	= Color(PlatformColor.selectedMenuItemTextColor)
	
	// MARK: Table colors
	
	/// The color to use for the text in menu items.
	static let grid			= Color(PlatformColor.gridColor)
	
	/// The color to use for text in header cells in table views and outline views.
	static let headerText	= Color(PlatformColor.headerTextColor)
	
	/// The colors to use for alternating content, typically found in table views and collection views.
	static var alternatingContentBackground	= PlatformColor.alternatingContentBackgroundColors.map(Color.init)
	
	// MARK: Control colors
	
	/// The user's current accent color preference.
	static let controlAccent		= Color(PlatformColor.controlAccentColor)
	
	/// The color to use for the flat surfaces of a control.
	static let control				= Color(PlatformColor.controlColor)
	
	/// The color to use for the background of large controls, such as scroll views or table views.
	static let controlBackground	= Color(PlatformColor.controlBackgroundColor)
	
	/// The color to use for text on enabled controls.
	static let controlText			= Color(PlatformColor.controlTextColor)
	
	/// The color to use for text on disabled controls.
	static let disabledControlText	= Color(PlatformColor.disabledControlTextColor)
	
	/// The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
	static let selectedControl		= Color(PlatformColor.selectedControlColor)
	
	/// The color to use for text in a selected control—that is, a control being clicked or dragged.
	static let selectedControlText	= Color(PlatformColor.selectedControlTextColor)
	
	/// The color to use for text in a selected control.
	static let alternateSelectedControlText	= Color(PlatformColor.alternateSelectedControlTextColor)

	/// The patterned color to use for the background of a scrubber control.
	static let scrubberTexturedBackground	= Color(PlatformColor.scrubberTexturedBackground)
	
	// MARK: Window colors
	
	/// The color to use for the window background.
	static let windowBackground		= Color(PlatformColor.windowBackgroundColor)
	
	/// The color to use for text in a window's frame.
	static let windowFrameText		= Color(PlatformColor.windowFrameTextColor)
	
	/// The color to use in the area beneath your window's views.
	static let underPageBackground	= Color(PlatformColor.underPageBackgroundColor)
	
	// MARK: Highlights and Shadows
	
	/// The highlight color to use for the bubble that shows inline search result values.
	static let findHighlight	= Color(PlatformColor.findHighlightColor)
	
	/// The color to use as a virtual light source on the screen.
	static let highlight		= Color(PlatformColor.highlightColor)
	
	/// The color to use for virtual shadows cast by raised objects on the screen.
	static let shadow			= Color(PlatformColor.shadowColor)
}

#endif
