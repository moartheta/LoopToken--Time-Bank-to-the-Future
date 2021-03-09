# Loop Coin
### A Time Bank to the Future

![Community](Images/Community_TIme_Bank.png)

>Our main goal is to create a time bank system in which users are able to record and exchange tokens that account for the cost of time. In exchange for a token, you can get someone’s time for a particular service/activity.

![definition](Images/Time_Bank_Definition.jpg)

## Overview
The group decided to pursue a blockchain-based time bank system.  The concept has been around for hundreds of years in various cultures, and there are some existing models out there today.  It was challenging coming up with the final solution, but in general we wanted it to be community-based, an equal amount (1 token = 1 hour), and be a place where individuals could donate their time to charitable purposes or help others.


### Considerations
For this project we had a lot of considerations to think through:
* Will there be a monetary equivalent?
* How do we disperse tokens into the ecosystem?
* How do we control for inflation?  Is there time inflation?
* Do we want this to be a way to get rich or improve the community?
* Is there potential for fraud abuse, or illegal activities?  How can we minimize this?
* Will there be a monetary component (i.e. - buy-in), or will it be strictly time-based?

### The Process

From a high level, this system would work as follows:
* The individual or entity seeking assistance enters a request for time.
    * They select a category, provide a description and/or an SOW
    * They select an approximate amount of hours needed (effort)
* This is then sent to find a match in the network (off chain)
* Once a match is determined, the work then begins.
* Once work is completed, both parties sign off, and the provider can then claim the tokens.

If the work is charitable, then the requestor will be paid by the treasury via a minted token.  This will slowly expand the supply of tokens in the economy, without allowing for runaway inflation.

Upon initial sign-up, the only way to get tokens is via charitable means.  This is effective in multiple ways:
  * It limits the pool of providers to those willing to do charitable work, hopefully minimizing criminal or abusive behavior
  * It allows the tokens to enter the economy in a sustainable fashion
  * It supports the idea of 1 token = 1 hour, and supporting the community rather than making a career out of the system.

### The Challenges

Determining which systems are needed, and how they integrate, while keeping the majority of the processing off-chain was difficult.  Finding a match requires either a database, or a persistent array or object.  It would be cost-prohibitive to perform this operation on-chain.

Coding the different functions within Solidity was also difficult, keeping in mind the different variables needed, and the various sources and destinations of each.

Finalizing the idea, and working through the nuances and edge cases took a significant amount of time.

Limited JavaScript and HTML knowledge added even more complexity when attempting to integrate and deploy with a front end.

Creating the token itself was not overly difficult due to the existing libraries, inherited objects, and templated code.
