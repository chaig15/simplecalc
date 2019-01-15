//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var operation: String = "";
        var nums = [Int]();
        for string in args {
            let num = Int(string);
            if (num != nil) {
                nums.append(num!);
            } else {
                operation = string;
            }
        }
        if (operation == "+") {
            return nums[0] + nums[1];
        } else if (operation == "-") {
            return nums[0] - nums[1];
        }  else if (operation == "/") {
            return (nums[0]/nums[1]);
        } else if (operation == "%") {
            return (nums[0]%nums[1]);
        } else if (operation == "*") {
            return (nums[0]*nums[1]);
        } else if (operation == "count") {
            return nums.count;
        } else if (operation == "avg") {
            if (nums.count == 0) {
                return 0;
            }
            var sum: Int = 0;
            for num in nums {
                sum += num;
            }
            return sum/nums.count;
        } else if (operation == "fact") {
            if (nums.count == 0) {
                return 0;
            } else if (nums.count == 1 && nums[0] == 1 || nums[0] == 0) {
                return 1;
            }
            var fact: Int = 1;
            var num = nums[0];
            while num > 0 {
                fact = fact * num;
                num = num - 1;
            }
            return fact;
        }
        return 0;
        
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

