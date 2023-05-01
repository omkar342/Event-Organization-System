// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract EventOrganization {
    struct Event {
        address organizer; // address of the event organizer
        string name; // name of the event
        uint date; // date of the event
        uint ticketPrice; // price of the ticket
        uint ticketCount; // total tickets available for the event
        uint remainingTickets; // tickets remaining for the event
    }

    mapping(uint => Event) public events; // mapping to store all events
    mapping(address => mapping(uint => uint)) public userTickets; // mapping to store tickets of users

    uint public nextId; // a variable to track the next available ID for events

    // function to create an event
    function createEvent(
        string memory name,
        uint date,
        uint ticketPrice,
        uint ticketCount
    ) external {
        require(
            date > block.timestamp,
            "You can only organize event for future dates."
        ); // check if the date is in future
        require(
            ticketCount > 0,
            "You should at least have 1 ticket to be sold."
        ); // check if there is at least one ticket to sell

        events[nextId] = Event(
            msg.sender,
            name,
            date,
            ticketPrice,
            ticketCount,
            ticketCount
        ); // create an event and add it to the mapping
        nextId++; // increment the next available ID for events
    }

    // function to buy tickets for an event
    function buyTickets(uint eventId, uint numberOfTickets) public payable {
        Event storage _event = events[eventId]; // get the event from the mapping

        require(_event.date != 0, "Event doesn't exists."); // check if the event exists

        require(_event.date > block.timestamp, "Event has already occured!"); // check if the event has already occurred

        require(
            msg.value >= _event.ticketPrice * numberOfTickets,
            "Ether you sent is not enough!"
        ); // check if the user has sent enough ether

        require(
            _event.remainingTickets >= numberOfTickets,
            "Not enough tickets are available!"
        ); // check if enough tickets are available

        _event.remainingTickets -= numberOfTickets; // update the remaining tickets of the event

        userTickets[msg.sender][eventId] += numberOfTickets; // add tickets to the user
    }

    // function to transfer tickets from one user to another
    function transferTickets(
        uint eventId,
        uint numberOfTickets,
        address ticketsReceiver
    ) external {
        Event storage _event = events[eventId]; // get the event from the mapping

        require(_event.date != 0, "Event doesn't exists."); // check if the event exists

        require(_event.date > block.timestamp, "Event has already occured!"); // check if the event has already occurred

        require(
            userTickets[msg.sender][eventId] >= numberOfTickets,
            "You do not have enough tickets to share."
        ); // check if the user has enough tickets to share

        userTickets[msg.sender][eventId] -= numberOfTickets; // remove tickets from the sender's balance

        userTickets[ticketsReceiver][eventId] += numberOfTickets; // add tickets to the receiver's balance
    }
}
