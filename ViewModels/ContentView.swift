//
//  ContentView.swift
//  Shared
//
//  Created by ANAS ELFAURI on 05/03/2022.
//


import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

// MARK: ViewModel ContentView
struct ContentView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        
        
        NavigationView {
            
            List(obs.datas) { i in
                
                NavigationLink(destination: ItemDetails(displayData: i)) {
                    CardView(name: i.name,url: i.image_urls.first ?? "")
                }
                
            }
            .navigationBarTitle("Home")
        }.overlay( LoaderView(tintColor: .blue, scaleSize: 3.0).padding(.bottom,50).hidden(obs.isHideLoader))
        
    }
}

// MARK: View ContentView_Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Observer
class Observer: ObservableObject {
    @Published var datas = [ItemModel]()
    @Published var isHideLoader : Bool = false
    
    init() {
        
        if !Connectivity.isConnectedToInternet() {
            print("internet is not available.")
            // do some tasks..
            return;
        }
        
        // MARK: Network Call
        //-----------------GET Call----------------------
        //pass model to the network call - get call
        NetworkManager(data: [:], url: nil, service: .dynamodbWriter, method: .get, isJSONRequest: false).executeQuery(){
            
            (result: Result<BaseResultModel<[ItemModel]>,Error>) in
            switch result{
            case .success(let response):
                print(response)
                self.datas = response.results ?? [];
                self.isHideLoader = true
            case .failure(let error):
                print(error)
                self.isHideLoader = true
                
            }
        }
        //-----------------------------------------------------
        
    }
}


struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    ActivityIndicator(.constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}
