# ExploreX – Tourist Information System

ExploreX is a production-quality, full-stack Tourist Information System built using Spring Boot, Spring Security, JWT, React.js, and MySQL. It is designed to act as an all-in-one portal for travelers to search destinations, read verified reviews, save favorites, and request guided tour package bookings.

---

## Project Folder Structure

```text
ExploreX/
 ├── database/
 │    ├── schema.sql                     # Table DDL definitions
 │    └── data.sql                       # Seed roles, users, and places
 ├── backend/
 │    ├── pom.xml                        # Maven dependencies config
 │    └── src/main/
 │         ├── java/com/explorex/
 │         │    ├── controller/          # REST Controller endpoints
 │         │    ├── service/             # Service Interface definitions
 │         │    │    └── impl/           # Transactional Service Implementations
 │         │    ├── repository/          # Spring Data JPA Repository query layers
 │         │    ├── entity/              # Database JPA mapping entities
 │         │    ├── dto/                 # Request/Response data contracts
 │         │    ├── mapper/              # Object mapping translation helpers
 │         │    ├── config/              # CORS settings and Swagger OpenAPI
 │         │    ├── security/            # UserPrincipal and Security configs
 │         │    │    └── jwt/            # JWT Token handling and validations
 │         │    ├── exception/           # Custom exception rest mapping advices
 │         │    └── ExplorexApplication.java
 │         └── resources/
 │              └── application.properties # MySQL JDBC & JWT configurations
 ├── frontend/
 │    ├── package.json                   # React configurations
 │    ├── vite.config.js                 # Vite compilation plugins
 │    ├── index.html                     # HTML Template with Bootstrap CDN
 │    └── src/
 │         ├── layouts/                  # Dynamic navigation layouts
 │         ├── context/                  # AuthContext API session mappings
 │         ├── services/                 # Axios clients with JWT headers interceptor
 │         ├── pages/                    # Home, Catalog, Details, and Dashboard views
 │         ├── main.jsx                  # React bootstrapper
 │         └── index.css                 # Custom HSL design styles and micro-interactions
 └── documentation/
      ├── INSTALLATION.md                # System setup guidelines
      ├── API_DOCUMENTATION.md           # Endpoints lists
      ├── DIAGRAMS.md                    # ER, Sequence, and Use Case diagrams
      └── ExploreX_Postman_Collection.json # Postman testing collection JSON
```

---

## Key Features

### Admin
- **Dashboard Counters**: Instant statistical review of active bookings, users, reviews, and support queries.
- **Places CRUD**: Create, edit, and delete destination cards containing location parameters and multiple gallery links.
- **Categories Editor**: CRUD management for Beach, Heritage, Mountains, and Wildlife options.
- **User Directory**: List and terminate user accounts safely.
- **Guided Bookings Panel**: Approve or reject tourist package schedules.
- **Support Inbox**: Reply to contact inquiry cards.

### User/Tourist
- **Secure Register & Login**: Authenticated via stateless JWT tokens.
- **Filter and Sort Search**: Public text matching across place names, districts, states, and sorting by highest stars, alphabetical, or newest addition.
- **Wishlists/Favorites**: Toggle heart buttons on cards to bookmark places to a personal wishlist.
- **Reviews Engine**: Grade tourist places (1 to 5 stars) and write comments (re-aggregating star averages automatically on submit).
- **Tour Booking Form**: Request package dates, input traveler count, and special guide comments.

---

## Default Login Credentials

### Administrator Account
- **Username**: `admin` (or Email: `admin@explorex.com`)
- **Password**: `Admin@123`

### Tourist User Account
- **Username**: `user` (or Email: `user@explorex.com`)
- **Password**: `User@123`

---

## Running the Application

For step-by-step IDE setups and configurations, review the [INSTALLATION.md](file:///c:/Users/harsh/OneDrive/Desktop/ExploreX/documentation/INSTALLATION.md) document inside the `documentation/` folder.
