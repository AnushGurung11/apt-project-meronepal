# User Story & User Flow — Mero Nepal Production

---

## USER STORIES

### As a Guest / Visitor

1. As a visitor, I want to land on the homepage so that I can learn about Mero Nepal Production and what they offer.

2. As a visitor, I want to browse all available packages (Basic, Standard, Premium, Luxury, Business, Documentary, Music Video) with their prices and descriptions so that I can compare and choose what fits my event.

3. As a visitor, I want to click on a specific package and see which services are included inside it so that I understand exactly what I am getting before booking.

4. As a visitor, I want to view the portfolio so that I can evaluate the quality of previous work before making a decision.

5. As a visitor, I want to read blog posts published on the platform so that I can learn more and stay engaged with the brand.

6. As a visitor, I want to register or log in so that I can proceed with booking a package.

### As a Registered Customer

7. As a registered customer, I want to browse all active packages so that I can select the one that matches my event type and budget.

8. As a registered customer, I want to select a package (for example the Premium Package at NPR 35,000 for a wedding) so that the system creates a booking record linked to my account and that package.

9. As a registered customer, I want to provide my event date, event address, and any special notes during booking so that the production team knows my requirements.

10. As a registered customer, I want to view the services bundled inside my selected package (for example Premium includes Wedding Photography, Drone Videography, and Editing) so that I know exactly what is covered.

11. As a registered customer, I want a payment record to be automatically generated with my booking so that the system tracks whether I have paid, partially paid, or not yet paid.

12. As a registered customer, I want to complete payment via Cash, Card, Bank Transfer, or Online so that my booking moves from Pending to Confirmed.

13. As a registered customer, I want to view my booking history (Pending, Confirmed, Completed, Cancelled) so that I can track the status of my events.

14. As a registered customer, I want to submit one testimony for each completed booking so that I can share my experience and rating (1 to 5 stars) about that specific service.

15. As a registered customer, I want to be restricted from submitting more than one testimony per completed booking so that the system maintains integrity of reviews.

### As an Admin

16. As an admin, I want to manage the list of services (add, edit, deactivate) so that the service catalog stays accurate and up to date.

17. As an admin, I want to create and manage packages by bundling specific services inside them so that customers are offered the right combinations at the right price.

18. As an admin, I want to link services to packages through the Package_Service relationship so that each package clearly reflects what it includes.

19. As an admin, I want to activate or deactivate packages and services using the is_active flag so that outdated offerings are hidden from customers without deleting data.

20. As an admin, I want to view all bookings across all customers with their status (Pending, Confirmed, Completed, Cancelled) so that I can oversee the entire operation.

21. As an admin, I want to view payment records linked to each booking so that I can track who has paid, who has partially paid, and who still owes payment.

22. As an admin, I want to update booking status (for example from Confirmed to Completed after the event) so that the system reflects real-world progress.

23. As an admin, I want to create and publish portfolios and blog posts so that visitors are engaged with fresh and professional content.

24. As an admin, I want to read customer testimonies linked to completed bookings so that I can monitor customer satisfaction and ratings.

---

## UPDATED USER FLOW

### Flow 1 — Guest Browsing (No Account Required)

Start
→ Lands on Homepage
→ Views intro, brand overview, and featured services
→ Navigates to Packages page
→ Sees all active packages listed (Basic NPR 10,000 / Standard NPR 20,000 / Premium NPR 35,000 / Luxury NPR 60,000 / Business NPR 15,000 / Documentary NPR 50,000 / Music Video NPR 70,000)
→ Clicks on a package to view its detail page
→ Sees the list of services bundled inside that package (for example Premium includes Wedding Photography & Videography + Drone & Cinematic Videography + Professional Photo & Video Editing)
→ Browses Portfolio section
→ Reads Blog Posts
→ Clicks Book Now
→ Redirected to Login or Register page
→ End

### Flow 2 — User Registration and Login

Start
→ Clicks Register
→ Fills in first name, last name, email, phone number, and password
→ Account created with role set to Customer by default
→ Redirected to Customer Dashboard
→ OR clicks Login
→ Enters email and password
→ Authenticated
→ Redirected to Customer Dashboard
→ End

