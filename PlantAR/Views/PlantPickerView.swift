//
//  PlantPickerView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI

struct PlantPickerView: View {
    @ObservedObject private var viewModel = PlantPickerViewModel()
    @State private var isShowingDetail = false
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedPlant: Plant?

    var body: some View {
        VStack{
            Spacer()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0){
                    ForEach(viewModel.plants){plant in
                        PlantPickerButtonView(plant: plant, isShowingDetail: $isShowingDetail, isPlacementEnabled: $isPlacementEnabled, selectedPlant: $selectedPlant)
                    }
                }
            }
            .background(Color(.black).opacity(0.5))
        }
        .sheet(isPresented: $isShowingDetail) {
            PlantDetailsView(plant: $selectedPlant)
        }
    }
}

struct PlantPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantPickerView(isPlacementEnabled: .constant(false), selectedPlant: .constant(nil))
    }
}
