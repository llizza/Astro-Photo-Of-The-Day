//
//  PictureView.swift
//  AstroPhoto
//
//  Created by Елизавета Матвеева on 16.03.2024.
//

import SwiftUI

struct PictureView: View {
    
    @ObservedObject var manager = NetworkManager()
    var body: some View {
        VStack(alignment: .leading, content: {
            if manager.image != nil {
                Image(uiImage: self.manager.image!).resizable().scaledToFit()
            }
            
            ScrollView{
                Text(manager.photoInfo.title)
                Text(manager.photoInfo.explanation)
                    .underline(color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }})
        
            
    }
}

//#Preview {
//    PictureView()
//}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View{
        let view = PictureView()
        view.manager.photoInfo = PhotoInfo.createDefault()
        
        return view
    }
}
