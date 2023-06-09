CREATE DATABASE HKQTravelingWebsite3
USE [HKQTravelingWebsite3]
GO
/****** Object:  Table [dbo].[admin_account]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_account](
	[admin_id] [bigint] IDENTITY(1,1) NOT NULL,
	[admin_user] [varchar](50) NOT NULL,
	[admin_password] [varchar](100) NOT NULL,
	[admin_fulllname] [nvarchar](50) NULL,
	[email] [varchar](150) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_admin_account] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_flight]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_flight](
	[bill_flight_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total] [decimal](18, 2) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_bill_flight] PRIMARY KEY CLUSTERED 
(
	[bill_flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_hotel]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_hotel](
	[bill_hotel_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total] [decimal](18, 2) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_bill_hotel] PRIMARY KEY CLUSTERED 
(
	[bill_hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_tour]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_tour](
	[bill_tour_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total] [decimal](18, 2) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_bill_tour] PRIMARY KEY CLUSTERED 
(
	[bill_tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departure_point]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departure_point](
	[departure_id] [bigint] IDENTITY(1,1) NOT NULL,
	[departure_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_departure_point] PRIMARY KEY CLUSTERED 
(
	[departure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[destination_point]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[destination_point](
	[destination_id] [bigint] IDENTITY(1,1) NOT NULL,
	[destination_name] [nvarchar](50) NOT NULL,
	[destination_image] [varchar](max) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_destination_point] PRIMARY KEY CLUSTERED 
(
	[destination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_bill_flight]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_bill_flight](
	[flight_id] [bigint] NOT NULL,
	[bill_flight_id] [bigint] NOT NULL,
 CONSTRAINT [PK_detail_bill_flight] PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC,
	[bill_flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_bill_hotel]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_bill_hotel](
	[hotel_id] [bigint] NOT NULL,
	[bill_hotel_id] [bigint] NOT NULL,
 CONSTRAINT [PK_detail_bill_hotel] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC,
	[bill_hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_bill_tour]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_bill_tour](
	[tour_id] [bigint] NOT NULL,
	[bill_tour_id] [bigint] NOT NULL,
 CONSTRAINT [PK_detail_bill_tour] PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[bill_tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discount_id] [bigint] IDENTITY(1,1) NOT NULL,
	[discount_month] [date] NULL,
	[percentage] [float] NULL,
	[discount_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight](
	[flight_id] [bigint] IDENTITY(1,1) NOT NULL,
	[flight_name] [nvarchar](50) NULL,
	[departure_location] [nvarchar](50) NULL,
	[destination_location] [nvarchar](50) NULL,
	[start_time] [datetime] NULL,
	[return_time] [datetime] NULL,
	[price] [decimal](18, 2) NULL,
	[ranking] [int] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_flight] PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[hotel_id] [bigint] IDENTITY(1,1) NOT NULL,
	[hotel_name] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NULL,
	[number_room] [int] NULL,
	[rice] [decimal](18, 2) NULL,
	[ranking] [int] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[tour_id] [bigint] IDENTITY(1,1) NOT NULL,
	[tour_name] [nvarchar](500) NULL,
	[price] [decimal](18, 2) NULL,
	[departure_time] [datetime] NULL,
	[return_time] [datetime] NULL,
	[destination_id] [bigint] NULL,
	[departure_id] [bigint] NULL,
	[tour_type_id] [bigint] NULL,
	[status] [int] NULL,
	[discount_id] [bigint] NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_type]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_type](
	[tour_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[tour_type_name] [nvarchar](50) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tour_type] PRIMARY KEY CLUSTERED 
(
	[tour_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_account]    Script Date: 5/20/2023 2:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_account](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[user_password] [varchar](50) NOT NULL,
	[user_fullname] [nvarchar](50) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[birthday] [datetime] NULL,
	[address] [nvarchar](150) NULL,
	[sex] [varchar](5) NULL,
	[user_image] [varchar](max) NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[tour_id] [bigint] NULL,
	[flight_id] [bigint] NULL,
	[hotel_id] [bigint] NULL,
 CONSTRAINT [PK_user_account] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_account] ON 

INSERT [dbo].[admin_account] ([admin_id], [admin_user], [admin_password], [admin_fulllname], [email], [status]) VALUES (1, N'quang', N'123', N'Ngô Minh Quang', N'quangngo1310@gmail.com', 1)
INSERT [dbo].[admin_account] ([admin_id], [admin_user], [admin_password], [admin_fulllname], [email], [status]) VALUES (2, N'kien', N'123', N'Đoàn Trung Kiên', N'123@gmail.com', 1)
INSERT [dbo].[admin_account] ([admin_id], [admin_user], [admin_password], [admin_fulllname], [email], [status]) VALUES (3, N'hung', N'123', N'Hà Lâm Hùng', N'312@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[admin_account] OFF
GO
SET IDENTITY_INSERT [dbo].[departure_point] ON 

INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (1, N'HoChiMinh City')
INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (2, N'DaLat')
INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (3, N'CanTho')
INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (4, N'DaNang')
INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (5, N'NoiBai')
INSERT [dbo].[departure_point] ([departure_id], [departure_name]) VALUES (6, N'HaiPhong')
SET IDENTITY_INSERT [dbo].[departure_point] OFF
GO
SET IDENTITY_INSERT [dbo].[destination_point] ON 

INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (1, N'Đà Lạt', N'dalat.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (2, N'Đà Nẵng', N'danang.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (3, N'Phú Quốc', N'phuquoc.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (4, N'Hội An', N'hoian.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (5, N'Sapa', N'sapa.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (6, N'Paris', N'paris.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (7, N'Dubai', N'dubai.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (8, N'New York', N'ny.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (9, N'Los Angeles', N'la.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (10, N'Korea', N'kr.jpg', 1)
INSERT [dbo].[destination_point] ([destination_id], [destination_name], [destination_image], [status]) VALUES (11, N'Côn Đảo', N'condao.jpg', 1)
SET IDENTITY_INSERT [dbo].[destination_point] OFF
GO
SET IDENTITY_INSERT [dbo].[discount] ON 

INSERT [dbo].[discount] ([discount_id], [discount_month], [percentage], [discount_name]) VALUES (1, CAST(N'2023-05-31' AS Date), 0.32, N'HKQ-T6(Welcom June)')
INSERT [dbo].[discount] ([discount_id], [discount_month], [percentage], [discount_name]) VALUES (2, CAST(N'2023-05-31' AS Date), 0.25, N'Sacombank tung ưu đãi (Welcom June)')
INSERT [dbo].[discount] ([discount_id], [discount_month], [percentage], [discount_name]) VALUES (3, CAST(N'2023-06-30' AS Date), 0.5, N'HKQ 7 (Welcom July)')
INSERT [dbo].[discount] ([discount_id], [discount_month], [percentage], [discount_name]) VALUES (4, CAST(N'2023-06-30' AS Date), 0.32, N'(Welcom July)')
SET IDENTITY_INSERT [dbo].[discount] OFF
GO
SET IDENTITY_INSERT [dbo].[flight] ON 

INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (1, N'Bamboo Airways - BAV1034', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (2, N'Bamboo Airways - BAV1310', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (3, N'Bamboo Airways - BAV2804', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (4, N'Bamboo Airways - BAV9312', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (5, N'Bamboo Airways - BAV1876', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (6, N'Bamboo Airways - BAV1011', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (7, N'Bamboo Airways - BAV1233', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (8, N'Bamboo Airways - BAV9985', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (9, N'Bamboo Airways - BAV1745', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
INSERT [dbo].[flight] ([flight_id], [flight_name], [departure_location], [destination_location], [start_time], [return_time], [price], [ranking], [image]) VALUES (10, N'Bamboo Airways - BAV5681', N'HoChiMinh City', N'DaLat', CAST(N'2023-06-06T18:00:00.000' AS DateTime), CAST(N'2023-06-09T22:00:00.000' AS DateTime), CAST(3000000.00 AS Decimal(18, 2)), 10, N'Bamboo.jpg')
SET IDENTITY_INSERT [dbo].[flight] OFF
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (1, N'Ana Mandara Villas Dalat Resort & Spa', N'DaLat', 306, CAST(3000000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (2, N'Le Recit Boutique Hotel de Dalat', N'DaLat', 706, CAST(1500000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (3, N'Dalat Wonder Resort', N'DaLat', 302, CAST(2300000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (4, N'Khách sạn The Grace Dalat', N'DaLat', 106, CAST(700000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (5, N'LATA Hotel & Apartments', N'DaLat', 507, CAST(900000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
INSERT [dbo].[hotel] ([hotel_id], [hotel_name], [location], [number_room], [rice], [ranking], [image]) VALUES (6, N'Khách sạn The Secret Côn Đảo(The Secret Con Dao)', N'ConDao', 593, CAST(700000.00 AS Decimal(18, 2)), 5, N'Hotel.jpg')
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([tour_id], [tour_name], [price], [departure_time], [return_time], [destination_id], [departure_id], [tour_type_id], [status], [discount_id]) VALUES (1, N'Đà Lạt - Thác Bobla - KDL Cao Nguyên Hoa - Trang Trại rau và hoa Vạn Thành', CAST(8000000.00 AS Decimal(18, 2)), CAST(N'2023-06-06T12:00:00.000' AS DateTime), CAST(N'2023-06-09T20:00:00.000' AS DateTime), 1, 1, 1, 1, NULL)
INSERT [dbo].[tour] ([tour_id], [tour_name], [price], [departure_time], [return_time], [destination_id], [departure_id], [tour_type_id], [status], [discount_id]) VALUES (2, N'Phú Quốc - Kỳ Nghỉ Đẳng Cấp Tại Thiên Đường Biển Đảo', CAST(6500000.00 AS Decimal(18, 2)), CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-15T20:00:00.000' AS DateTime), 3, 1, 1, 1, NULL)
INSERT [dbo].[tour] ([tour_id], [tour_name], [price], [departure_time], [return_time], [destination_id], [departure_id], [tour_type_id], [status], [discount_id]) VALUES (3, N'Đà Nẵng - Huế - Đầm Lập An - La Vang - Động Phong Nha & Thiên Đường - KDL Bà Nà - Cầu Vàng -Sơn Trà - Hội An - Đà Nẵng', CAST(7990000.00 AS Decimal(18, 2)), CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-15T20:00:00.000' AS DateTime), 2, 1, 1, 1, 3)
INSERT [dbo].[tour] ([tour_id], [tour_name], [price], [departure_time], [return_time], [destination_id], [departure_id], [tour_type_id], [status], [discount_id]) VALUES (4, N'Đà Nẵng - Hội An - Bà Nà - Cầu Vàng - Huế - Trải nghiệm đi thuyền dạo Sông Hoài & Tặng show Ký Ức Hội An | Kích cầu Du lịch', CAST(5490000.00 AS Decimal(18, 2)), CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-15T20:00:00.000' AS DateTime), 4, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[tour] OFF
GO
SET IDENTITY_INSERT [dbo].[tour_type] ON 

INSERT [dbo].[tour_type] ([tour_type_id], [tour_type_name], [status]) VALUES (1, N'High-class', 1)
INSERT [dbo].[tour_type] ([tour_type_id], [tour_type_name], [status]) VALUES (2, N'Standard', 1)
INSERT [dbo].[tour_type] ([tour_type_id], [tour_type_name], [status]) VALUES (3, N'Save', 1)
INSERT [dbo].[tour_type] ([tour_type_id], [tour_type_name], [status]) VALUES (4, N'Good prices', 1)
SET IDENTITY_INSERT [dbo].[tour_type] OFF
GO
SET IDENTITY_INSERT [dbo].[user_account] ON 

INSERT [dbo].[user_account] ([user_id], [user_name], [user_password], [user_fullname], [phone_number], [email], [birthday], [address], [sex], [user_image], [create_date], [update_date], [tour_id], [flight_id], [hotel_id]) VALUES (1, N'quang', N'123', N'NGÔ MINH QUANG', N'0981494344', N'quangngo1310@gmail.com', CAST(N'2002-10-13T00:00:00.000' AS DateTime), N'13, D5, Ward 25, Binh Thanh District, HCMC', N'Nam', N'quang.jpg', CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[user_account] OFF
GO
ALTER TABLE [dbo].[bill_tour] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[user_account] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[detail_bill_flight]  WITH CHECK ADD  CONSTRAINT [hóa dơn cb] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([flight_id])
GO
ALTER TABLE [dbo].[detail_bill_flight] CHECK CONSTRAINT [hóa dơn cb]
GO
ALTER TABLE [dbo].[detail_bill_flight]  WITH CHECK ADD  CONSTRAINT [hóa đơn cb] FOREIGN KEY([bill_flight_id])
REFERENCES [dbo].[bill_flight] ([bill_flight_id])
GO
ALTER TABLE [dbo].[detail_bill_flight] CHECK CONSTRAINT [hóa đơn cb]
GO
ALTER TABLE [dbo].[detail_bill_hotel]  WITH CHECK ADD  CONSTRAINT [FK_detail_bill_hotel_bill_hotel] FOREIGN KEY([bill_hotel_id])
REFERENCES [dbo].[bill_hotel] ([bill_hotel_id])
GO
ALTER TABLE [dbo].[detail_bill_hotel] CHECK CONSTRAINT [FK_detail_bill_hotel_bill_hotel]
GO
ALTER TABLE [dbo].[detail_bill_hotel]  WITH CHECK ADD  CONSTRAINT [hóa đơn ks] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[detail_bill_hotel] CHECK CONSTRAINT [hóa đơn ks]
GO
ALTER TABLE [dbo].[detail_bill_tour]  WITH CHECK ADD  CONSTRAINT [Chi tiết hóa đơn] FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([tour_id])
GO
ALTER TABLE [dbo].[detail_bill_tour] CHECK CONSTRAINT [Chi tiết hóa đơn]
GO
ALTER TABLE [dbo].[detail_bill_tour]  WITH CHECK ADD  CONSTRAINT [FK_detail_bill_tour_bill_tour] FOREIGN KEY([bill_tour_id])
REFERENCES [dbo].[bill_tour] ([bill_tour_id])
GO
ALTER TABLE [dbo].[detail_bill_tour] CHECK CONSTRAINT [FK_detail_bill_tour_bill_tour]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [Điểm đến] FOREIGN KEY([destination_id])
REFERENCES [dbo].[destination_point] ([destination_id])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [Điểm đến]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [Điểm đi] FOREIGN KEY([departure_id])
REFERENCES [dbo].[departure_point] ([departure_id])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [Điểm đi]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [Giảm giá theo tháng] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount] ([discount_id])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [Giảm giá theo tháng]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [Loại tour] FOREIGN KEY([tour_type_id])
REFERENCES [dbo].[tour_type] ([tour_type_id])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [Loại tour]
GO
ALTER TABLE [dbo].[user_account]  WITH CHECK ADD  CONSTRAINT [Đặt khách sạn] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[user_account] CHECK CONSTRAINT [Đặt khách sạn]
GO
ALTER TABLE [dbo].[user_account]  WITH CHECK ADD  CONSTRAINT [Đặt vé máy bay] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([flight_id])
GO
ALTER TABLE [dbo].[user_account] CHECK CONSTRAINT [Đặt vé máy bay]
GO
ALTER TABLE [dbo].[user_account]  WITH CHECK ADD  CONSTRAINT [Tài khoản] FOREIGN KEY([tour_id])
REFERENCES [dbo].[tour] ([tour_id])
GO
ALTER TABLE [dbo].[user_account] CHECK CONSTRAINT [Tài khoản]
GO
