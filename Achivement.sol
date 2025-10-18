// SPDX-License-Identifier: MIT
// contract address - 0xb4c728e50ffB830F9ab5E01E17cacB9D1B76aE18
pragma solidity ^0.8.0;

contract ReputationTracker {
    // Struct to store user details
    struct User {
        uint points;
        uint achievements;
        string[] badges;
    }

    // Mapping to store user data by their address
    mapping(address => User) public users;

    // Event logs for actions
    event PointsAdded(address indexed user, uint newPoints);
    event AchievementUnlocked(address indexed user, string badgeName);

    // Function to add points to a user's reputation
    function addPoints(uint _points) public {
        users[msg.sender].points += _points;
        emit PointsAdded(msg.sender, users[msg.sender].points);
    }

    // Function to add an achievement/badge
    function unlockBadge(string memory _badgeName) public {
        users[msg.sender].achievements += 1;
        users[msg.sender].badges.push(_badgeName);
        emit AchievementUnlocked(msg.sender, _badgeName);
    }

    // Function to view user details
    function getUser(address _user) public view returns (uint, uint, string[] memory) {
        User storage user = users[_user];
        return (user.points, user.achievements, user.badges);
    }
}
