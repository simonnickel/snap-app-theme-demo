//
//  AppState.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme
	
/// Definition of the main state of the app.
struct AppState {
	
	var themeConfigs: [ThemeConfig] = [
		ThemeConfig.backgroundsBase,
		ThemeConfig.colorsBase,
		ThemeConfig.gradientsInteractive,
		ThemeConfig.fontsBase,
		ThemeConfig.fontFamilyBase,
		ThemeConfig.fontDesignRound,
		ThemeConfig.iconsBase,
		ThemeConfig.numbersBase,
		ThemeConfig.numbersScaleBase
	]
	
	var showThemeConfiguration = false
	
}
