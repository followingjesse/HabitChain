pragma solidity ^0.4.19;
//HabitChain, the web app to force you into keeping your New Years Resolutions
contract HabitChain{

//Declare the attributes essential to the contract
  uint deadline;
  uint valueOfContract;
  address contracted;
  address observerOne;
  address observerTwo;
  address observerThree;
  uint status; // status can only take on fixed values, will control which events/functions get triggered


//Create the events that are used to track the progress
  event contractCreation(uint deadline, uint valueOfContract, address contracted, address observerOne, address observerTwo, address observerThree);
  event contractedComplete();
  event observerOneComp();
  event observerTwoComp();
  event observerThreeComp();
  
}
