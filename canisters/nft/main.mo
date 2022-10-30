import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Text "mo:base/Text";

// class vi dung de tao smart contract
actor class NFT(name : Text, assest : Text, collection : Text, owner : Principal, description : Text, index : Nat) = this {
    Debug.print("NFT works");

    // Debug.print("NFT class works!");
    private var nftName = name;
    // var vi se chuyen no di cho nguoi khac
    private var nftAssest : Text = assest;
    private var nftCollection = collection;
    private var nftOwner = owner;
    private var nftDescription = description;
    private let nftIndex = index;
    private var status = "inactive";

    // method
    public query func getName() : async Text {
        return nftName
    };
    public func setName(newName : Text) {
        nftName := newName
    };
    public query func getAssest() : async Text {
        return nftAssest
    };
    public query func getCollection() : async Text {
        return nftCollection
    };
    public func setCollection(newCollection : Text) {
        nftCollection := newCollection
    };
    public query func getOwner() : async Principal {
        return nftOwner
    };
    public query func getDescription() : async Text {
        return nftDescription
    };
    public func setDescription(newDescription : Text) {
        nftDescription := newDescription
    };
    public query func getIndex() : async Nat {
        return nftIndex
    };
    public query func getCanisterID() : async Principal {
        return Principal.fromActor(this)
    };
    public func setStatus(newStatus : Text) {
        status := newStatus
    };
    public query func getStatus() : async Text {
        return status
    };

    // method set owner moi
    public shared ({ caller }) func transferTo(newOwner : Principal) : async Text {

        // if (Principal.equal(caller, nftOwner)) {
        nftOwner := newOwner;
        return "Success";
        // } else {
        //     return "Error, not initiated by NFT Owner";
        // }
    }
}
