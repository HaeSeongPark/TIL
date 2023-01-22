//
//  LandmakrList.swift
//  Landmarks
//
//  Created by rhino Q on 2023/01/21.
//

import SwiftUI

struct LandmakrList: View {
    @EnvironmentObject var modelData:ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmakr in
                    NavigationLink {
                        LandmarkDetail(landmark: landmakr)
                    } label: {
                        LandmarkRow(landmark: landmakr)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmakrList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmakrList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