### Flow 3 — Package Booking and Payment (Core Flow)

Start
→ Logged-in customer navigates to Packages page
→ Browses active packages with descriptions and prices
→ Selects a package (for example Standard Package at NPR 20,000 for an engagement)
→ Views services included inside the selected package
(Standard Package includes: Pre-Wedding & Engagement Shoots + Professional Photo & Video Editing)
→ Clicks Proceed to Book
→ Fills in booking details:

- Booking Date (today's date)
- Event Date (future date)
- Event Address (for example Bhaktapur, Nepal)
- Notes (optional)
  → Submits booking form
  → System creates a Booking record with status set to Pending
  → System automatically creates a linked Payment record with status set to Unpaid
  → Customer is shown booking summary with payment details
  → Customer selects payment method (Cash / Card / Bank Transfer / Online)
  → Customer completes payment
  → Payment record updated to Paid or Partial
  → Booking status updated to Confirmed by admin
  → Customer receives confirmation
  → End

### Flow 4 — Viewing Booked Package and Its Services

Start
→ Logged-in customer goes to My Bookings section
→ Sees list of all their bookings with status labels (Pending / Confirmed / Completed / Cancelled)
→ Clicks on a specific booking
→ Sees:

- Package name and price
- Event date and address
- Services bundled inside that package
- Payment status (Unpaid / Partial / Paid)
  → End

### Flow 5 — Submitting a Testimony

Start
→ Logged-in customer opens My Bookings
→ Finds a booking with status Completed
→ Clicks Submit Testimony on that booking
→ System checks if a testimony already exists for that booking_id
→ If no testimony exists:
→ Customer fills in message and selects a rating from 1 to 5
→ Submits form
→ Testimony saved and linked to that specific booking
→ Success message shown
→ If a testimony already exists for that booking:
→ System displays message: You have already submitted a testimony for this booking
→ Submission is blocked
→ End

### Flow 6 — Admin Managing Packages and Services

Start
→ Admin logs in with admin credentials
→ Redirected to Admin Dashboard
→ Selects Manage Services:
→ Views all services (Wedding Photography, Pre-Wedding, Event Coverage, Portrait, Product Photography, Documentary Production, Music Video Production, Drone & Cinematic, Editing)
→ Adds a new service or edits an existing one
→ Deactivates a service using the is_active flag
→ Selects Manage Packages:
→ Views all packages with prices and descriptions
→ Creates a new package with name, description, and price
→ Links services to the package via Package_Service (for example links Drone + Wedding Photography + Editing to the Premium Package)
→ Deactivates a package if no longer offered
→ End

### Flow 7 — Admin Overseeing Bookings and Payments

Start
→ Admin navigates to Bookings section on Dashboard
→ Views all bookings from all customers (Krish, Sudip, Bijaya, Arjun etc.) with current status
→ Clicks on a specific booking
→ Reviews:

- Customer name and contact
- Package booked
- Event date and address
- Customer notes
- Linked payment record (amount, method, status, date)
  → Updates booking status if needed (for example Confirmed → Completed after the event)
  → Confirms or flags payment status
  → End

### Flow 8 — Admin Creating Portfolio and Blog Content

Start
→ Admin navigates to Content Management on Dashboard
→ Selects Portfolio:
→ Creates a new portfolio
→ Links it to specific services and showcases specific completed projects
→ Publishes portfolio (visible to visitors)
→ Selects Blog:
→ Creates a new blog post with title, content, and media
→ Publishes blog post (visible to visitors)
→ End

---

## ENTITY & RELATIONSHIP SUMMARY (From Schema)

User (Customer or Admin) → places → Booking
Booking → is for → one Package
Package → contains → multiple Services (via Package_Service)
Booking → has → one Payment (1 to 1 relationship, booking_id is UNIQUE in Payment)
Booking → has → one Testimony (1 to 1 relationship, booking_id is UNIQUE in Testimony)
Testimony → can only be submitted → for a Completed Booking
Payment status → can be → Unpaid, Partial, Paid, or Refunded
Booking status → can be → Pending, Confirmed, Completed, or Cancelled
Admin → manages → Packages, Services, Package_Service links, Bookings, Payments, Portfolios, Blogs
