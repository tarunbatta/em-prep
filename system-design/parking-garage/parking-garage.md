# Parking Garage System Design

[← Back to System Design](../system-design.md)

## Overview

A parking garage system manages vehicle entry, exit, and space allocation in parking facilities. The system needs to handle real-time space tracking, automated entry/exit processing, payment processing, and reservation management. It requires reliable sensors, efficient space allocation algorithms, and a robust infrastructure to support multiple entry/exit points, various payment methods, and real-time space availability updates.

## Functional Requirements

Reserve a spot and receive ticket or receipt

Able to pay

High Consistency (no two people to reserve same spot)

3 Type of Spots (S, M, L)

Price Flat Rate based on Type of Spot

## Non-Functional Requirements

## Back of the Envelope Estimations

No of parking spots in a parking lot
(# of floors) * (# of parking spots)
10 * 500
5K
Data Size for a parking slot
(# of parking spots) * (size per parking spot)
5K * 1K
5MB (which fits one machine)
Data Size for tickets
(# of parkings) * (size per ticket)
10K * 100 bytes
1MB
Data for 10 years
10 * 365 * 1Mb
3.65 GB (which fits 1 machine)
What if we want to build 1 mil parking lots
build distributed solution

## API Endpoints

### Public API Endpoints

/reserve (garageId, spotId, startTime, endTime)

returns: reservationId

/payment (reservationId)

(External Integration with Stripe, Square etc)

/cancel (reservationId)

/createAccount (email, password, firstName, lastName)

Note: Optional could also integrate with 3P SSO

/login (email, password)

### Internal API Endpoints
/calculatePayment (reservationId)

/freeSpots (garageId, vehicleType, time)

Note: check what spots are available

/allocateSpot (garageId, vehicleType, time)

Note: Allocating spot

## Object Model

## System Design Diagram

![Parking Garage System Design](parking-garage.svg)

[Download Draw.io File](parking-garage.drawio)

## Additional Notes

### Concurrency

only for Slot Service
Steps
query for available slots
pick slot available
try lock on slot. If fails choose another
assign slot to vehicle, make it occupied
unlock

### Distributed

- Sharding of Data
  - Ticket and Parking Slot
    - based on garageId
