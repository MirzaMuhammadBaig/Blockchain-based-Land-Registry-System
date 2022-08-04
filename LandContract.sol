// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract LandRegistration
{
    struct RegistrationLand
    {
        string Area;
        string City;
        string State;
        uint LandPriceInWei;
        uint PropertyPID;
        address Owner;
    } 

    struct BuyerDetail
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
    }

    struct SellerDetail
    {
        string Name;
        uint Age;
        string City;
        string CNIC;
        string Email;
    }

    struct LandInspectorDetail
    {
        address ID;
        string Name;
        uint Age;
        string Designation;
    }

    //mappings

    mapping(uint => RegistrationLand) public LandDetails;
    mapping(address => BuyerDetail) public BuyerDetails;
    mapping(address => SellerDetail) public SellerDetails;
    mapping(address => LandInspectorDetail) public LandInspectorDetails;
    mapping(address => bool) public IsBuyerVerify;
    mapping(address => bool) public IsSellerVerify;
    mapping(uint => bool) public IsLandVerify;

    address public LandInspector;

    constructor() payable
    {
        LandInspector = msg.sender;
    }

    modifier onlylandinspector()
    {
        require(msg.sender == LandInspector,"you are not land inspector");
        _;        
    }

    // function of register seller

    function RegisterSeller(address , string memory NAME, uint AGE, string memory CITY, string memory CNIC, string memory Email) public
    {
        SellerDetails[msg.sender] = SellerDetail( NAME, AGE, CITY, CNIC, Email);

        require(IsSellerVerify[msg.sender] == true,"please verify seller");
    }

    //function of verify seller

    function VerifySeller(address add) onlylandinspector() public
    {
        IsSellerVerify[add] = true;
    }

    //function of reject seller

    function RejectSeller(address add ) onlylandinspector() public
    {
        IsSellerVerify[add] = false;
    }

    //function of register buyer

    function RegisterBuyer(address addr, string memory NAME, uint AGE, string memory CITY, string memory CNIC, string memory Email) public
    {
        BuyerDetails[addr] = BuyerDetail( NAME, AGE, CITY, CNIC, Email);

        require(IsBuyerVerify[msg.sender] == true,"please verify buyer");
    }

    //function of verify buyer

    function VerifyBuyer(address addr) onlylandinspector() public
    {
        IsBuyerVerify[addr] = true;
    }

    //function of reject buyer

    function RejectBuyer(address addr) onlylandinspector() public
    {
        IsBuyerVerify[addr] = false;
    }

    //function of land registration

    function RegisterLand(uint _LandID, string memory Area, string memory City, string memory State, uint LandPriceInWei, uint PropertyPID, address) public
    {
        LandDetails[_LandID] = RegistrationLand( Area, City, State, LandPriceInWei, PropertyPID, msg.sender);

        require(IsLandVerify[_LandID] == true,"please verify Land");
    }

    //function of land verify

    function VerifyLand(uint _LandID) onlylandinspector() public
    {
        IsLandVerify[_LandID] = true;
    }

    //function of reject land

    function RejectLand(uint _LandID) onlylandinspector() public
    {
        IsLandVerify[_LandID] = false;
    }

    // seller update

    function UpdateSeller(address addr, string memory Name_, uint Age_, string memory City_, string memory CNIC_, string memory Email_) public
    {
        SellerDetails[addr].Name=Name_;
        SellerDetails[addr].Age=Age_;
        SellerDetails[addr].City=City_;
        SellerDetails[addr].CNIC=CNIC_;
        SellerDetails[addr].Email=Email_;
    }

    // buyer update

    function UpdateBuyer(address addr, string memory Name_, uint Age_, string memory City_, string memory CNIC_, string memory Email_) public
    {
        BuyerDetails[addr].Name=Name_;
        BuyerDetails[addr].Age=Age_;
        BuyerDetails[addr].City=City_;
        BuyerDetails[addr].CNIC=CNIC_;
        BuyerDetails[addr].Email=Email_;
    }

    // get land details by landID

    function GetLandDetails(uint ID) public view returns (string memory, string memory, string memory, uint, uint)
    {
        return  
            ( LandDetails[ID].Area,
            LandDetails[ID].City,
            LandDetails[ID].State,
            LandDetails[ID].LandPriceInWei,
            LandDetails[ID].PropertyPID );
    }

    // check owner by landID

    function GetLandOwner(uint _LandID) public view returns(address)
    {
        return LandDetails[_LandID].Owner;
    } 

    // get city by landID

    function GetLandCity(uint ID) public view returns (string memory)
    {
        return(LandDetails[ID].City);
    }

    // get land price by landID

    function GetLandPrice(uint ID) public view returns (uint)
    {
        return(LandDetails[ID].LandPriceInWei);
    }

    // get area by landID

    function GetLandArea(uint ID) public view returns (string memory)
    {
        return(LandDetails[ID].Area);
    }

    // function of register land inspector 

        function RegisterLandInspector(address ID, string memory NAME, uint AGE, string memory Designation) public
    {
        LandInspectorDetails[LandInspector] = LandInspectorDetail(ID, NAME, AGE, Designation);
    }

    // buy land

    function BuyLand(uint _LandID) public payable
    {
        require(IsBuyerVerify[msg.sender] == true,"please verify buyer");
        require(IsLandVerify[_LandID] == true,"please verify land");
        payable(LandDetails[_LandID].Owner).transfer(msg.value);
        require(msg.value >= LandDetails[_LandID].LandPriceInWei, "please pay me ether");
        LandDetails[_LandID].Owner = msg.sender;
    }

    //transfer land

    function TransferLandOwnerShip(uint _LandID, address newOwner) public
    {
        LandDetails[_LandID].Owner = newOwner;
    }
}
