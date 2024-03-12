//
//  DeviceDetailView.swift
//  ble
//
//  Created by Charles Wilmot on 3/12/24.
//

import Foundation
import SwiftUI
import SwiftData
import CoreBluetooth

struct DeviceDetailView: View {
    @ObservedObject var bleManager: BLEManager
    var peripheral: CBPeripheral
    
    var body: some View {
        VStack {
            Text("Connected to: \(peripheral.name ?? "Unknown")")
            Text("Received Data: \(bleManager.receivedData)")
        }
        .navigationBarTitle(Text(peripheral.name ?? "Unknown"), displayMode: .inline)
        .onAppear {
            bleManager.connect(to: peripheral)
        }
    }
}
