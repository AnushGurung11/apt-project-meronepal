# Servlet Documentation

## AboutUsServlet
- **URL Mapping**: `/about`
- **GET**: Forwards to `about.jsp` to render static about page content
- **POST**: Not implemented

## AdminAddNewServiceServlet
- **URL Mapping**: `/admin/add-service`
- **GET**: Forwards to `add-service.jsp` to display service creation form
- **POST**: Validates input, inserts service via `ServiceDAO`, redirects with `status=success` or `status=error`

## AdminBookingServlet
- **URL Mapping**: `/admin-booking`
- **GET**: Fetches all bookings with joined data and forwards to `admin-bookings.jsp`
- **POST**: Handles `updateBookingStatus` and `updatePaymentStatus` actions, redirects with success/error flag

## AdminCreateNewPackageServlet
- **URL Mapping**: `/admin/create-package`
- **GET**: Loads active services and forwards to `create-package.jsp` form
- **POST**: Validates input, inserts package via `PackageDAO`, links services via `PackageServiceDAO`, redirects with status

## AdminDashboardServlet
- **URL Mapping**: `/dashboard`
- **GET**: Fetches stats (user count, booking count, bookings by package, recent bookings) and forwards to `admin-dashboard.jsp`
- **POST**: Not implemented

## AdminPackageServicesServlet
- **URL Mapping**: `/admin/package-services`
- **GET**: Loads services and package-service links, forwards to `admin-package-services.jsp`
- **POST**: Handles `deleteService` (soft delete) and `deletePackageService` (hard delete) actions, redirects with result

## BlogServlet
- **URL Mapping**: `/blog`
- **GET**: Forwards to `blog.jsp` for rendering blog content
- **POST**: Not implemented

## BookingServlet
- **URL Mapping**: `/booking`
- **GET**: Loads package details with services and flash messages, forwards to `booking.jsp`
- **POST**: Validates event date (must be 4+ days ahead), creates booking via `BookingDAO`, redirects to `/profile` on success

## HomeServlet
- **URL Mapping**: `/home`
- **GET**: Forwards to `index.jsp` to render home page
- **POST**: Not implemented

## LoginServlet
- **URL Mapping**: `/login`
- **GET**: Forwards to `login.jsp` to display login form
- **POST**: Validates credentials via `UserDAO` and `PasswordUtil`, sets session/cookie, redirects to `/dashboard` (Admin) or `/home` (Customer)

## LogoutServlet
- **URL Mapping**: `/logout`
- **GET**: Clears session attributes, invalidates session, deletes cookie, redirects to `/login`
- **POST**: Not implemented

## PackageServlet
- **URL Mapping**: `/packages`
- **GET**: Fetches all active packages with services via `PackageDAO`, forwards to `packages.jsp`
- **POST**: Not implemented

## RegisterServlet
- **URL Mapping**: `/register`
- **GET**: Forwards to `register.jsp` to display registration form
- **POST**: Validates input via `ValidationUtil`, hashes password via `PasswordUtil`, inserts user via `UserDAO`, redirects to `/login` on success

## UserBookingDetailServlet
- **URL Mapping**: `/my-booking`
- **GET**: Checks session, fetches user's bookings via `BookingDAO`, forwards to `my-bookings.jsp`
- **POST**: Handles `cancel` action with ownership verification, updates booking status, redirects back to `/my-booking`

## UserProfileChangePassword
- **URL Mapping**: `/profile/changePassword`
- **GET**: Forwards to `changePassword.jsp` form
- **POST**: Validates new password complexity and match, updates via `UserDAO`, redirects to `/profile` on success

## UserProfileServlet
- **URL Mapping**: `/profile`
- **GET**: Checks session, sets user attributes and formatted date, forwards to `profile.jsp`
- **POST**: Not implemented

## UserProfileUpdateServlet
- **URL Mapping**: `/profile/update`
- **GET**: Loads current user data from session, forwards to `edit-profile.jsp` form
- **POST**: Validates username/email/phone via `ValidationUtil`, updates via `UserDAO`, redirects to `/profile` on success

# DAO Documentation

---

