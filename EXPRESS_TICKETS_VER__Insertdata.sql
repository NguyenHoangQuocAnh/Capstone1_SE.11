--Import data for user
INSERT INTO Users (user_id_, username, password, email, role)
VALUES
	('User1', 'username1', 'password1', 'user1@example.com', 'Customer'),
    ('User5', 'username5', 'password5', 'user5@example.com', 'Customer'),
    ('User6', 'username6', 'password6', 'user6@example.com', 'Customer'),
    ('User7', 'quocanhdepgai', 'password7', 'user7@example.com', 'Customer'),
    ('User8', 'thanhhungdepgai', 'password8', 'user8@example.com', 'Customer'),
    ('User9', 'baokiemdepgai', 'password9', 'user9@example.com', 'Customer'),
    ('User10', 'hongnghiadepgai', 'password10', 'user10@example.com', 'Customer'),
    ('User2', 'username2', 'password2', 'user2@example.com', 'Driver'),
    ('User11', 'username11', 'password11', 'user11@example.com', 'Driver'),
    ('User12', 'username12', 'password12', 'user12@example.com', 'Driver'),
    ('User13', 'username13', 'password13', 'user13@example.com', 'Driver'),
    ('User3', 'username3', 'password3', 'user3@example.com', 'Admin'),
    ('User14', 'username14', 'password14', 'user14@example.com', 'Staff'),
    ('User4', 'username4', 'password4', 'user4@example.com', 'Staff');
--Import data for customer
INSERT INTO Customers (customer_id, user_id_, full_name, phone_number)
VALUES
	('Customer1','User1',N'Nguyễn Minh Khôi','0123456666'),
	('Customer2','User5',N'Trần Hồng Sơn','0123456777'),
	('Customer3','User6',N'Cao Văn Lộc','0123456888'),
	('Customer4','User7',N'Nguyễn Hoàng Quốc Anh','0123456999'),
	('Customer5','User8',N'Nguyễn Thành Hưng','0123456766'),
	('Customer6','User9',N'Đặng Bảo Kiếm','0123456788'),
	('Customer7','User10',N'Võ Hồng Nghĩa','0123456799');
--Import data for Admins
INSERT INTO Admins (admin_id, user_id_, full_name, phone_number)
VALUES
	('Admin1','User3','Capstone1GR11','0123456789');

INSERT INTO Partners (partner_id, company_name, image_avatar, contact_name, contact_email, contact_phone_number, contact_address, point, status_)
VALUES	
	('Partner1',N'Nhà xe Hoàng Long','', N'Công ty TNHH Vận tải Hoàng Long','info@hoanglongasia.com','02253920920', N'Số 05 Phạm Ngũ Lão, P.Lương Khánh Thiện, Ngô Quyền , TP. Hải Phòng',4.5, 1),
	('Partner2',N'Nhà xe Hiếu Hoa','',N'Công ty TNHH Vận Tải và Dịch vụ Du Lịch Quảng Hà', 'hieuhoadanang@gmail.com','0905888547', N'12 Nguyễn Viết Xuân, phường Hòa Minh, quận Liên Chiểu, Đà Nẵng',4.6, 1);
SELECT * FROM Partners

--Import data Licenses 
INSERT INTO Licenses (license_id, image_front, image_behind, image_width, image_height, image_type)
VALUES
    ('License1', 0x012345, 0x6789AB, 800, 600, 'JPEG'),
    ('License2', 0xCDEF01, 0x234567, 1024, 768, 'PNG');
select * from Licenses

INSERT INTO Drivers (driver_id, user_id_, image_avatar, full_name, birthday, address_, literacy, license_id, partner_id, phone_number,point, status_)
VALUES	
	('Driver1','User2','',N'Hoàng Chí Cường','1987-12-01 00:00:00',N'Đồng Nai','12/12','License1','Partner1','0534563216',4.1,1),
	('Driver2','User11','',N'Trân Công Sơn','1990-12-01 00:00:00',N'Hải Phòng','12/12','License2','Partner1','0984654354',4.1,1),
	('Driver3','User12','',N'Hoàng Văn Thái','1991-12-01 00:00:00',N'Nghệ An','12/12','License1','Partner2','0985656844',4.1,1),
	('Driver4','User13','',N'Châu Chí Nam','1985-12-01 00:00:00',N'Hà Tĩnh','12/12','License2','Partner2','0986466965',4.2,1);

	--Import data Staffs 
INSERT INTO Staffs (staff_id, user_id_, partner_id, image_avatar, full_name, phone_number)
VALUES 
	('Staff1', 'User4', 'Partner1', '', N'Nguyễn Thị Thu Ngân', '096584965'),
	('Staff2', 'User14', 'Partner2', '', N'Nguyễn Bích Ngọc', '096585195');

INSERT INTO Coaches(coach_id,image_avatar,license_plate,seat_capacity,service_level,driver_id,partner_id,status_)
VALUES
	('Coach1','https://res.cloudinary.com/dkbovfajo/image/upload/v1700134154/Xe/pnzi6h5bzx8ni0fzqb3t.jpg','43K1-56211',40,N'Thường','Driver1','Partner1',1),
	('Coach2','https://res.cloudinary.com/dkbovfajo/image/upload/v1701042183/Xe/qg1coc7tys8eza6pymro.jpg','38K1-22388',40,N'Thường','Driver2','Partner1',1),
	('Coach3','https://res.cloudinary.com/dkbovfajo/image/upload/v1701042208/Xe/jefah8q4bqix3gefjoyx.jpg','73H1-56211',40,N'Thường','Driver3','Partner2',1);
