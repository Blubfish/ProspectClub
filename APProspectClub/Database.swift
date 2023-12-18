import FirebaseFirestore

class Database: ObservableObject {
    @Published var list = [Clubs]()
    private var db = Firestore.firestore()
    
    func addData(name: String, rating: Double) {
        let db = Firestore.firestore()
        db.collection("FoodList").addDocument(data: ["name":name, "rating":rating]) { error in
            if error == nil {
                self.getData()
            }
            else {
                print("Error")
                return
            }
        }
    }
    
    func updateData(FoodListUpdate: Clubs, name: String, rating: Double) {
        let db = Firestore.firestore()
        db.collection("ProspectClub").document(FoodListUpdate.id).setData(["name":name], merge: true) { error in
            db.collection("FoodList").document(FoodListUpdate.id).setData(["rating":rating], merge: true) { error in
                if error == nil{
                    self.getData()
                }
            }
        }
    }
    
    func deleteData(ClubsDelete: Clubs){
        db.collection("ProspectClub").document(ClubsDelete.id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                self.getData()
            }
        }
    }
    
    func getData() {
        db.collection("ProspectClub").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            self.list = documents.map { d -> Clubs in
                let data = d.data()
                let id = d.documentID
                let description = data["ClubDescription"] as? String ?? ""
                print(description)
                let name = data["ClubName"] as? String ?? ""
                print(name)
                let sponser = data["Sponser"] as? String ?? ""
                print(sponser)
                
                return Clubs(id: id ,ClubName: name, Sponser: sponser, ClubDescription: description)
            }
        }
    }
}
