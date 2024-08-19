//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
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
		ThemeConfig.numbersBase,
	]
	
	var showThemeConfiguration = false
	
}
