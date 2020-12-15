//
//  ContentView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ContentView : View {
    @State var selectedPlant: Plant?
    
    @State private var isPlacementEnabled = false
    @State private var plantConfirmedForPlacement: Plant?
    
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(plantConfirmedForPlacement: $plantConfirmedForPlacement, isPlacementEnabled: $isPlacementEnabled)

            if(isPlacementEnabled){
                ConfirmationButtonsView(isPlacementEnabled: $isPlacementEnabled, selectedPlant: $selectedPlant, plantConfirmedForPlacement: $plantConfirmedForPlacement)
            }
            else{
                PlantPickerView(isPlacementEnabled: $isPlacementEnabled, selectedPlant: $selectedPlant)
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var plantConfirmedForPlacement: Plant?
    @Binding var isPlacementEnabled: Bool

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [ .horizontal ]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        arView.showsLargeContentViewer = true
        
        arView.clipsToBounds = true
        
        _ = FocusEntity(on: arView, style: .classic)
//        focusEntity.isEnabled = isPlacementEnabled
        
        let arCoaching = ARCoachingOverlayView()
        
        arCoaching.goal = .horizontalPlane
        arCoaching.session = arView.session
        arCoaching.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        
        arView.addSubview(arCoaching)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let plantModel = plantConfirmedForPlacement {
            if let modelEntity = plantModel.modelEntity {
                let anchorEntity = AnchorEntity(plane: .any)
                
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            }
            
            DispatchQueue.main.async {
                plantConfirmedForPlacement = nil                
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
