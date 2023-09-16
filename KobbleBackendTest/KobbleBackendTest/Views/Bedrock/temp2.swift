//
//  temp2.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/8/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct temp2: View {
    @State private var sourceItems = ["Item 1", "Item 2", "Item 3"]
    @State private var destinationItems: [String] = ["asdh"]
    
    var body: some View {
        HStack(spacing: 30) {
            List {
                ForEach(sourceItems, id: \.self) { item in
                    Text(item)
                        .onDrag {
                            print("Dragging: \(item)")
                            // Set up the drag item
                            let dragItem = NSItemProvider(object: item as NSString)
                            return dragItem
                        }
                }
            }
            .frame(width: 150)
            .background(Color.red.opacity(0.2))
            
            List {
                ForEach(destinationItems, id: \.self) { item in
                    Text(item)
                }
            }
            .frame(width: 150)
            .background(Color.blue)
            .onDrop(of: [UTType.plainText.identifier], isTargeted: nil) {
                providers -> Bool in
                print("Attempting to drop")
                // Check if we can load the object as a plain text string
                if let itemProvider = providers.first, itemProvider.canLoadObject(ofClass: String.self) {
                    // Load the object
                    itemProvider.loadObject(ofClass: String.self) { (obj, error) in
                        if let droppedString = obj as? String {
                            DispatchQueue.main.async {
                                // Append the dropped string to the destination and remove it from the source
                                destinationItems.append(droppedString)
                                if let index = sourceItems.firstIndex(of: droppedString) {
                                    sourceItems.remove(at: index)
                                }
                            }
                        }
                    }
                    return true
                }
                return false
            }
        }
        .padding()
    }
}

struct temp2_Previews: PreviewProvider {
    static var previews: some View {
        temp2()
    }
}


/**
*/
