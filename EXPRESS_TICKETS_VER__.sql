CREATE DATABASE EXPRESS_TICKETS_VER__
USE EXPRESS_TICKETS_VER__
GO
/****** Object:  UserDefinedFunction [dbo].[GetTravelHours]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTravelHours](@intendDate SMALLDATETIME, @departureDate SMALLDATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @travelHours INT;

    -- Sử dụng DATEDIFF để tính khoảng cách giữa hai thời điểm trong giờ
    SET @travelHours = DATEDIFF(HOUR, @departureDate, @intendDate);

    RETURN @travelHours;
END;
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[admin_id] [varchar](50) NOT NULL,
	[user_id_] [varchar](50) NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citys]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citys](
	[city_id] [varchar](50) NOT NULL,
	[name_city] [nvarchar](50) NOT NULL,
	[image_avatar] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[coach_id] [varchar](50) NOT NULL,
	[image_avatar] [nvarchar](255) NOT NULL,
	[license_plate] [varchar](20) NOT NULL,
	[seat_capacity] [int] NOT NULL,
	[service_level] [nvarchar](50) NOT NULL,
	[driver_id] [varchar](50) NULL,
	[partner_id] [varchar](50) NULL,
	[status_] [bit] NOT NULL,
	[coach_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[coach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [varchar](50) NOT NULL,
	[customer_id] [varchar](50) NULL,
	[trip_id] [varchar](50) NULL,
	[trip_date] [datetime] NULL,
	[comment_date] [datetime] NULL,
	[content] [nvarchar](500) NULL,
	[point] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [varchar](50) NOT NULL,
	[user_id_] [varchar](50) NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[driver_id] [varchar](50) NOT NULL,
	[user_id_] [varchar](50) NULL,
	[image_avatar] [nvarchar](255) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[birthday] [date] NULL,
	[address_] [nvarchar](255) NOT NULL,
	[literacy] [nvarchar](100) NOT NULL,
	[license_id] [varchar](50) NULL,
	[partner_id] [varchar](50) NULL,
	[phone_number] [varchar](15) NOT NULL,
	[point] [float] NOT NULL,
	[status_] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licenses]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licenses](
	[license_id] [varchar](50) NOT NULL,
	[image_front] [varbinary](8000) NULL,
	[image_behind] [varbinary](8000) NULL,
	[image_width] [int] NULL,
	[image_height] [int] NULL,
	[image_type] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[license_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_visits]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_visits](
	[numerical_order] [int] NOT NULL,
	[city_id] [varchar](50) NULL,
	[note] [nvarchar](100) NOT NULL,
	[trip_id] [varchar](50) NULL,
	[location_visits] [float] NULL,
	[time_visits] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[partner_id] [varchar](50) NOT NULL,
	[company_name] [nvarchar](255) NOT NULL,
	[image_avatar] [nvarchar](255) NULL,
	[contact_name] [nvarchar](255) NULL,
	[contact_email] [nvarchar](255) NULL,
	[contact_phone_number] [varchar](15) NOT NULL,
	[contact_address] [nvarchar](255) NOT NULL,
	[point] [float] NOT NULL,
	[status_] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[partner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [varchar](50) NOT NULL,
	[ticket_id] [varchar](50) NULL,
	[qr_code_image] [text] NULL,
	[origin] [nvarchar](100) NOT NULL,
	[destination] [nvarchar](100) NOT NULL,
	[departure_datetime] [datetime] NOT NULL,
	[booking_date] [datetime] NOT NULL,
	[payment_date] [datetime] NULL,
	[amount] [float] NOT NULL,
	[payment_method] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[staff_id] [varchar](50) NOT NULL,
	[user_id_] [varchar](50) NULL,
	[partner_id] [varchar](50) NULL,
	[image_avatar] [nvarchar](255) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ticket_id] [varchar](50) NOT NULL,
	[trip_id] [varchar](50) NULL,
	[customer_id_] [varchar](50) NULL,
	[departure_datetime] [datetime] NOT NULL,
	[seat_number] [varchar](5) NOT NULL,
	[price] [float] NOT NULL,
	[status_] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[trip_id] [varchar](50) NOT NULL,
	[coach_id] [varchar](50) NULL,
	[trip_name] [nvarchar](100) NOT NULL,
	[origin] [nvarchar](100) NOT NULL,
	[destination] [nvarchar](100) NOT NULL,
	[distance] [float] NULL,
	[duration] [int] NULL,
	[departure_date] [smalldatetime] NULL,
	[number_of_ticket] [int] NULL,
	[price_trip] [float] NULL,
	[arrival_datetime] [datetime] NULL,
	[intend_date] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id_] [varchar](50) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](12) NULL,
	[email] [nvarchar](100) NULL,
	[role] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([user_id_])
REFERENCES [dbo].[Users] ([user_id_])
GO
ALTER TABLE [dbo].[Coaches]  WITH CHECK ADD FOREIGN KEY([driver_id])
REFERENCES [dbo].[Drivers] ([driver_id])
GO
ALTER TABLE [dbo].[Coaches]  WITH CHECK ADD FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([partner_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([trip_id])
REFERENCES [dbo].[Trips] ([trip_id])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([user_id_])
REFERENCES [dbo].[Users] ([user_id_])
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD FOREIGN KEY([license_id])
REFERENCES [dbo].[Licenses] ([license_id])
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([partner_id])
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD FOREIGN KEY([user_id_])
REFERENCES [dbo].[Users] ([user_id_])
GO
ALTER TABLE [dbo].[List_visits]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[Citys] ([city_id])
GO
ALTER TABLE [dbo].[List_visits]  WITH CHECK ADD FOREIGN KEY([trip_id])
REFERENCES [dbo].[Trips] ([trip_id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Tickets] ([ticket_id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([partner_id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([user_id_])
REFERENCES [dbo].[Users] ([user_id_])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([customer_id_])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([trip_id])
REFERENCES [dbo].[Trips] ([trip_id])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([coach_id])
REFERENCES [dbo].[Coaches] ([coach_id])
GO
/****** Object:  StoredProcedure [dbo].[GetTicketInformation]    Script Date: 12/13/2023 11:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTicketInformation]
    @TicketID VARCHAR(50)
AS
BEGIN
    SELECT
        Tickets.ticket_id,
		Tickets.seat_number,
        Customers.full_name AS customer_name,
		Customers.phone_number,
        Trips.*
    FROM Tickets, Customers, Trips
    -- Liên kết bảng Tickets với bảng Customers
	WHERE Tickets.customer_id_ = Customers.customer_id
	AND
		-- Liên kết bảng Tickets với bảng Trips
		Tickets.trip_id = Trips.trip_id
	AND
		Tickets.ticket_id = @TicketID;
END;
GO

--Bảng thông báo
CREATE TABLE Notifications (
	notification_id INT IDENTITY(1,1) PRIMARY KEY,
	notification_type SMALLINT NOT NULL default 1,
	notification_content NVARCHAR(1000) NOT NULL,
    notification_status SMALLINT NOT NULL default 1
)
GO
--Tạo bảng Seats chứa các thuộc tính 
CREATE TABLE Seats (
	seat_id VARCHAR(50) PRIMARY KEY,
	seat_number VARCHAR(5) NOT NULL,
	seat_status tinyint NOT NULL default 1, --1 Ghế chưa ai đặt, 2 Ghế có người đặt, 3 Ghế đã có người đặt, 4 Hành khách chuẩn bị xuống xe
    decker VARCHAR(2) NOT NULL, -- tầng ghế
	coach_id VARCHAR(50) FOREIGN KEY (coach_id) REFERENCES  Coaches(coach_id)
)
GO
CREATE UNIQUE INDEX Seats_seat_number_coach_id_unique
ON Seats(seat_number, coach_id);