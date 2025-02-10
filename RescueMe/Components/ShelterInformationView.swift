//
//  ShelterInformationView.swift
//  RescueMe
//
//  Created by Laura Isabel Rojas Bustamante on 10/02/25.
//

import SwiftUI

struct ShelterInformationView: View {
    var shelter: Shelter
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            VStack {
                Image(.shelterImageMock)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(shelter.name)
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(.primaryOrange)
                    
                    Text(shelter.formattedAddress)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Image(systemName: "phone.badge.waveform.fill")
                        .foregroundStyle(.primaryOrange)
                    Text(shelter.formattedPhone)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(.primaryOrange)
                    Text(shelter.contactEmail)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                }
                HStack {
                    Image(systemName: "globe")
                        .foregroundStyle(.primaryOrange)
                    Text(shelter.formattedWebsite)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(Color.white)
    }
}

#Preview {
    HStack {
        ShelterInformationView(shelter: .previewShelter)
            .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray.opacity(0.2))
}
