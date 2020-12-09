//
//  Plant.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import Foundation
import RealityKit
import Combine

class Plant: Identifiable{
    var id: String
    var modelName: String {
        return id + ".usdz"
    }
    var picture: String {
        return id + "_detail"
    }
    var name: String
    var scientificName: String
    var info: String
    var extraInfo: String?
    var modelEntity: ModelEntity?
    
    var difficulty: Int
    var water: Int
    //implementar luz
    
    private var cancellable: AnyCancellable? = nil
    
    init(id: String, name: String, scientificName: String, info: String, extraInfo: String?, difficulty: Int, water: Int) {
        self.id = id
        self.name = name
        self.scientificName = scientificName
        self.info = info
        self.extraInfo = extraInfo
        self.difficulty = difficulty
        self.water = water
        
        self.cancellable = ModelEntity.loadModelAsync(named: self.modelName)
            .sink(receiveCompletion: { (loadCompletion) in
                print("DEBUG: unnable to load model entity for \(self.modelName)")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("DEBUG: success in loading model entity for \(self.modelName)")
            })
    }
}
