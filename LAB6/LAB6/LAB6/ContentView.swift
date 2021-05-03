//
//  ContentView.swift
//  LAB6
//
//  Created by WUIJUI on 2021/4/28.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 = 6
    @State private var number2 = 6
    @State private var number3 = 6
  @State private var expected = "";
  @State private var money = 1000
  @State private var earn = 0
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "die.face.\(number1).fill")
                    .resizable()
                    .frame(width:50 , height: 50)
                Text("骰子1數字\(number1)")

            }
            HStack{
                Image(systemName: "die.face.\(number2).fill")
                    .resizable()
                    .frame(width:50 , height: 50)
                Text("骰子2數字\(number2)")
            }
            HStack{
                Image(systemName: "die.face.\(number3).fill")
                    .resizable()
                    .frame(width:50 , height: 50)
                Text("骰子3數字\(number3)")
            }
            HStack{
              TextField("請輸入猜測總和",text:$expected).frame(width: 100, height:50)
                Button(action: {
                    number1 = Int.random(in: 1...6)
                    number2 = Int.random(in: 1...6)
                    number3 = Int.random(in: 1...6)
                  if(Int(expected)! > (number1+number2+number3)){
                    earn = 100
                    money += earn
                  }else{
                    earn = -100
                    money += earn
                  }
                }, label: {
                    Text("猜測")
                })
            }
            Text("結果：\(earn)")
            Text("你現在有：\(money)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
