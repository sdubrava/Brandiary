//
//  FireStoreServiece.swift
//  Brandiary
//
//  Created by young on 2020/01/12.
//  Copyright © 2020 young. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class FireStoreService {
    
    private init() {}
    static let shared = FireStoreService()
    
    private func reference(to collectionReference: FireCollectionReference) -> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func create<T:Codable>(for encodableObject: T,in collectionReference: FireCollectionReference) {
        do{
            let json = try encodableObject.toJson(excluding: ["id"])
            reference(to: .posts).addDocument(data: json)
        }
        catch{
            print(error)
        }
        
    }
    
    
    func read<T:Decodable>(from collectionReference:FireCollectionReference,returning objectType:T.Type,completion: @escaping ([T]) -> Void){
        reference(to: .posts).addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else{return}
            do {
                var objects = [T]()
                for document in snapshot.documents {
                    let object = try document.decode(as: objectType.self)
                    objects.append(object)
                }
                completion(objects)
            }
            catch{
                print(error)
            }
        }
        
    }
    func update<T:Encodable & Identifiable>(for encodableObject: T, in collectionReference: FireCollectionReference){
        
        do{
            
            let json = try encodableObject.toJson(excluding: ["id"])
            guard let id = encodableObject.id else { throw MyError.encodingError }
            reference(to: .posts).document(id).setData(json)
        } catch {
            print(error)
        }
           
       }
    //_ identifiableObject: T,
    func delete<T:Identifiable>(_ identifiableObject: T,in collectionReference: FireCollectionReference){
        do{
           
            guard let id = identifiableObject.id else { throw MyError.encodingError}
            reference(to: .posts).document(id).delete()
            
        }catch {
            
        }
           
       }
   
}
