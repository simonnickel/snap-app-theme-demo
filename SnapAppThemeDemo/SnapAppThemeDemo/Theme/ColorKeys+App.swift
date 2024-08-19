//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

extension Theme.ColorKey {
	
	
	// MARK: - Base Overrides
	
	static var definitionsApp: [Theme.ColorKey : Theme.ColorValue] {[
		:
				// .accentColorBase: .color(.purple)
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.ColorKey] = [.exampleColor]
	
	public static let exampleColor = Theme.ColorKey("exampleColor", default: .color(.purple))
	
}
