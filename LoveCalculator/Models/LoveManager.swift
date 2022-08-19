//
//  LoveManager.swift
//  LoveCalculator
//
//  Created by Chris Boshoff on 2022/08/19.
//

import Foundation

protocol LoveProtocol {
    func fetchLove(_ love: LoveModel)
}

struct LoveManager {
    
    var delegate: LoveProtocol?
    
    func callAPI(firstName: String, secondName: String) {
        guard let url = URL(string: "https://loverapi.herokuapp.com/api/v1/calculate?personA=\(firstName)&personB=\(secondName)") else{return}
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode(LoveModel.self, from: data)
                    let love = tasks
                
                    DispatchQueue.main.async {
                        self.delegate?.fetchLove(love)
                        print("This is love: \(love.message)")
                    }                                       
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
