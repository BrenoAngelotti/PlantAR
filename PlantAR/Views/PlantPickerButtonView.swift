//
//  PlantPickerButtonView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI

struct PlantPickerButtonView: View {
    var plant: Plant
    
    @Binding var isShowingDetail: Bool
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedPlant: Plant?
    
    var body: some View {
        Button(action: {
            isPlacementEnabled.toggle()
            selectedPlant = plant
        }){
            ZStack(alignment: .center ){
                Color(.white)
                
                VStack(alignment: .trailing ){
                    HStack{
                        Spacer()
                        Button(action: {
                            selectedPlant = plant
                            isShowingDetail.toggle()
                        }){
                            Image(systemName: "info.circle")
                        }.padding(10)
                    }
                    Spacer()
                }

                VStack{
                    Image(plant.id)
                        .resizable()
                        .scaledToFit()

                    Text(plant.name)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(4)
            }
        }
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(10)
    }
}

struct PlantPickerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlantPickerButtonView(plant: Plant(id: "espada_de_sao_jorge", name: "Espada de São Jorge", scientificName: "Dracaena trifasciata", info: "Apodrecerá facilmente se for regado em excesso. É comumente recomendado para iniciantes interessados no cultivo de plantas de interior pela sua facilidade de cuidado.", extraInfo: "Nas Religiões afro-brasileiras, ela é também chamada de espada-de-ogum (quando tem coloração verde) ou espada-de-iansã (bicolor, com bordas amarelas). Esta folha sagrada é uma folha gún (excitante, \"quente\"), sempre presente nos rituais de sasanha e na realização de águas sagradas denominada de abô.", difficulty: 2, water: 1), isShowingDetail: .constant(false), isPlacementEnabled: .constant(false), selectedPlant: .constant(nil))
    }
}
