pragma solidity ^0.4.19;


// Full contract of a person
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
  // Stores a storage struct for each possible address
  mapping(address => Person) private Storage;
  address[] public StorageAcc;

  function getStorage() view private returns (address[]) {
    return StorageAcc;
  }
  function getStorage(address )

// struct describing the validator, someone who can tell the system if a person has completed their contract
  struct Validator{
    bool valid;
  }
  // address hash mapping to the validators
  mapping(address => Validator) public validators; 
  function setTime(Time tStruct, uint t) public returns Time{
    tStruct.time = t;
    t = 0;
    return tStruct;
  }
/*
  function setendTime(Time t, uint d, uint m, uint y) public{
    t.time = t;
  }*/
// Person constructor, initialize variables that we need
  function makePerson(Person p, address add, uint e) public{
    p.ethValue = e;
    p.pAddress = add;
    p.numOfValid = 0;
    p.validated = false;

  }
// Create the stake the person holds. Checks if the stake is okay to make based on their current balance
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
  function timeTracker(Time t){
    while(t.time != 0 ){
      wait
    }
  }
//Count down time so when t=0, contractEnd is initialized
  function contractEnd(endTime t, Validator valid, ) {
    if
  }
}

// Need to make:
// Send money (mapping) from person to temporary Storage
// At contract expiry(no reward for finishing early) check whether validators have correct hash (representing true or false)(a true hash will be identical, false will all be different)
// True hash results mush be > 50%?
// take general consensus of validators hash, reward most common outcome with coins as "mining fees"
// mining fees will always be paid out to correct validators.
// if at contract expiry, task is not completed. Staked money will distribute evenly among all miners responsible of contribuing to the hashing of the contract.
// fixed amount of validators/validations needed? 50? 100? Greater the more accurate, but more time required to process.
// Send mining fee to validators
// Send staked fee to validators if false
// end contract?
//instead of bool validator, assign a hash key,

//each person will have spefic address, created contract will store stake in tempaddress.
//miners will verify hashing, trues will all match, falses will all match. Only 2 possible results. (so no incentive to default to false)
//Set hashing difficulty to easy, so quickly validated.
