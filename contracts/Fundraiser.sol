pragma solidity >0.4.23 <0.7.0;
import "../openzeppelin-contracts-2.4.0-beta.0/contracts/ownership/Ownable.sol";
contract Fundraiser is Ownable {
    string public name;
    string public url;
    string public imageURL;
    string public description;
    address payable public beneficiary;
    address public custodian;
    struct Donation {
        uint256 value;
        // uint256 conversionFactor;
        uint256 date;
    }
    mapping(address=>Donation[]) private _donations;
    constructor(string memory _name, string memory _url, string memory _imageURL, string memory _description, address payable _beneficiary, address _custodian) public {
        name=_name;
        url=_url;
        imageURL=_imageURL;
        description=_description;
        beneficiary=_beneficiary;
        custodian=_custodian;
    }
    function setBeneficiary(address payable _beneficiary) public onlyOwner {
        beneficiary=_beneficiary;
    }
    function myDonationsCount() public view returns(uint256) {
        return _donations[msg.sender].length;
    }
    function donate() public payable {
        Donation memory donation=Donation({
            value:msg.value,date:block.timestamp
        });
        _donations[msg.sender].push(donation);
    }
}
