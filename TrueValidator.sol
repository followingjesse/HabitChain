pragma solidity ^0.4.19;

contract TrueValidator {

  function notify(address mediated_contract) returns (bool /* */) {
    if (mediated_contract != msg.sender)
      throw;
    return false;
  }
}
