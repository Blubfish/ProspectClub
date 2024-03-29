import FirebaseFirestore

class Database: ObservableObject {
    @Published var list = [Clubs]()
    private var db = Firestore.firestore()
    
    func getData() {
        db.collection("ProspectClub").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            self.list = documents.map { d -> Clubs in
                let data = d.data()
                let id = d.documentID
                let description = data["Description"] as? String ?? ""
                let name = data["Name"] as? String ?? ""
                print(name)
                let sponser = data["Sponsor"] as? String ?? ""
                let competitive = data["Competitive"] as? Bool ?? true
                let email = data["Email"] as? String ?? ""
                return Clubs(id: id ,Name: name, Sponsor: sponser, Description: description, Competitve: competitive, Email: email)
            }
        }
    }
}
