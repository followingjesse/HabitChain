pragma solidity ^0.4.19;
//HabitChain, the web app to force you into keeping your New Years Resolutions
contract HabitChain{
  //the Struct containing the attributes of the person making the contract with themselves
  //Time struct to store a time in seconds, do not want to
  struct Time{
    uint time;
  }
  Date startTime;
  Date endTime;
  // a person who is creating the contract with
  struct Person{
    uint ethValue;
    uint numOfValid;
    Validator[] validatedKeys; // Array of validators containing their flag
    bool validated;
  }
  // Person constructor, initialize variables that we need
  function makePerson(Person p, address add, uint e) public{
    p.ethValue = e;
    p.pAddress = add;
    p.numOfValid = 0;
    p.validated = false;
  }
  // Stores a storage struct for each possible address
  mapping(address => Person) private Storage;
  address[] public StorageAcc;

  // struct describing the validator, someone who can tell the system if a person has completed their contract
  struct Validator{
    bool valid;
  }
  // validator constructor
  function createValidator(Validator v){
    v.valid = false;
  }
  // address hash mapping to the validators
  mapping(address => Validator) public validators;
  //Stake function that keeps track of the stake and what not
  function stake(Person p, uint stk, Storage st) returns (bool success){
    uint stake = stk;
    st.stored = p.address;
    if(stake < p.ethValue){
      return false;
    }
    p.ethValue-= stake;
    st.stakeHold = stake;
    return true;
  }
// switch out for the clock?
  function setTime(Time tStruct, uint t) public returns Time{
    tStruct.time = t;
    t = 0;
    return tStruct;
  }
}