## BookingDAO
**Purpose**: Manages booking data in the database. Handles CRUD operations for the `booking` table and related joins with user, package, service, and payment tables.

### Methods

#### `insertBooking(User user, int packageId, String eventAddress, String notes, String eventDate)`
- **Parameters**:
    - `user` {@code User}: the user making the booking
    - `packageId` {@code int}: ID of the package being booked
    - `eventAddress` {@code String}: location for the event
    - `notes` {@code String}: optional notes or description
    - `eventDate` {@code String}: event date in `yyyy-MM-dd` format
- **Returns**: {@code int} — `1`=success (row inserted), `0`=error
- **Description**: Inserts a new booking record into the database.

#### `getAllBooking()`
- **Parameters**: None
- **Returns**: {@code List<Booking>} — list of all bookings with enriched data, empty list on error
- **Description**: Fetches all bookings with joined user, package, service, and payment data.

#### `getBookingsByUserId(int userId)`
- **Parameters**:
    - `userId` {@code int}: ID of the user whose bookings to fetch
- **Returns**: {@code List<Booking>} — list of bookings for the user, empty list on error
- **Description**: Fetches all bookings for a specific user with joined data.

#### `updateBookingStatus(int bookingId, String newStatus)`
- **Parameters**:
    - `bookingId` {@code int}: ID of the booking to update
    - `newStatus` {@code String}: new status value (must be one of: Pending, Confirmed, Completed, Cancelled)
- **Returns**: {@code boolean} — `true`=update succeeded, `false`=invalid status or error
- **Description**: Updates the status of an existing booking with whitelist validation.

#### `getTotalBookingCount()`
- **Parameters**: None
- **Returns**: {@code int} — total booking count, or `-1` on SQL error
- **Throws**: {@code SQLException}
- **Description**: Counts total number of bookings in the system.

#### `getBookingCountByPackage()`
- **Parameters**: None
- **Returns**: {@code ArrayList<Booking>} — list with `packageId`, `packageName`, and `bookingCount` set, empty list on error
- **Throws**: {@code SQLException}
- **Description**: Fetches booking counts grouped by package.

#### `getRecentBookings()`
- **Parameters**: None
- **Returns**: {@code ArrayList<Booking>} — list of 10 most recent bookings, empty list on error
- **Throws**: {@code SQLException}
- **Description**: Fetches the 10 most recent bookings with user, package, and payment data.

---

## PackageDAO
**Purpose**: Manages package data in the database. Handles CRUD operations for the `package` table and package-service relationships.

### Methods

#### `insertPackage(String packageName, String description, BigDecimal price)`
- **Parameters**:
    - `packageName` {@code String}: name of the package
    - `description` {@code String}: package description
    - `price` {@code BigDecimal}: package price
- **Returns**: {@code int} — auto-generated `package_id` on success, `-1` on failure
- **Description**: Inserts a new package record and returns the generated ID.

#### `getAllPackagesWithServices()`
- **Parameters**: None
- **Returns**: {@code List<Package>} — list of packages with services populated, empty list on error
- **Description**: Fetches all active packages with their associated active services.

#### `getPackageByIdWithServices(int packageId)`
- **Parameters**:
    - `packageId` {@code int}: ID of the package to fetch
- **Returns**: {@code Package} — package with services populated, `null` if not found or on error
- **Description**: Fetches a single active package by ID with its associated services.

#### `getAllPackages()`
- **Parameters**: None
- **Returns**: {@code List<Package>} — list of basic package objects, empty list on error
- **Description**: Fetches all active packages without service details.

#### `getPackageById(int packageId)`
- **Parameters**:
    - `packageId` {@code int}: ID of the package to fetch
- **Returns**: {@code Package} — basic package object, `null` if not found or on error
- **Description**: Fetches a single package by ID without service details.

---

## PackageServiceDAO
**Purpose**: Manages package-service relationships in the database. Handles CRUD operations for the `Package_Service` junction table.

### Methods

#### `getPackageService(int packageServiceID)`
- **Parameters**:
    - `packageServiceID` {@code int}: ID of the package-service link to fetch
