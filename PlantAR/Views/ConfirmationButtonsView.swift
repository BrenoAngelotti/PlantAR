//
//  ConfirmationButtonsView.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI

struct ConfirmationButtonsView: View {
    let buttonSize: CGFloat? = 40
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedPlant: Plant?
    @Binding var plantConfirmedForPlacement: Plant?
    
    var body: some View {
        HStack(spacing: 10){
            Button(action: {
                resetPlacementParameters()
            }){
                Image(systemName: "xmark")
            }
            .foregroundColor(.red)
            .frame(width: buttonSize, height: buttonSize, alignment: .center)
            .background(Color.white)
            .clipShape(Circle())

            Button(action: {
                plantConfirmedForPlacement = selectedPlant
                resetPlacementParameters()
            }){
                Image(systemName: "checkmark")
            }
            .frame(width: buttonSize, height: buttonSize, alignment: .center)
            .background(Color.white)
            .clipShape(Circle())
        }
        .font(.headline)
        .padding()
    }
    
    func resetPlacementParameters(){
        isPlacementEnabled = false
        selectedPlant = nil
    }
}

struct ConfirmationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationButtonsView(isPlacementEnabled: .constant(true), selectedPlant: .constant(nil), plantConfirmedForPlacement: .constant(nil))
    }
}
