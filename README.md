# Mugatu

## About this App
Mugatu is a Rails app that serves as a platform between start-up producers and start-up designers in the fashion industry. Authenticated designers can post designs, complete with uploaded images, specifications, tentative due dates, and price ranges. After designs are approved by an administrator, authenticated producers can 'apply' to designs, with a promised due date, a price offer, and a proposed production plan.

When a designer 'approves' an application to a design, an order for the design is created and production begins. When the design has been produced, the producer can print a pre-generated USPS shipping label and mark the order as 'shipped'. After the designer receives the order, they can mark it as such and are asked the rate the producer on accuracy and efficiency. The average of these ratings are factored into a producer's total rating, which is made public on their profile page.

This app aims to offer designers in their early stages a sustainable and economical method for production. Additionally, the rating system holds producers accountable. Future iterations will include adding Stripe payment and more detailed user profiles.

## Setup

*Run in Ruby version 2.3.1*
Run the following commands from the command line of your terminal:
1. Clone this repository: 
`git clone git@github.com:erikaannesmith/Mugatu.git`
2. Run RSpec test suite:
`rspec`
3. Create and migrate the database:
`rake db:{create, migrate}`
4. Boot the server:
`rails s`
4. Visit localhost in the browser:
`https://localhost:3000`