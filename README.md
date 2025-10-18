// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReputationTracker {
    struct User {
        uint points;
        uint achievements;
        string[] badges;
    }

    mapping(address => User) public users;

    event PointsAdded(address indexed user, uint newPoints);
    event AchievementUnlocked(address indexed user, string badgeName);

    function addPoints(uint _points) public {
        users[msg.sender].points += _points;
        emit PointsAdded(msg.sender, users[msg.sender].points);
    }

    function unlockBadge(string memory _badgeName) public {
        users[msg.sender].achievements += 1;
        users[msg.sender].badges.push(_badgeName);
        emit AchievementUnlocked(msg.sender, _badgeName);
    }

    function getUser(address _user) public view returns (uint, uint, string[] memory) {
        User storage user = users[_user];
        return (user.points, user.achievements, user.badges);
    }
}