- **Returns**: {@code PackageService} — the link object if found, `null` otherwise
- **Description**: Fetches a single package-service link by its primary key.

#### `getAllPackageServicesWithNames()`
- **Parameters**: None
- **Returns**: {@code List<PackageService>} — list of links with names populated, empty list on error
- **Description**: Fetches all active package-service links with package and service names.

#### `getPackageServicesByPackageId(int packageId)`
- **Parameters**:
    - `packageId` {@code int}: ID of the package whose services to fetch
- **Returns**: {@code List<PackageService>} — list of service links for the package, empty list on error
- **Description**: Fetches all service links for a specific package.

#### `deletePackageService(int packageServiceId)`
- **Parameters**:
    - `packageServiceId` {@code int}: ID of the link to delete
- **Returns**: {@code int} — `1`=success (row deleted), `0`=not found or error
- **Description**: Deletes a package-service link by its primary key.

#### `insertPackageService(int packageId, int serviceId)`
- **Parameters**:
    - `packageId` {@code int}: ID of the package
    - `serviceId` {@code int}: ID of the service to link
- **Returns**: {@code int} — `1`=success (row inserted), `0`=error
- **Description**: Inserts a new package-service link.

---

## PaymentDAO
**Purpose**: Manages payment data in the database. Handles payment status updates for the `Payment` table linked to bookings.

### Methods

#### `updatePaymentStatus(int bookingId, String newStatus)`
- **Parameters**:
    - `bookingId` {@code int}: ID of the booking whose payment to update
    - `newStatus` {@code String}: new status (must be one of: Unpaid, Partial, Paid, Refunded)
- **Returns**: {@code boolean} — `true`=success (row inserted/updated), `false`=invalid status or error
- **Description**: Updates or inserts payment status for a booking, syncing amount from package price using `INSERT ... ON DUPLICATE KEY UPDATE`.

#### `getPackagePriceByBookingId(int bookingId)` *(private helper)*
- **Parameters**:
    - `bookingId` {@code int}: ID of the booking to look up
- **Returns**: {@code BigDecimal} — package price if found, `null` on error or not found
- **Description**: Helper method to fetch the package price for a given booking.

---

## ServiceDAO
**Purpose**: Manages service data in the database. Handles CRUD operations for the `Services` table.

### Methods

#### `getService(String service)`
- **Parameters**:
    - `service` {@code String}: name of the service to look up
- **Returns**: {@code Service} — service object if found, `null` otherwise
- **Description**: Fetches a service by its name.

#### `getAllServices()`
- **Parameters**: None
- **Returns**: {@code List<Service>} — list of active services, empty list on error
- **Description**: Fetches all active services from the database.

#### `deleteService(int serviceId)`
- **Parameters**:
    - `serviceId` {@code int}: ID of the service to deactivate
- **Returns**: {@code int} — `1`=success (row updated), `0`=not found or error
- **Description**: Soft-deletes a service by marking it inactive (`is_active = 0`).

#### `insertService(String serviceName, String serviceType, String description)`
- **Parameters**:
    - `serviceName` {@code String}: name of the new service
    - `serviceType` {@code String}: type/category of the service
    - `description` {@code String}: description of the service
- **Returns**: {@code int} — `1`=success (row inserted), `0`=error
- **Description**: Inserts a new service record into the database.

---

## UserDAO
**Purpose**: Manages user data in the database. Handles CRUD operations for the `user` table.

### Methods

#### `insertUser(String userName, String email, String phone_number, String password)`
- **Parameters**:
    - `userName` {@code String}: desired username
    - `email` {@code String}: user's email address
    - `phone_number` {@code String}: user's phone number
    - `password` {@code String}: already-hashed BCrypt password
- **Returns**: {@code int} — `1`=success, `2`=duplicate username/email, `3`=SQL error
- **Description**: Inserts a new user record with duplicate check on username and email.

#### `getUser(String email)`
- **Parameters**:
    - `email` {@code String}: email to look up
- **Returns**: {@code User} — user object if found, `null` otherwise
- **Description**: Fetches a user by email address with all fields populated.

