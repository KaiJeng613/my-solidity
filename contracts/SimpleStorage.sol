// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    struct Profile {
        string name;
        uint256 age;
    }

    // Mapping from user address to profile
    mapping(address => Profile) private profiles;

    // Event when someone updates their profile
    event ProfileUpdated(address indexed user, string name, uint256 age);

    // Write function: set or update profile
    function setProfile(string calldata _name, uint256 _age) external {
        profiles[msg.sender] = Profile(_name, _age);
        emit ProfileUpdated(msg.sender, _name, _age);
    }

    // Read function: get profile by address
    function getProfile(address _user) external view returns (string memory, uint256) {
        Profile memory p = profiles[_user];
        return (p.name, p.age);
    }
}
