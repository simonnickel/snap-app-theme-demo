//
//  ValueKeys+App.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

extension Theme.ValueKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.ValueKey : Theme.ValueType] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.ValueKey] = [.themeConfigCardMinWidth, .themeConfigCardMinHeight]
	
	public static let themeConfigCardMinWidth = Theme.ValueKey("themeConfigCardMinWidth", default: 150)
	public static let themeConfigCardMinHeight = Theme.ValueKey("themeConfigCardMinHeight", default: 80)
	
}
