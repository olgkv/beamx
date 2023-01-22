# README

Using Rails 7 create a simple web application that allows users to schedule appointments with a set of predefined service providers:

- The application should have a database with at least three tables: one for users, another one for service providers, and one for appointments
- The application should allow users to create new appointments, view existing appointments, and cancel appointments
- The application should have a RESTful API that allows clients to create, read, update and delete appointments and service providers
- The application should make use of Rails' built-in migration system to create and modify the database schema
- The application should use a delayed job to send a confirmation email to the user after an appointment is scheduled
- The application should include appropriate error handling and logging

Not necessary but would be nice to have:

- User authorization (JWT/OAuth)
– A Memcached for storing frequently used data
- A NoSQL database to store some additional data about the appointments
- User's preferences: such as the preferred time, location, or provider
- Appointment's notes: such as the user's comments, cancellation reason or additional information about the service provided
– Backups using AWS S3
