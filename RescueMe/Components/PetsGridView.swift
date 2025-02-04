//
//  PetsGridView.swift
//  RescueMe
//
//  Created by Laura Isabel Rojas Bustamante on 4/02/25.
//

import SwiftUI

struct PetsGridView: View {
    
    enum PetsGridType {
        case rectangle
        case circle
    }
    
    let emoji: String
    let petCategory: String
    let isSelected: Bool
    let gridType: PetsGridType
    let onTapAction: () -> Void
    
    var body: some View {
        Group {
            switch gridType {
            case .rectangle:
                Button {
                    onTapAction()
                } label: {
                    VStack(spacing: 8) {
                        Text(emoji)
                            .font(.system(size: 40))
                        
                        Text(petCategory)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    .frame(width: 110, height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                isSelected ? Color.primaryOrange : Color.gray.opacity(0.5),
                                lineWidth: isSelected ? 2 : 1
                            )
                    )
                }
            case .circle:
                VStack(spacing: 8) {
                    Button {
                        onTapAction()
                    } label: {
                        Text(emoji)
                            .font(.system(size: 40))
                        
                            .frame(width: 100, height: 100)
                            .overlay(
                                Circle()
                                    .stroke(
                                        isSelected ? Color.primaryOrange : Color.gray.opacity(0.5), lineWidth: isSelected ? 2 : 1)
                            )
                    }
                    
                    Text(petCategory)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}


#Preview {
    VStack(spacing: 32) {
        HStack(spacing: 16) {
            PetsGridView(emoji: "🐈", petCategory: "Cats", isSelected: false, gridType: .rectangle, onTapAction: {})
            PetsGridView(emoji: "🐕", petCategory: "Dogs", isSelected: true, gridType: .rectangle, onTapAction: {})
            PetsGridView(emoji: "🦅", petCategory: "Birds", isSelected: false, gridType: .rectangle, onTapAction: {})
            
        }
        
        HStack(spacing: 16) {
            PetsGridView(emoji: "🐈", petCategory: "Cats", isSelected: true, gridType: .circle, onTapAction: {})
            PetsGridView(emoji: "🐕", petCategory: "Dogs", isSelected: false, gridType: .circle, onTapAction: {})
            PetsGridView(emoji: "🦅", petCategory: "Birds", isSelected: false, gridType: .circle, onTapAction: {})
        }
    }
}
