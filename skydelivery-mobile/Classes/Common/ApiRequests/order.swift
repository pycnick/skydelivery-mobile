//
//  order.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

struct OrderRequest {
    init(address: String, phone: String, comment: String, persons: Int, fullPrice: Int) {
        self.Address = address
        self.Phone = phone
        self.Comment = comment
        self.PersonNum = persons
        self.Price = Float(fullPrice)
    }
    
    var UserID: Int = 0
    var RestID: Int = 0
    var Address: String
    var Comment: String
    var Phone: String
    var PersonNum: Int
    var Products: [ProductReq] = []
    var Price: Float = 0
}

struct ProductReq {
    init(prodID: Int, count: Int) {
        self.ProdID = prodID
        self.Count = count
    }
    
    var ProdID: Int
    var Count: Int
}
