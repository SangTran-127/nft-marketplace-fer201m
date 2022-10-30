import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
actor Token {

    var owner : Principal = Principal.fromText("hxz2m-ddemt-3ojdb-esys3-v4v4g-6t4n2-ws3df-4cbdm-xh4yi-6bguc-yae");

    var totalSupply : Nat = 500000000;
    var coinName : Text = "FER";
    private stable var balancesEntries : [(Principal, Nat)] = [];
    // balancesEntries := [];
    private var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

    public query func balanceOf(who : Principal) : async Nat {
        let resultBalance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result
        };
        return resultBalance
    };

    public query func getSymbol() : async Text {
        return coinName
    };

    public shared (msg) func payOut() : async Text {
        Debug.print(debug_show (msg.caller));
        if (balances.get(msg.caller) == null) {
            let amount = 20000;
            if ((await balanceOf(owner)) >= amount) {
                balances.put(owner, (await balanceOf(owner)) - amount);
                balances.put(msg.caller, (await balanceOf(msg.caller)) + amount);
                return "Payout successfully"
            } else {
                return "Insufficient amount"
            }
        } else {
            return "Already claimed"
        }
    };
    public func payOutWithPrincipal(to : Principal) : async Text {
        if (balances.get(to) == null) {
            let amount = 20000;
            if ((await balanceOf(owner)) >= amount) {
                balances.put(owner, (await balanceOf(owner)) - amount);
                balances.put(to, (await balanceOf(to)) + amount);
                return "Payout successfully"
            } else {
                return "Insufficient amount"
            }
        } else {
            return "Already claimed"
        }
    };
    public shared (msg) func transfer(to : Principal, amount : Nat) : async Text {
        let fromBalance = await balanceOf(msg.caller);
        if (fromBalance >= amount) {
            let newFromBalance : Nat = fromBalance - amount;
            balances.put(msg.caller, newFromBalance);
            let toBalance = await balanceOf(to);
            let newToBalance = toBalance + amount;
            balances.put(to, newToBalance);
            return "Success"
        } else {
            return "Insufficient Funds"
        }
    };
    public func transferWithPrincipal(from : Principal, to : Principal, amount : Nat) : async Text {
        let fromBalance = await balanceOf(from);
        if (fromBalance >= amount) {
            let newFromBalance : Nat = fromBalance - amount;
            balances.put(from, newFromBalance);
            let toBalance = await balanceOf(to);
            let newToBalance = toBalance + amount;
            balances.put(to, newToBalance);
            return "Success"
        } else {
            return "Insufficient Funds"
        }
    };
    system func preupgrade() {
        balancesEntries := Iter.toArray(balances.entries())
    };
    system func postupgrade() {
        balances := HashMap.fromIter<Principal, Nat>(balancesEntries.vals(), 1, Principal.equal, Principal.hash);
        if (balances.size() < 1) {
            balances.put(owner, totalSupply)
        }

    }
}
