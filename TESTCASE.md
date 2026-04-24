# Register & Login API Testing Guide
> MeroNepal APT Booking System

## Base URL
```
http://localhost:8080/courseworkapt
```

---

## Prerequisites

- Tomcat server running
- Database running with correct schema
- Postman installed
- Cookies enabled in Postman → `Settings → Cookies → Enable for localhost`

---

## Register Testing

**Endpoint:** `POST /register`  
**Body Type:** `x-www-form-urlencoded`

### Happy Path
| Key | Value |
|---|---|
| username | anushgrg |
| phoneNumber | 9825188537 |
| email | anush@gmail.com |
| password | Anush@123 |
| confirmPassword | Anush@123 |

**Expected:** `Registration Successful!`  
**Status:** `200 OK`

---

### Duplicate User
Send the exact same request again.

**Expected:** `Error: User/Email already present!`  
**Status:** `200 OK`

---

### Validation Errors
| Key | Value | Reason |
|---|---|---|
| username | ab | Less than 5 characters |
| phoneNumber | 9825188537 | Valid |
| email | notanemail | Invalid format |
| password | 123 | Too weak |
| confirmPassword | 456 | Does not match |

**Expected:**
```
Validation Error: Name not Proper! Mail not Proper! Password not Proper! Password not matching!
```
**Status:** `200 OK`

---

## Login Testing

**Endpoint:** `POST /login`  
**Body Type:** `x-www-form-urlencoded`

### Happy Path
| Key | Value |
|---|---|
| username | anushgrg |
| password | Anush@123 |

**Expected:** `Login Successful!`  
**Status:** `200 OK`  
**Side Effect:** Session cookie is set — required for protected routes

---

### Wrong Password
| Key | Value |
|---|---|
| username | anushgrg |
| password | wrongpass |

**Expected:** `Invalid credentials!`  
**Status:** `200 OK`

---

### User Not Found
| Key | Value |
|---|---|
| username | ghostuser |
| password | Anush@123 |

**Expected:** `Invalid credentials!`  
**Status:** `200 OK`

---

## Booking Testing

**Endpoint:** `POST /booking`  
**Body Type:** `x-www-form-urlencoded`  
**Requirement:** Must be logged in first (session cookie must exist)

### Happy Path
| Key | Value |
|---|---|
| packageService | 1 |
| eventAddress | Kathmandu, Nepal |
| description | Birthday party event |
| eventDate | 2026-06-15 |

**Expected:** Redirects to `/dashboard` with `Booking Created Successfully!`

---

### Without Login (Filter Test)
Clear cookies and send booking request directly.

**Expected:** Redirects to `/login`  
**Reason:** `AuthenticationFilter` blocks unauthenticated requests

---

## Quick Test Order

```
1. POST /register     → new user (expect: Registration Successful!)
2. POST /register     → same data again (expect: User already present!)
3. POST /register     → bad data (expect: Validation Error)
4. POST /login        → valid credentials (expect: Login Successful!)
5. POST /login        → wrong password (expect: Invalid credentials!)
6. POST /booking      → with session from step 4 (expect: Booking Created!)
7. POST /booking      → without session/cookies (expect: redirect to /login)
```

---

## Response Code Reference

| Code | Meaning |
|---|---|
| `200 OK` | Request reached servlet and was processed |
| `302 Found` | Redirect (to dashboard or login) |
| `404 Not Found` | Wrong URL or JSP missing |
| `500 Internal Server Error` | Check Tomcat console for SQL or code errors |

---

## DAO Error Code Reference

| Code | Meaning |
|---|---|
| `1` | Success — record inserted |
| `2` | Duplicate — user or email already exists |
| `3` | Server error — check SQL query or DB connection |

---

## Common Issues

| Problem | Cause | Fix |
|---|---|---|
| Always redirected to `/login` | Session cookie not sent | Enable cookies in Postman |
| `Server Error: 3` | SQL query bug or DB column mismatch | Check DAO SQL and column names |
| `404 Not Found` | Wrong URL or missing JSP | Verify `@WebServlet` urlPattern |
| `500 Internal Server Error` | DB connection failed | Check `DBConfig` and MySQL running |
| Filter not blocking | Wrong `urlPatterns` in filter | Ensure `/*` is set |