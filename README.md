# Project About Remove Frauda And Difficulties during sell and buy property.

This project is a basic land registration smart contract on the Ethereum blockchain. It allows users to register, verify, and reject sellers, buyers, and land registration. The project is written in Solidity, and the contract has been tested using the Solidity compiler version 0.8.17.

### How to Use
#### Contract Deployment
To deploy the contract, you will need to have access to an Ethereum blockchain network, such as a local development network or a test network like goerli. You can deploy the contract using Remix or any other Solidity IDE of your choice.

#### Contract Interactions
Once the contract is deployed, you can interact with it using a Web3-enabled browser or a Web3 library like Web3.js. The following functions are available for interaction with the contract:

- RegisterSeller: Allows a seller to register with their details.

- VerifySeller: Allows the Land Inspector to verify a seller.

- RejectSeller: Allows the Land Inspector to reject a seller.

- RegisterBuyer: Allows a buyer to register with their details.

- VerifyBuyer: Allows the Land Inspector to verify a buyer.

- RejectBuyer: Allows the Land Inspector to reject a buyer.

- RegisterLand: Allows a user to register land with the specified details.

- VerifyLand: Allows the Land Inspector to verify a land registration.

- RejectLand: Allows the Land Inspector to reject a land registration.

- UpdateSeller: Allows a seller to update their details.

- UpdateBuyer: Allows a buyer to update their details.

- GetLandDetails: Returns the details of a land registration by LandID.

- GetLandOwner: Returns the owner of the land registration by LandID.

- GetLandCity: Returns the city of the land registration by LandID.

- GetLandPrice: Returns the price of the land registration by LandID.

- GetLandArea: Returns the area of the land registration by LandID.

#### Smart Contract Security
- The smart contract has been written with security in mind, and the following measures have been taken to prevent potential vulnerabilities:

- The contract uses the onlylandinspector modifier to ensure that only the Land Inspector can perform certain functions.

- The contract uses mappings to store the details of buyers, sellers, and land registrations.

- The contract uses the require statement to ensure that only verified sellers, buyers, and land registrations can interact with the contract.

#### License
- This project is licensed under the MIT License.

