
import SwiftUI

struct ContentView: View {
    @State var numberTextField1 = ""
    @State var numberTextField2 = ""
    @State var warningContent = ""
    @State var isAlert = false
    @State var resultNumber: Float = 0.0
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: $numberTextField1)
                Text("÷")
                    .font(.title)
                TextField("", text: $numberTextField2)
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                resultNumber = checkNumbers(number1: numberTextField1, number2: numberTextField2)
            }) {
                Text("計算")
                    .padding()
            }
            Text(String(format: "%.2f", resultNumber))
                .alert("エラー", isPresented: $isAlert) {
                    Button("確認") {}
                } message: {
                    Text("\(warningContent)")
                }
        }
    }
    func checkNumbers(number1: String, number2: String) -> Float {
        if Int(number1) == nil {
            warningContent = "割られる数を入力してください"
            isAlert = true
        }
        if Int(number2) == nil {
            warningContent = "割る数を入力してください"
            isAlert = true
        }
        if Int(number2) == 0 {
            warningContent = "割る数には0は入力できません"
            isAlert = true
            
        }
        if isAlert {
            return 0
        }
        else {
            return Float(number1)! / Float(number2)!
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
