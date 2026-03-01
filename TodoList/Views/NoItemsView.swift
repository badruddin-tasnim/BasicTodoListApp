//
//  NoItemsView.swift
//  TodoList
//
//  Created by Badruddin Tasnim on 27/2/26.
//

internal import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There is no items here")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Make  your day productive! Add new task now and plan your day!")
                NavigationLink("Add Something", destination: AddView())
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color.blue : Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("Title")
    }
}
