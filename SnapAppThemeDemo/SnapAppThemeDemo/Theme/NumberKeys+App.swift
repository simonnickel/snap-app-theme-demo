//
//  NumberKeys+App.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

extension Theme.NumberKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.NumberKey : Theme.NumberValue] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.NumberKey] = [.themeConfigCardMinWidth, .themeConfigCardMinHeight]
	
	public static let themeConfigCardMinWidth = Theme.NumberKey("themeConfigCardMinWidth", default: .value(150))
	public static let themeConfigCardMinHeight = Theme.NumberKey("themeConfigCardMinHeight", default: .value(80))
	
}
