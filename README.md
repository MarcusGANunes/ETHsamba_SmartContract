# Journey Gems

Journey Gems is a mobile application that uses integrations with location and weather APIs to generate personalized images of tourist attractions visited by the user. The application uses artificial intelligence (AI) to analyze data provided by the weather API and include elements such as lighting and weather conditions in the image. Additionally, the application can also incorporate commemorative elements for special dates into the image. Through this functionality, the application allows the user to have a personalized and unique experience, recording and sharing their visits to tourist attractions.

## Functions

1. ERC721 token creation with NFT on your wallet
2. Delete image from the collection
3. Quantity of NFTs stored in user address

## Running the project

1. Generate your account on celo wallet with `yarn account`
2. Comment all deploy.js file
3. Run `yarn compile` for building the contract
4. Uncomment deploy file
5. Deploy the contract with `yarn deploy`

## Technologies

1. Solidity
2. Celo Network
3. Hardhat framework with unit tests
4. OpenZeppelin library for building ERC721 token
5. IPFS (for image storing) linked with ERC721 token
