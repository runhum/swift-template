# TemplatePackage


## Persistence
- `Entities`
    - Module for our "model" types, i.e. types that can be persisted
- `AppDatabase`
    - Responsible database setup, migration and seeding
    - Supports both in-memory and saved to disk databases
    - Uses `GRDB` framework
- `Entities+GRDB`
    - Adds GRDB conformances to entity types, e.g. `TableRecord`, `FetchableRecord` and `PersistableRecord` for saving entities to the database
    - This keeps the entity types simple, and we can refer to entities without exposing database methods
- `Repositories`
    - Types that expose CRUD operations for `Entities`
- `UI`
    - Reusable UI components
    - Assets/Resources
        - Colors
        - Fonts
        - Images
