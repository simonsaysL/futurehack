pragma solidity ^0.4.17;

contract MetaCoin {

	mapping (address => uint) reputation;

	enum Status{unset, consideration, revise, burned, funded}


	struct Proposal {
				
		string propname;
		string Hash;
		string data;
		Status status;
		adress owner;
	}

	Proposal public proposal;

	function MetaCoin() {

		reputation[tx.origin]=700;
		proposal.propname="notSet";
		proposal.data="notSet";
		proposal.Hash="notSet";
		proposal.status=Status.unset;
	}

	function sendCoin() public{
		reputation[msg.sender] += 100;
	}

	function getBalance() public view returns(uint) {
		return reputation[msg.sender];
	}

	function sendData(string propname, string data, string Hash) public{
		proposal.propname = propname;
		proposal.Hash = Hash;
		proposal.data = data;
		proposal.status = Status.consideration;
		proposal.owner=[msg.sender];
				
	}
	function getData() public view returns(string, string, string, Status) {
		return (proposal.propname, proposal.data, proposal.Hash, proposal.status);
	}

}