#### `updateUser(User updatedUser)`
- **Parameters**:
    - `updatedUser` {@code User}: user object with new values, `userId` required
- **Returns**: {@code int} — `1`=success, `0`=no row matched, `2`=conflict, `3`=SQL error, `4`=invalid input
- **Description**: Updates user profile fields with conflict check and intelligent password handling.

#### `getCurrentPasswordHash(int userId)` *(private helper)*
- **Parameters**:
    - `userId` {@code int}: ID of user whose hash to retrieve
- **Returns**: {@code String} — stored BCrypt hash, or `null` if not found or error
- **Description**: Helper to fetch current password hash for a user.

#### `updateUserPassword(int userID, String updatedPassword)`
- **Parameters**:
    - `userID` {@code int}: ID of user whose password to update
    - `updatedPassword` {@code String}: new password (should be pre-hashed)
- **Returns**: {@code int} — `1`=success, `0`=user not found, `3`=SQL error
- **Throws**: {@code SQLException}
- **Description**: Updates only the password for a user.

#### `getUserCount()`
- **Parameters**: None
- **Returns**: {@code int} — total user count, or `-1` on SQL error
- **Throws**: {@code SQLException}
- **Description**: Counts total number of registered users.



# Filter & Utility Documentation

---

## AuthenticationFilter
**Purpose**: Filter for authentication and role-based access control. Applies to all requests (`/*`).

### Behavior
- Allows public access to `/login`, `/register`, `/packages`, and static assets (`.png`, `.jpg`, `.css`)
- Redirects unauthenticated users to `/login`
- Redirects authenticated users away from login/register to `/dashboard` (Admin) or `/home` (Customer)

### Methods

#### `init(FilterConfig filterConfig)`
- **Parameters**: `filterConfig` {@code FilterConfig}: filter initialization parameters
- **Returns**: {@code void}
- **Description**: Called when filter is initialized; no custom initialization required.

#### `doFilter(ServletRequest request, ServletResponse response, FilterChain chain)`
- **Parameters**:
    - `request` {@code ServletRequest}: client request (cast to `HttpServletRequest`)
    - `response` {@code ServletResponse}: client response (cast to `HttpServletResponse`)
    - `chain` {@code FilterChain}: to pass request to next filter or target
- **Returns**: {@code void}
- **Throws**: {@code ServletException}, {@code IOException}
- **Description**: Checks session for `user` attribute, validates access based on authentication status and role, redirects or forwards accordingly.

#### `destroy()`
- **Parameters**: None
- **Returns**: {@code void}
- **Description**: Called when filter is taken out of service; no cleanup required.

---

## CookieUtil
**Purpose**: Utility class for managing HTTP cookies. Provides methods to add, retrieve, and delete cookies.

### Methods

#### `addCookie(HttpServletResponse response, String name, String value, int maxAge)`
- **Parameters**:
    - `response` {@code HttpServletResponse}: to add the cookie to
    - `name` {@code String}: name of the cookie
    - `value` {@code String}: value of the cookie
    - `maxAge` {@code int}: maximum age in seconds
- **Returns**: {@code void}
- **Description**: Adds a cookie with specified name, value, and max age; sets path to `/` for application-wide access.

#### `getCookie(HttpServletRequest request, String name)`
- **Parameters**:
    - `request` {@code HttpServletRequest}: to get cookies from
    - `name` {@code String}: name of the cookie to retrieve
- **Returns**: {@code Cookie} — the cookie if found, `null` otherwise
- **Description**: Retrieves a cookie by name from the request's cookie array.

#### `deleteCookie(HttpServletResponse response, String name)`
- **Parameters**:
    - `response` {@code HttpServletResponse}: to add the deletion cookie to
    - `name` {@code String}: name of the cookie to delete
- **Returns**: {@code void}
- **Description**: Deletes a cookie by setting its max age to `0` and path to `/`.

---

## DBConfig
**Purpose**: Utility class for managing database connection configuration.

### Methods

#### `getConnection()`
- **Parameters**: None
- **Returns**: {@code Connection} — active JDBC connection to the database
- **Throws**: {@code SQLException}, {@code ClassNotFoundException}
- **Description**: Loads MySQL driver and returns a connection to `apt_booking_system` database using configured credentials.

