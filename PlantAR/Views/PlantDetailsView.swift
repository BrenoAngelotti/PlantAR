//
//  PlantDetailsView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI

struct PlantDetailsView: View {
    @Binding var plant: Plant?
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 10){
                Image(plant!.picture)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 200)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10){
                    VStack(alignment: .leading){
                        Text(plant!.name).font(.title)
                        Text(plant!.scientificName).font(.subheadline).italic()
                    }
                    
                    Text(plant!.info)
                    
                    if(plant!.extraInfo != nil && !plant!.extraInfo!.isEmpty){
                        VStack(alignment: .leading){
                            Text("Curiosidades").font(.headline)
                            Text(plant!.extraInfo!)
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Dificuldade").bold()
                        HStack{
                            ForEach(0..<5){
                                if($0 < plant!.difficulty % 5){
                                    Image(systemName: "leaf.fill")
                                }
                                else{
                                    Image(systemName: "leaf")
                                }
                            }
                        }
                    }.foregroundColor(.accentColor)
                    
                    VStack(alignment: .leading){
                        Text("Água").bold()
                        HStack{
                            ForEach(0..<5){
                                if($0 < plant!.water % 5){
                                    Image(systemName: "drop.fill")
                                }
                                else{
                                    Image(systemName: "drop")
                                }
                            }
                        }
                    }.foregroundColor(.blue)
                    
                    VStack(alignment: .leading){
                        Text("Luz indireta").bold()
                        Image(systemName: "cloud.sun.fill")
                    }.foregroundColor(.orange)
                }.padding(10)
            }
        }
        .navigationBarTitle("Informações")
//        .navigationTitle("Informações")
    }
}

#if DEBUG
struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsView(plant: .constant(Plant(id: "espada_de_sao_jorge", name: "Espada de São Jorge", scientificName: "Dracaena trifasciata", info: "Apodrecerá facilmente se for regado em excesso. É comumente recomendado para iniciantes interessados no cultivo de plantas de interior pela sua facilidade de cuidado.", extraInfo: "Nas Religiões afro-brasileiras, ela é também chamada de espada-de-ogum (quando tem coloração verde) ou espada-de-iansã (bicolor, com bordas amarelas). Esta folha sagrada é uma folha gún (excitante, \"quente\"), sempre presente nos rituais de sasanha e na realização de águas sagradas denominada de abô.", difficulty: 2, water: 1)))
    }
}
#endif
