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
		ThemeConfig.colorsBase,
		ThemeConfig.backgroundsInteractiveGradient,
		ThemeConfig.fontsBase,
		ThemeConfig.fontFamilyBase,
		ThemeConfig.fontDesignBase,
		ThemeConfig.textSurfacesBase,
		ThemeConfig.iconsBase,
		ThemeConfig.numbersBase,
		ThemeConfig.numbersScaleBase
	]
	
	var showThemeConfiguration = false
	
}
