# Event Organization Contract

This Solidity contract allows users to create events, buy tickets for events, and transfer tickets to other users. The contract uses the Ethereum Network (Test Network) to store and manage events and tickets.

## Features

- Users can create events by providing the name, date, ticket price, and ticket count.
- Users can buy tickets for events by providing the event ID and the number of tickets they want to buy. The contract checks if the event exists, if it is in the future, if enough tickets are available, and if the user has sent enough ether to buy the tickets.
- Users can transfer tickets to other users by providing the event ID, the number of tickets they want to transfer, and the address of the receiver. The contract checks if the event exists, if it is in the future, if the user has enough tickets to transfer, and if the receiver address is valid.

## Contract Structure

The contract is structured as follows:

- The `Event` struct holds the details of each event, including the organizer address, the name, the date, the ticket price, the ticket count, and the remaining tickets.
- The `events` mapping stores all events by their ID.
- The `userTickets` mapping stores the number of tickets that each user has for each event.
- The `createEvent` function allows users to create events.
- The `buyTickets` function allows users to buy tickets for events.
- The `transferTickets` function allows users to transfer tickets to other users.

## Usage

To use this contract, you can deploy it to the Ethereum blockchain using a tool like Remix or Truffle. Once deployed, you can interact with the contract using a web3-enabled wallet like MetaMask.

You can create an event by calling the `createEvent` function and passing the name, date, ticket price, and ticket count as parameters.

You can buy tickets for an event by calling the `buyTickets` function and passing the event ID and the number of tickets you want to buy as parameters. You will need to send enough ether to cover the cost of the tickets.

You can transfer tickets to another user by calling the `transferTickets` function and passing the event ID, the number of tickets you want to transfer, and the address of the receiver as parameters.

## License

This contract is licensed under the GNU General Public License v3.0.
