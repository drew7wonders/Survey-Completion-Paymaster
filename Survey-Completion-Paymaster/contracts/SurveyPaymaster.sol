// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPaymaster {
    function notifyTransaction(uint256 totalFee) external;
    function refundExcess(uint256 totalFee) external;
    function withdrawRelayerReward() external;
}

contract SurveyPaymaster is IPaymaster {
    address private owner;
    uint256 private relayerReward;
    mapping(address => bool) private completedSurveys;

    constructor(uint256 _relayerReward) {
        owner = msg.sender;
        relayerReward = _relayerReward;
    }

    function completeSurvey(address user) external onlyOwner {
        completedSurveys[user] = true;
    }

    function isSurveyCompleted(address user) external view returns (bool) {
        return completedSurveys[user];
    }

    function notifyTransaction(uint256 totalFee) external override {
        require(completedSurveys[msg.sender], "SurveyPaymaster: User has not completed the survey");

        // Validate the survey completion off-chain before notifying the Paymaster contract
        // Additional off-chain validation logic can be implemented here

        // Gas fees are covered, so no action is needed
    }

    function refundExcess(uint256 totalFee) external override {
        // This contract covers gas fees, so no refund is necessary
    }

    function withdrawRelayerReward() external override {
        require(msg.sender == owner, "SurveyPaymaster: Only the owner can withdraw the relayer reward");

        // Perform the relayer reward withdrawal logic here
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "SurveyPaymaster: Only the owner can call this function");
        _;
    }
}
