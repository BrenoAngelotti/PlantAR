//
//  PlantPickerViewModel.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import Foundation

class PlantPickerViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    
    init() {
        loadPlants()
    }
    
    func loadPlants(){
//        let fileManager = FileManager.default
//
//        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
//            return
//        }
//
//        var availableModels: [String] = []
//        for fileName in files where fileName.hasSuffix("usdz"){
//            let modelName = fileName.replacingOccurrences(of: ".usdz", with: "")
//            availableModels.append(modelName)
//        }
//
//        availableModels.forEach(
//            {
//                plants.append(Plant(id: $0, name: $0, scientificName: $0, info: $0, extraInfo: $0))
//            }
//        )
        plants = [
            Plant(id: "espada_de_sao_jorge", name: "Espada de São Jorge", scientificName: "Dracaena trifasciata", info: "Apodrecerá facilmente se for regado em excesso. É comumente recomendado para iniciantes interessados no cultivo de plantas de interior pela sua facilidade de cuidado.", extraInfo: "Nas Religiões afro-brasileiras, ela é também chamada de espada-de-ogum (quando tem coloração verde) ou espada-de-iansã (bicolor, com bordas amarelas). Esta folha sagrada é uma folha gún (excitante, \"quente\"), sempre presente nos rituais de sasanha e na realização de águas sagradas denominada de abô.", difficulty: 2, water: 1),
            Plant(id: "costela_de_adao", name: "Costela de Adão", scientificName: "Mostera deliciosa", info: "Força e resistência são adjetivos ideais para definir a Costela-de-adão, pois elas podem se adaptar com rapidez a quase todo tipo de ambiente. A espécie tem se tornado uma opção exótica para decorar pequenos jardins, varandas ou mesmo ambientes internos. A Costela de Adão é indicada como a planta do momento pelos profissionais de paisagismo e vem se destacando, também, no meio da moda.", extraInfo: "A espécie é nativa do México e é mundialmente cultivada como ornamental pelas belas e peculiares folhas, com segmentos que lembram costelas. Seu fruto é comestível e muito saboroso, daí seu nome científico, Monstera deliciosa.", difficulty: 1, water: 2)
        ]
    }
}