update Coaches
set coach_name = N'Xuân Quỳnh' where coach_id = 'Coach3'
--Import data Citys
INSERT INTO Citys (city_id, name_city, image_avatar)
VALUES
	('01', N'Hà Nội', 'https://img4.thuthuatphanmem.vn/uploads/2020/08/27/anh-nen-ha-noi-dem_054022964.jpg'),
	('02', N'Hà Giang', ''),
	('03', N'Cao Bằng', ''),
	('04', N'Lào Cai', ''),
	('05', N'Điện Biên', ''),
	('06', N'Lai Châu', ''),
	('07', N'Sơn La', ''),
	('08', N'Yên Bái', ''),
	('09', N'Phú Thọ', ''),
	('10', N'Vĩnh Phúc', ''),
	('11', N'Quảng Ninh', ''),
	('12', N'Bắc Giang', ''),
	('13', N'Lạng Sơn', ''),
	('14', N'Tuyên Quang', ''),
	('15', N'Thái Nguyên', ''),
	('16', N'Lào Cai', ''),
	('17', N'Hà Nam', ''),
	('18', N'Hòa Bình', ''),
	('19', N'Thái Bình', ''),
	('20', N'Hải Dương', ''),
	('21', N'Hải Phòng', ''),
	('22', N'Hưng Yên', ''),
	('23', N'Nam Định', ''),
	('24', N'Ninh Bình', ''),
	('25', N'Thanh Hóa', ''),
	('26', N'Nghệ An', 'https://bvhttdl.mediacdn.vn/291773308735864832/2023/8/23/149424928diemdennoitiengnhatnghean-1692753611484-1692753611645344084917.jpg'),
	('27', N'Hà Tĩnh', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/55/a5/94/melia-vinpearl-ha-tinh.jpg?w=1200&h=-1&s=1'),
	('28', N'Quảng Bình', 'https://www.flc.vn/wp-content/uploads/2022/03/Anh-1-6.jpg'),
	('29', N'Quảng Trị', ''),
	('30', N'Thừa Thiên Huế', 'https://static.vinwonders.com/production/check-in-hue-1.jpg'),
	('31', N'Đà Nẵng', 'https://statics.vinpearl.com/du-lich-da-nang_1657939501.JPG'),
	('32', N'Quảng Nam', ''),
	('33', N'Quảng Ngãi', ''),
	('34', N'Bình Định', ''),
	('35', N'Phú Yên', ''),
	('36', N'Khánh Hòa', ''),
	('37', N'Ninh Thuận', ''),
	('38', N'Bình Thuận', ''),
	('39', N'Kon Tum', ''),
	('40', N'Gia Lai', ''),
	('41', N'Đắk Lắk', ''),
	('42', N'Đắk Nông', ''),
	('43', N'Lâm Đồng', ''),
	('44', N'Bình Phước', ''),
	('45', N'Tây Ninh', ''),
	('46', N'Bình Dương', 'https://media-cdn-v2.laodong.vn/Storage/newsportal/2019/1/3/650041/ANH-DEP-BINH-DUONG-1.jpg'),
	('47', N'Đồng Nai', ''),
	('48', N'Bà Rịa - Vũng Tàu', ''),
	('49', N'Thành phố Hồ Chí Minh', 'https://img6.thuthuatphanmem.vn/uploads/2022/02/09/anh-dep-do-thi-thanh-pho-ho-chi-minh_031024615.jpg'),
	('50', N'Long An', ''),
	('51', N'Tiền Giang', ''),
	('52', N'Bến Tre', ''),
	('53', N'Trà Vinh', ''),
	('54', N'Vĩnh Long', ''),
	('55', N'Đồng Tháp', ''),
	('56', N'An Giang', ''),
	('57', N'Kiên Giang', ''),
	('58', N'Cần Thơ', '');

--Import data Trips
INSERT INTO Trips (trip_id, coach_id, trip_name, origin, destination, distance, duration, departure_date,number_of_ticket, price_trip,arrival_datetime,intend_date)
VALUES
    ('Trip1','Coach1', N'Hoàng Long', N'Đà Nẵng', N'Hà Tĩnh', 500, 360, '2023-12-10 07:30:00',40,300000,'2023-12-10 14:30:00','2023-12-10 14:30:00'),
    ('Trip2','Coach2', N'Hiếu Hoa', N'Đà Nẵng', N'Hà Tĩnh', 500, 360, '2023-12-10 21:30:00',40,350000,'2023-12-10 14:30:00','2023-12-10 14:30:00'),
    ('Trip3','Coach3', N'Xuân Quỳnh', N'Hà Nội', N'Huế', 200, 2880, '2023-12-10 21:30:00',40,150000,'2023-12-10 14:30:00','2023-12-10 14:30:00');
select * from Trips

select
                Trips.trip_id,
                Trips.trip_name,
                Trips.origin,
                Trips.destination,
                FORMAT(Trips.arrival_datetime, 'yyyy-MM-dd HH:mm') as arrival_datetime,
                FORMAT(Trips.departure_date, 'yyyy-MM-dd HH:mm') as departure_date,
                Trips.number_of_ticket,
                Trips.price_trip,
                Coaches.*
            from Trips, Coaches
            WHERE Trips.coach_id = Coaches.coach_id
            and
                (DATEPART(yy, Trips.departure_date) = 2023
                AND    DATEPART(mm, Trips.departure_date) = 12
                AND    DATEPART(dd, Trips.departure_date) = 10)
                AND Trips.origin  = N'Đà Nẵng'
                AND Trips.destination = N'Hà Tĩnh'

