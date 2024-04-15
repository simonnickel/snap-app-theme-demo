//
//  IconKeys+App.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

extension Theme.IconKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.IconKey : Theme.IconValue] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.IconKey] = [.navExamples, .navColors, .navText, .navLists, .navElements, .navLabelStyles, .navKeys, .toolbarThemeConfig]
	
	public static let navExamples = Theme.IconKey("navGroupExamples", default: .system(name: "photo.on.rectangle.angled"))
	public static let navColors = Theme.IconKey("navColors", default: .system(name: "paintpalette"))
	public static let navText = Theme.IconKey("navText", default: .system(name: "textformat"))
	public static let navLists = Theme.IconKey("navLists", default: .system(name: "list.bullet"))
	
	public static let navElements = Theme.IconKey("navGroupElements", default: .system(name: "list.triangle"))
	public static let navLabelStyles = Theme.IconKey("navLabelStyles", default: .system(name: "tag"))
	
	public static let navKeys = Theme.IconKey("navGroupKeys", default: .system(name: "key.horizontal"))
	
	public static let toolbarThemeConfig = Theme.IconKey("toolbarThemeConfig", default: .system(name: "circle.dashed.inset.filled"))
	
}
