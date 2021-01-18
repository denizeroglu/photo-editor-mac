//
//  ImageView.swift
//  PhotoEditor
//
//  Created by Deniz Eroglu on 2021-01-18.
//

import SwiftUI
import AppKit

extension NSImage.Name {
    static let sample1Compressed = NSImage.Name("Sample-1-Compressed")
    static let sample1Raw = NSImage.Name("Sample-1-Raw")
}

struct PhotoView: View {

    @State var image: Image?

    var body: some View {
        VStack {
            HStack {
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            }
        }.onAppear(perform: {
            loadImage()
        })
    }

    func loadImage() {
        guard let nsImage = NSImage(named: .sample1Raw) else {
            return
        }
        image = Image(nsImage: nsImage)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
