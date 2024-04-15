//
//  ThemeConfig.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

import SwiftUI
import SnapTheme


// MARK: - ThemeConfig

struct ThemeConfig: Identifiable, Equatable, Sendable {
	
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.id == rhs.id
	}
	
	let id = UUID()
	let sectionID: String
	let title: String?
	let text: String?
	let value: String?
	let icon: Theme.IconKey?
	
	typealias ModifyHandler = @Sendable (Theme) -> Theme
	let apply: ModifyHandler
	
}
