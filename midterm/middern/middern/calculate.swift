//
//  calculate.swift
//  middern
//
//  Created by WUIJUI on 2021/5/1.
//

import Foundation


class calculate {
    var entered = [String](repeating:"",count:0);
    var output = ""
    var number = num()
    var OP = false
    var Operation = ""
    var opcount = 0

    
    func touchnumber(at index:Int)->String{
        if(OP == true){
            output+=Operation
            entered.append(Operation)
            Operation = ""
            OP = false
        }
        if(index < 10){
            if (number.iszero) {
                number.str = String(index)
                number.iszero = false
            }
            else{
                number.str += String(index)
            }
        }
        else if(index == 10)
        {
            if (number.hasdot) {
            }
            else{
                number.hasdot = true
                number.str+="."
            }
        }
        else if(index == 11){
             if(number.str[number.str.startIndex] == "-"){
                number.str.remove(at: number.str.startIndex)
            }
            else{
                number.str = "-" + number.str
            }
        }
        else if(index == 12){
            number.str = String(Float(number.str)!/100)
        }
        return output + number.str
    }
    func touchoperation(at index:Int)->String{
        if(OP == false){
            opcount+=1
            output += number.str
            OP = true
            entered.append(number.str)
            number.str = ""
            number.hasdot = false
            number.iszero = true
            
        }
        if(index == 0){
            Operation = "÷"
        }
        else if(index == 1){
            Operation = "x"
        }
        else if(index == 2){
            Operation = "+"
        }
        else if(index == 3){
            if(Operation == "+"){
                number.iszero = false
                number.str = "-"
            }
            else{
                Operation = "-"
            }
        }
        else{
            
        }
        return output + Operation + number.str
    }
    
    func findmd( entered:[String]) -> (Bool,[String]) {
        var out = entered;
        for index in 0...entered.count-1 {
            if entered[index] == "x" {
                out[index]=String(Double(entered[index-1])!*Double(entered[index+1])!);
                out[index-1] = "";
                out[index+1] = "";
                return (false,out.filter{$0 != ""});
            }else if entered[index] == "÷" {
                if(entered[index+1] == "0"){
                    out[index] = "0"
                }
                else{
                    out[index]=(String(Double(entered[index-1])!/Double(entered[index+1])!));
                }
                
                out[index-1] = "";
                out[index+1] = "";
                return (false,out.filter{$0 != ""});
            }
            
        }
        return (true,out);
    }
    
    func findpm( entered:[String]) -> (Bool,[String]) {
        var out = entered;
        for index in 0...entered.count-1 {
            if entered[index] == "+" {
                out[index]=String(Double(entered[index-1])!+Double(entered[index+1])!);
                out[index-1] = "";
                out[index+1] = "";
                return (false,out.filter{$0 != ""});
            }else if entered[index] == "-" {
                out[index]=(String(Double(entered[index-1])!-Double(entered[index+1])!));
                out[index-1] = "";
                out[index+1] = "";
                
                return (false,out.filter{$0 != ""});
            }
            
        }
        return (true,out);
    }
    
    func touchEqual() -> String{
        entered.append(number.str)
        var mdcheck = false
        var pmcheck = false
        var sol = ""
        while true {
            (mdcheck ,entered) = findmd(entered: entered)
            if mdcheck == true {
                (pmcheck ,entered) = findpm(entered: entered);
                if pmcheck == true {
                    opcount = 0;
                    sol = entered[0]
                    entered = [String](repeating:"",count:0);
                    break;
                }
            }
        }
        while(true){
            if(sol.last == "0"){
                sol.remove(at: sol.index(before: sol.endIndex))
                if(sol.last == "."){
                    sol.remove(at: sol.index(before: sol.endIndex))
                    break
            
                }
            }
            else{
                break
            }
        }
        reset()
        return sol
    }
    func reset() -> (String, String){
        entered = [String](repeating:"",count:0);
        output = ""
        number = num()
        OP = false
        Operation = ""
        opcount = 0
        return ("","0")
    }
}

