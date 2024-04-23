//
//  LabelStyleModel.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 24.09.23.
//

@preconcurrency import SwiftUI // TODO concurrency: LabelStyle is not Sendable yet.
import SnapTheme

struct LabelStyleModel: Identifiable, Hashable, Equatable, Sendable {
	
	internal init(name: String, apiFull: String? = nil, apiExtension: String? = nil, style: any LabelStyle, styleOptions: [LabelStyleModel] = [], cardStyle: Theme.Card.Style? = nil) {
		self.name = name
		self.apiFull = apiFull
		self.apiExtension = apiExtension
		self.style = style
		self.styleOptions = styleOptions
		self.cardStyle = cardStyle
	}
	
	let id: UUID = UUID()
	let name: String
	let apiFull: String?
	let apiExtension: String?
	let style: any LabelStyle
	let styleOptions: [LabelStyleModel]
	let cardStyle: Theme.Card.Style?
	
	static func == (lhs: LabelStyleModel, rhs: LabelStyleModel) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(name)
	}
	
	
	// MARK: - Definitions
	
	static let all: [LabelStyleModel] = [
		themeCTA, themeCTASecondary, .themeToolbar, themeListRow, themeSectionFooter, themeSectionHeader, themeSidebar, themeSidebarSectionHeader, themeTag
	]
	
	static let themeCTA: LabelStyleModel = .init(
		name: "ThemeCTA",
		apiFull: "ThemeLabelStyleButtonPrimary()",
		apiExtension: ".themeButtonPrimary()",
		style: ThemeLabelStyleButtonPrimary(),
		styleOptions: [
			.init(name: "default", style: ThemeLabelStyleButtonPrimary(), cardStyle: .accent),
		],
		cardStyle: .accent
	)
	
	static let themeCTASecondary: LabelStyleModel = .init(
		name: "ThemeCTASecondary",
		apiFull: "ThemeLabelStyleButtonSecondary()",
		apiExtension: ".themeCTAScondary()",
		style: ThemeLabelStyleButtonSecondary(),
		styleOptions: [
			.init(name: "default", style: ThemeLabelStyleButtonSecondary(), cardStyle: .content),
		],
		cardStyle: .content
	)
	
	static let themeToolbar: LabelStyleModel = .init(
		name: "ThemeToolbar",
		apiFull: "ThemeLabelStyleToolbar()",
		apiExtension: "-v",
		style: ThemeLabelStyleToolbar(placement: .navigation, showTitle: true),
		styleOptions: [
			.init(name: "Placement: .navigation", style: ThemeLabelStyleToolbar(placement: .navigation, showTitle: true)),
			.init(name: "Placement: .sidebarBottom", style: ThemeLabelStyleToolbar(placement: .sidebarBottom, showTitle: true))
		]
	)
	
	static let themeListRow: LabelStyleModel = .init(
		name: "ThemeListRow",
		apiFull: "ThemeLabelStyleListRow(highlightIcon:)",
		apiExtension: ".themeListRow(highlightIcon:)",
		style: ThemeLabelStyleListRow(),
		styleOptions: [
			.init(name: "Icon Highlight toggled", style: .themeListRow(highlightIcon: !ThemeLabelStyleListRow.defaultHighlightIcon))
		]
	)
	
	static let themeSectionFooter: LabelStyleModel = .init(
		name: "ThemeSectionFooter",
		apiFull: "ThemeLabelStyleSectionFooter()",
		apiExtension: ".themeSectionFooter",
		style: ThemeLabelStyleSectionFooter(),
		styleOptions: []
	)
	
	static let themeSectionHeader: LabelStyleModel = .init(
		name: "ThemeSectionHeader",
		apiFull: "ThemeLabelStyleSectionHeader(textCase:prominent:)",
		apiExtension: ".themeSectionHeader(textCase:prominent:)",
		style: ThemeLabelStyleSectionHeader(),
		styleOptions: [
			.init(name: "Lowercase", style: .themeSectionHeader(textCase: .lowercase, prominent: false)),
			.init(name: "Lowercase prominent", style: .themeSectionHeader(textCase: .lowercase, prominent: true)),
			.init(name: "Uppercase", style: .themeSectionHeader(textCase: .uppercase, prominent: false)),
			.init(name: "Uppercase prominent", style: .themeSectionHeader(textCase: .uppercase, prominent: true)),
		]
	)
	
	static let themeSidebar: LabelStyleModel = .init(
		name: "ThemeLabelStyleSidebar",
		apiFull: "ThemeLabelStyleSidebar(isSelected:)",
		apiExtension: ".themeSidebar(isSelected:)",
		style: ThemeLabelStyleSidebar(),
		styleOptions: [
			.init(name: "isSelected: false", style: .themeSidebar(isSelected: false)),
			.init(name: "isSelected: true", style: .themeSidebar(isSelected: true), cardStyle: .accent),
		]
	)
	
	static let themeSidebarSectionHeader: LabelStyleModel = .init(
		name: "ThemeLabelStyleSidebarSectionHeader",
		apiFull: "ThemeLabelStyleSidebarSectionHeader(textCase:)",
		apiExtension: ".themeSidebarSectionHeader(textCase:)",
		style: ThemeLabelStyleSidebarSectionHeader(),
		styleOptions: [
			.init(name: "textCase: .lowercase", style: .themeSidebarSectionHeader(textCase: .lowercase)),
			.init(name: "textCase: .uppercase", style: .themeSidebarSectionHeader(textCase: .uppercase)),
		]
	)
	
	static let themeTag: LabelStyleModel = .init(
		name: "ThemeLabelStyleTag",
		apiFull: "ThemeLabelStyleTag(color:background:)",
		apiExtension: ".themeTag(color:background:)",
		style: ThemeLabelStyleTag(),
		styleOptions: [
			.init(name: "color: .accentPrimary, background: default", style: .themeTag(color: .accentPrimary)),
			.init(name: "selected", style: .themeTag(selected: true)),
		]
	)
	
}
