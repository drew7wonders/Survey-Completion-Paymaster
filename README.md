# Survey-Completion-Paymaster

# Survey Paymaster

A Paymaster contract designed to cover gas fees for users who complete surveys or provide feedback.

## Features

- Automatic coverage of gas fees for survey completions.
- Off-chain validation of survey completions.
- Relayer reward withdrawal.

## Deployment

This contract can be deployed on a testnet or a local testing environment. Follow the steps below to deploy it on the zkSync Era testnet.

1. Install the required tools:
   - Solidity compiler: Follow the installation instructions at https://docs.soliditylang.org/en/v0.8.12/installing-solidity.html
   - Truffle: Install Truffle by running `npm install -g truffle`

2. Clone the repository:
   ```bash
   git clone <repository_url>
   cd <repository_folder>

3. Initialize the project:
truffle init

4. Install dependencies:
    `npm install @openzeppelin/contracts`

5. Update the 2_deploy_contracts.js file in the migrations directory with the desired relayer reward.

6. Compile and deploy the contract:
   ```bash
      truffle develop
      truffle(develop)> compile
      truffle(develop)> migrate

#Usage
The contract provides the following functions:

completeSurvey(address user): Marks a user's survey as completed. Only the contract owner can call this function.
isSurveyCompleted(address user): Returns true if the user has completed the survey, false otherwise.
withdrawRelayerReward(): Allows the contract owner to withdraw the relayer reward.
