//
//  LabelStylesList.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 24.09.23.
//

import SwiftUI
import SnapTheme

struct LabelStylesList: View {
	
	var body: some View {
		
		ThemeSceneList {
			
			ForEach(LabelStyleModel.all) { model in
				ListRow(model: model)
			}
			
		}
		.navigationDestination(for: LabelStyleModel.self) { model in
			LabelStyleExampleScreen(model: model)
		}
		
	}
	
	
	// MARK: - ListRow
	
	struct ListRow: View {
		
		let model: LabelStyleModel
		
		var body: some View {
			
			NavigationLink(value: model) {
				
				ThemeLabel(text: model.name)
					.labelStyle(.themeListRow())
				
			}
			.themeListRow()
			
		}
		
	}
	
}


// MARK: - Preview

#Preview {
			
	NavigationStack {
		LabelStylesList()
	}
	
}
