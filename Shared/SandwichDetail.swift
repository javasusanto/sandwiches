//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Heri Susanto on 04/04/21.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    
    var body: some View {
        VStack {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage:"flame.fill")
                    Spacer()
                }
                .padding(.all)
                .font(Font.headline.smallCaps())
                .background(Color.red)
                .foregroundColor(.yellow)
                .transition(.move(edge: .bottom))
            }
           
        }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                SandwichDetail(sandwich: testData[1])
            }
            NavigationView{
                SandwichDetail(sandwich: testData[5])
            }
        }
    }
}
