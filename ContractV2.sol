pragma solidity ^0.4.19;
//HabitChain, the web app to force you into keeping your New Years Resolutions
contract HabitChain{

//Declare the attributes essential to the contract
  uint deadline;
  uint valueOfContract;
  address contracted;
  address observer;
  uint status; // status can only take on fixed values, will control which events/functions get triggered


//Create the events that are used to track the progress
  event econtractCreation(uint deadline, uint valueOfContract, address contracted, address observer);
  event econtractedComplete();
  event eobserverOneComp();
  event epayOutComplete();
  event eobserver(bool complete);
  event eTime(uint timeNow, uint deadline, uint diff); // work with this for now until it is determined how to use the clock

  function HabitChain(uint dl, address obs) public payable{
    deadline = dl/1000; //convert the input time to seconds
    valueOfContract = msg.value;
    contracted = msg.sender;
    observer = obs;
    status = 0;
    econtractCreation(deadline, valueOfContract,contracted,observer);
  }
  //modifiers that are required to ensure only those with their credentials can access their keys
  modifier onlyContracted(){
    require(msg.sender == contracted);
    _;
  }
  modifier onlyObs(){
    require(msg.sender == observer);
    _;
  }

  // now functions that describe what to do if the contract is complete
  function contractComplete() public onlyContracted{
    eTime(now, deadline, now-deadline);
    if(now > deadline){
      throw;
    }
    status = 1; // contract has been completed by the
    econtractedComplete();
  }
  //observer confirms that the
  function confirm() public onlyObs{
    bool isComplete = observer.call('notify', this);
    if(isComplete){
      status = 2; // the contracted earns his share back at status 2
    }
    eobserver(isComplete);
    //time to pay up
    payout(isComplete);
  }
  function payout(bool complete) internal{
    if(complete){ // if project is completed, do this
      contracted.transfer(valueOfContract*3);
      observer.transfer(1);
    }
    else{
      observer.transfer(1);
    }
    epayOutComplete();
  }
}
//export default HabitChain;
