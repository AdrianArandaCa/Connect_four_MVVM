//
//  ContentView.swift
//  Connect_four_MVVM
//
//  Created by Dev on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var showAlert = false
    
    var body: some View {
        ZStack(alignment: Alignment.trailing) {
            BackgroundView()
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    TitleView()
                    Spacer()
                    ArrowButtonsStack(viewModel: viewModel,
                                      data: viewModel.arrows,
                                      showAlert: $showAlert,
                                      width: proxy.size.width * 0.9,
                                      height: proxy.size.height * 0.5)
                    HStack(alignment: .bottom ,spacing: -18) {
                        LegBoardView(width: proxy.size.width * 0.05,
                                     height: proxy.size.height * 0.16,
                                     aligmentRectangle: .trailing)
                        .zIndex(1)
                        
                        MatrixButtonStack(viewModel: viewModel,
                                          data: viewModel.board,
                                          width: proxy.size.width * 0.9,
                                          heigth: proxy.size.height * 0.4)
                        .padding(.bottom, 32)
                        
                        LegBoardView(width: proxy.size.width * 0.05,
                                     height: proxy.size.height * 0.16,
                                     aligmentRectangle: .leading)
                        .zIndex(1)
                    }
                    Spacer()
                    HStack(spacing: 20) {
                        PointView(viewModel: viewModel,
                                  colorFill: .red)
                        PointView(viewModel: viewModel,
                                  colorFill: .yellow)
                    }
                    .frame(width: proxy.size.width * 0.5)
                    Spacer()
                    ResetButton(viewModel: viewModel)
                    Spacer()
                    
                }
                .frame(width: proxy.size.width)
            }
        }
        .onAppear()
        .alert(isPresented: $showAlert) {
            showAlertWin()
        }
    }
    
    func showAlertWin() -> Alert {
        return Alert(title: Text(String(format: "%@ %@","THE_PLAYER_HAS_WON".localized(), viewModel.playerWinner?.name ?? "" )),
                     dismissButton: .default(Text("OK")) {
            viewModel.resetBoard()
            showAlert = false
        })
    }
}

struct PointView: View {
    @ObservedObject var viewModel: ViewModel
    var colorFill: Color
    
    var body: some View {
        VStack {
            ZStack {
                CircleView(colorFill: colorFill)
                Text (colorFill == .red ? viewModel.redWins : viewModel.yellowWins)
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
            }
            Text(colorFill == .red ? "RED".localized() : "YELLOW".localized())
                .foregroundColor(.white)
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("Connect 4")
            .font(.system(size: 40, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
    }
}

struct BackgroundView: View {
    var body: some View {
        Image("wallpaperConnect")
            .resizable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


