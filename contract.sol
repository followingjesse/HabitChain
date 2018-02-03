pragma solidity ^0.4.19;


// Full contract of a person
contract HabitChain{
  //the Struct containing the attributes of the person making the contract with themselves
  struct Date{
    uint month;
    uint year;
    uint day;
  }
  Date startDate;
  Date endDate;
  // a person who is creating the contract with
  struct Person{
    uint ethValue;
    address pAddress;
    uint numOfValid;
    Validator[] validatedKeys; // Array of validators containing their flag
    bool validated;
  }
  struct Storage{
    uint stakeHold;
    address stored;
  }
// struct describing the validator, someone who can tell the system if a person has completed their contract
  struct Validator{
    bool valid;
    address vAddress;
  }
  function setDate(Date dt, uint d, uint m, uint y) public{
    dt.day = d;
    dt.year = y;
    dt.month = m;
  }
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




  }
}
