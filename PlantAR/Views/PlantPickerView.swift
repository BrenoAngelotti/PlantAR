//
//  PlantPickerView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI

struct PlantPickerView: View {
    @ObservedObject private var viewModel = PlantPickerViewModel()
    
    @State private var plantDetail: Plant? = nil
    @State private var isShowingDetail = false
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedPlant: Plant?

    var body: some View {
        VStack{
            Spacer()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0){
                    ForEach(viewModel.plants){plant in
                        PlantPickerButtonView(plant: plant, plantDetail: $plantDetail, isShowingDetail: $isShowingDetail, isPlacementEnabled: $isPlacementEnabled, selectedPlant: $selectedPlant)
                    }
                }
            }
            .background(Color(.black).opacity(0.5))
        }
        .sheet(isPresented: $isShowingDetail) {
            PlantDetailsView(plant: $plantDetail)
        }
    }
}

struct PlantPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantPickerView(isPlacementEnabled: .constant(false), selectedPlant: .constant(nil))
    }
}
