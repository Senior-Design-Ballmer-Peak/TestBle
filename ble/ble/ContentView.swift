//
//  ContentView.swift
//  ble
//
//  Created by Charles Wilmot on 3/12/24.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    @ObservedObject var bleManager = BLEManager()
    @State private var selectedPeripheral: CBPeripheral?

    var body: some View {
        NavigationStack {
            List {
                ForEach(bleManager.discoveredPeripherals, id: \.identifier) { peripheral in
                    NavigationLink(value: peripheral) {
                        Text(peripheral.name ?? "Unknown")
                    }
                }
            }
            .navigationTitle("Discovered Devices")
            .navigationDestination(for: CBPeripheral.self) { peripheral in
                DeviceDetailView(bleManager: bleManager, peripheral: peripheral)
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
