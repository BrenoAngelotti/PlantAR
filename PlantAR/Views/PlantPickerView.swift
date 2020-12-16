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
    @Binding var activityPlantId: String?

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
        .onChange(of: activityPlantId, perform: { value in
            if(value != nil){
                loadActivityPlant()
            }
        })
    }
    
    
    func loadActivityPlant(){
        if let plant = viewModel.loadPlant(withId: activityPlantId!){
            selectedPlant = plant
            isShowingDetail.toggle()
            activityPlantId = nil
        }
    }
}

struct PlantPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantPickerView(isPlacementEnabled: .constant(false), selectedPlant: .constant(nil), activityPlantId: .constant(nil))
    }
}