---

## PasswordUtil
**Purpose**: Utility class for password hashing and verification using BCrypt. Uses work factor `10` for balanced security.

### Methods

#### `getHashPassword(String inputPassword)`
- **Parameters**:
    - `inputPassword` {@code String}: plain text password to hash
- **Returns**: {@code String} — BCrypt-hashed password with embedded salt
- **Description**: Generates a salt with work factor `10` and returns the hashed password.

#### `checkPassword(String passwordTyped, String hashedPassword)`
- **Parameters**:
    - `passwordTyped` {@code String}: plain text password from user input
    - `hashedPassword` {@code String}: stored BCrypt hash to compare against
- **Returns**: {@code boolean} — `true` if passwords match, `false` otherwise
- **Description**: Verifies a typed password against a stored BCrypt hash using `BCrypt.checkpw()`.

---

## SessionUtil
**Purpose**: Utility class for managing HTTP sessions. Provides methods to set, get, remove attributes and invalidate sessions.

### Methods

#### `setAttribute(HttpServletRequest request, String key, Object value)`
- **Parameters**:
    - `request` {@code HttpServletRequest}: to obtain session from
    - `key` {@code String}: attribute key
    - `value` {@code Object}: value to store
- **Returns**: {@code void}
- **Description**: Sets a session attribute; sets max inactive interval to 30 minutes.

#### `getAttribute(HttpServletRequest request, String key)`
- **Parameters**:
    - `request` {@code HttpServletRequest}: to obtain session from
    - `key` {@code String}: attribute key to retrieve
- **Returns**: {@code Object} — attribute value, or `null` if not found or session invalid
- **Description**: Retrieves a session attribute without creating a new session.

#### `removeAttribute(HttpServletRequest request, String key)`
- **Parameters**:
    - `request` {@code HttpServletRequest}: to obtain session from
    - `key` {@code String}: attribute key to remove
- **Returns**: {@code void}
- **Description**: Removes a session attribute if session exists.

#### `invalidateSession(HttpServletRequest request)`
- **Parameters**:
    - `request` {@code HttpServletRequest}: to obtain session from
- **Returns**: {@code void}
- **Description**: Invalidates the current session if it exists; used for logout.

---

## ValidationUtil
**Purpose**: Utility class for validating user input fields using regex and string checks.

### Methods

#### `isNullOrEmpty(String value)`
- **Parameters**:
    - `value` {@code String}: the string to check
- **Returns**: {@code boolean} — `true` if null or empty after trim, `false` otherwise
- **Description**: Checks if a string is null or contains only whitespace.

#### `isAlphabetic(String value)`
- **Parameters**:
    - `value` {@code String}: the string to validate
- **Returns**: {@code boolean} — `true` if matches `^[a-zA-Z]+$`, `false` otherwise
- **Description**: Checks if a string contains only alphabetic characters.

#### `isValidEmail(String email)`
- **Parameters**:
    - `email` {@code String}: the email address to validate
- **Returns**: {@code boolean} — `true` if email matches regex pattern, `false` otherwise
- **Description**: Validates email format using regex pattern.

#### `isValidPassword(String password)`
- **Parameters**:
    - `password` {@code String}: the password to validate
- **Returns**: {@code boolean} — `true` if password meets complexity rules, `false` otherwise
- **Description**: Validates password: 6+ chars, 1 uppercase, 1 digit, 1 special character.


#### `doPasswordsMatch(String password, String retypePassword)`
- **Parameters**:
    - `password` {@code String}: the original password
    - `retypePassword` {@code String}: the confirmation password
- **Returns**: {@code boolean} — `true` if both strings are equal and non-null
- **Description**: Checks if two password strings match exactly.

#### `isValidPhone(String phoneNumber)`
- **Parameters**:
    - `phoneNumber` {@code String}: the phone number to validate
- **Returns**: {@code boolean} — `true` if 10 digits and starts with `9`, `false` otherwise
- **Description**: Validates Nepali mobile phone number format.

---