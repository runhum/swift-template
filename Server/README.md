# Server

A small example of a HTTP server in Swift.

## Features


## Folder structure
```
[Sources]
    [App]
        - App.swift
            - The entry point for the server, where configurations and setup is done.
    [Server]
        - Controllers
            - UserController.swift
                - An example controller for user specific endpoints
        - Repositories
            - UserRepository.swift
                - An example repository for doing database CRUD on users
        - Entities
            - User.swift
                - A user entity, representing the table `users` in the database
        - Migrations
            - Version1.swift
                - The initial migration for the database
        - Services
            - UserService.swift
                - Business logic for user related operations 
    [DTO]
        - Standalone module for the DTO's. To be shared with clients.
[Tests]
    [RepositoryTests]
        UserRepositoryTests.swift
            - Tests for the user repository
```

## Running the server
`$ swift run`

## Migrate the database

The server currently auto migrates on launch.

To do it manually:

`$ swift run App migrate`