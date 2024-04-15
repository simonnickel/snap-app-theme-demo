//
//  NavItem.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme
import SnapMatchingNavigation

/// Definition of main navigation hierarchy for Tab and Sidebar layouts.
enum NavItem: MNavItem, Codable, Equatable, Hashable, Identifiable {
	
	
	// MARK: - Scenes
	
	case examples
	case exampleColors, exampleText, exampleLists
	
	case elements
	case elementLabelStyles
	
	case keys
	case keysColor, keysSurface, keysBackground, keysFont, keysTextSurface, keysValue, keysIcon
	
	
	// MARK: - Navigation
	
	static let initial: NavItem = .examples
	
	
	// MARK: Sidebar
	
	static let sidebarSections: [NavItem] = [.examples, .elements, .keys]
	
	
	// MARK: Tabs
	
	/// TabConfiguration limits number of visible tabs based on device. Showing them in order of this array, required tabs will move forward to be visible. Additional tabs would be displayed in a list under the `more` tab. Should be avoided as this list can not be modified and has its own NavigationStack.
	static let tabsAvailable: [NavItem] = [.examples, .elements, .keys]
	static let tabsRequired: [NavItem] = []
	static let tabsDisabledByDefault: Set<NavItem> = []
	
	
	// MARK: - Hierarchy
	
	var subItems: [NavItem] {
		switch self {
			case .examples: [
				.exampleColors, .exampleText, .exampleLists
			]
			case .elements: [
				.elementLabelStyles
			]
				
			case .keys: [
				.keysColor, .keysSurface, .keysBackground, .keysFont, .keysTextSurface, .keysValue, .keysIcon
			]
			default: []
		}
	}
	
	
	// MARK: - Values
	
	var id: String { idDefault }
	
	var title: String? {
		switch self {
				
			case .exampleColors: "Colors"
			case .exampleText: "Text"
			case .exampleLists: "Lists"
				
			case .elements: "Elements"
			case .elementLabelStyles: "LabelStyles"
				
			case .keysColor: "Color Keys"
			case .keysSurface: "Surface Keys"
			case .keysBackground: "Background Keys"
			case .keysFont: "Font Keys"
			case .keysTextSurface: "Text Surface Keys"
			case .keysValue: "Value Keys"
			case .keysIcon: "Icon Keys"
				
			default: self.id.uppercasedFirstLetter
		}
	}
	
	var icon: Theme.IconKey? {
		switch self {
			case .examples: .navExamples
			case .elements: .navElements
			case .elementLabelStyles: .navLabelStyles
			case .keys: .navKeys
				
			case .exampleColors: .navColors
			case .exampleText: .navText
			case .exampleLists: .navLists
				
			case .keysColor, .keysSurface, .keysBackground, .keysFont, .keysTextSurface, .keysValue, .keysIcon: .navKeys
				
//			default: nil
		}
	}
	
}
