//
//  Home.swift
//  CustomTransition
//
//  Created by shehan karunarathna on 2022-02-24.
//

import SwiftUI

struct Home: View {
    @State var show : Bool = false
    var body: some View {
        GeometryReader{
            proxy in
            let size = proxy.size
            CubicTransition(show: $show) {
                ZStack{
                    Image(systemName: "heart")
                        .font(.system(size: 100))
                    Button{
                        show.toggle()
                    }label: {
                        Text("Navigate")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            . cornerRadius(10)
                    }
                }
               
            } detail: {
                Image(systemName: "heart")
                    .font(.system(size: size.width))
                
            }

        }
     
        .overlay(alignment: .top) {
            HStack(spacing:12){
                if show {
                    Button{
                        show.toggle()
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                
                Text( show ? "Back": "Custom transition")
                    .font(.title.bold())
                    
            }
            .padding()
            .frame(maxWidth:.infinity, alignment: .leading)
            .background(.ultraThinMaterial)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
