# Software Development Course note


## Agile Vs Traditional SDLC Models

Agile is based on the **adaptive software development methods**, whereas the traditional SDLC models like the **waterfall model is based on a predictive approach**. Predictive teams in the traditional SDLC models usually work with detailed planning and have a complete forecast of the exact tasks and features to be delivered in the next few months or during the product life cycle.

Predictive methods entirely depend on the requirement analysis and planning done in the beginning of cycle. Any changes to be incorporated go through a strict change control management and prioritization.

Agile uses **an adaptive approach** where there is _no detailed planning_ and there is clarity on future tasks only in respect of what features need to be developed. There is _feature driven development_ and the team _adapts to the changing product requirements dynamically_. The product is _tested very frequently_, through the release iterations, minimizing the risk of any major failures in future.

**Customer Interaction** is the **_backbone_** of this Agile methodology, and open communication with minimum documentation are the typical features of Agile development environment. The agile teams work in close collaboration with each other and are most often located in the same geographical location.

[reference](https://www.tutorialspoint.com/sdlc/sdlc_quick_guide.htm)

## Rational unified process (RUP)

1. Develop iteratively
2. Manage requirement
3. Use component-base architecture
4. Model software visually
5. Continuously verify software quality
6. Control changes

## Boehm's risk exposure comparison

Time and effort invested in plans&uarr; --> risk&darr; ; lost of market share&uarr;

## Extreme programming

1. The planning game
2. Small release
3. Metaphor - a simple explanation of project
4. Simple design
5. Testing
6. Refactoring - Not changing the behavior and update the code
7. Pair Programming
8. Collective ownership - Everyone not knows everything but knows something about every part
9. Continuous integration - integrate and test frequently. Reduce problem and easy to find who break the code
10. Sustainable pace - not work too hard
11. Whole team - customer is member of team
12. Coding standard

-   RUP where you most focus on the biggest risk first contrast with XP. XP release frequently.

## Corporate Culture

Agile is self organizing teams. Frequently delivering and feedback. Manager help team to self organize, ask question.

## Today's Topic

-   Requirements: Plan driven
-   Use Cases: RUP approach
-   User Story: Agile approach

## User story

Template: As a (role) I want (something) so that (benefit).

### User Story Components

-   **Title** – a short handle for the story. Present tense verb in active voice is desirable
-   **Acceptance test** - the name of a method to test the story
    -   How to determine if the functionality is provided?
    -   Acceptance test helps to flesh out the details of the user story
-   **Priority** – decided by the customer (1 to 10. 1 is higher)
-   **Story points** – estimated time to implement expressed in relative units (Use Fibonacci number)
-   **Description** – one to three sentences describing the story

### Planning Poker

-   Goal: estimate relative effort for each user story
-   Participants
    -   Developers estimate effort
    -   Scrum Master optimizes the process
    -   Product owner answers questions
-   Process
    -   Describe the user story
    -   Each developer assigns effort
    -   Continue until consensus

### INVEST

-   **Independent** in context and scheduling
-   **Negotiable** between customer and developers
-   **Valuable** to the customer
-   **Estimable** value to customer & effort for developers
-   **Small** in scope
-   **Testable** include sufficient details to allow testing

### limitation

-   may lack of look-ahead --> Developers need quick responses from customers
-   may lack of context --> statement is terse/too concise
-   may lack of completeness --> Gaps may arise as the user stories and product evolve

