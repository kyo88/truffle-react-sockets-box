pragma solidity ^0.4.2;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public payable {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted payable {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted payable {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
