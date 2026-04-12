INSERT INTO User (
    first_name,
    last_name,
    middle_name,
    email,
    phone_number,
    password_hash,
    user_role
) VALUES
('Krish',   'Shresth', NULL, 'krish.shresth@gmail.com',   '9800000001', SHA2('krish123', 256),   'Customer'),
('Darshan', 'Regmi',   NULL, 'darshan.regmi@gmail.com',   '9800000002', SHA2('darshan123', 256), 'Admin'),
('Anush',   'Gurung',  NULL, 'anush.gurung@gmail.com',    '9800000003', SHA2('anush123', 256),   'Admin'),
('Sudip',   'Gautam',  NULL, 'sudip.gautam@gmail.com',    '9800000004', SHA2('sudip123', 256),   'Customer'),
('Bijaya',  'Khanal',  NULL, 'bijaya.khanal@gmail.com',   '9800000005', SHA2('bijaya123', 256),  'Customer'),
('Arjun',   'Bastola', NULL, 'arjun.bastola@gmail.com',   '9800000006', SHA2('arjun123', 256),   'Customer');