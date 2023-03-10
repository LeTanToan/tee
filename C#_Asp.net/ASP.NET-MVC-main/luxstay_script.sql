USE [master]
GO
/****** Object:  Database [Luxstay]    Script Date: 3/29/2021 9:05:19 AM ******/
CREATE DATABASE [Luxstay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Luxstay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Luxstay.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Luxstay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Luxstay_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Luxstay] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Luxstay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Luxstay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Luxstay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Luxstay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Luxstay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Luxstay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Luxstay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Luxstay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Luxstay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Luxstay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Luxstay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Luxstay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Luxstay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Luxstay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Luxstay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Luxstay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Luxstay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Luxstay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Luxstay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Luxstay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Luxstay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Luxstay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Luxstay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Luxstay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Luxstay] SET  MULTI_USER 
GO
ALTER DATABASE [Luxstay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Luxstay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Luxstay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Luxstay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Luxstay] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Luxstay]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 3/29/2021 9:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[home_id] [int] NULL,
	[date_check_in] [date] NULL,
	[date_check_out] [date] NULL,
	[total_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Home]    Script Date: 3/29/2021 9:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home](
	[home_id] [int] IDENTITY(1,1) NOT NULL,
	[home_name] [nvarchar](max) NULL,
	[home_type] [nvarchar](max) NULL,
	[room_number] [int] NULL,
	[price] [int] NULL,
	[place_id] [varchar](20) NULL,
	[image_intro] [varchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[short_description] [nvarchar](max) NULL,
	[detail_description] [nvarchar](max) NULL,
	[restore] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[home_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images_Detail]    Script Date: 3/29/2021 9:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images_Detail](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[home_id] [int] NULL,
	[image_url] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 3/29/2021 9:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[place_id] [varchar](20) NOT NULL,
	[place_name] [nvarchar](max) NOT NULL,
	[image] [varchar](max) NULL,
	[total_home] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[place_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/29/2021 9:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](max) NULL,
	[phone] [varchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[password] [varchar](max) NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](max) NULL,
	[role] [varchar](max) NULL,
	[verify] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (2, 3, 5, CAST(N'2021-03-22' AS Date), CAST(N'2021-03-25' AS Date), 9300000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (3, 5, 5, CAST(N'2021-03-20' AS Date), CAST(N'2021-03-23' AS Date), 9300000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (4, 1, 2, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-21' AS Date), 4500000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (5, 3, 6, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-21' AS Date), 2400000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (55, 9, 17, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-18' AS Date), 720000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (56, 10, 56, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-20' AS Date), 4500000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (57, 10, 42, CAST(N'2021-03-23' AS Date), CAST(N'2021-03-25' AS Date), 1400000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (58, 10, 32, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-21' AS Date), 3750000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (59, 10, 53, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-20' AS Date), 7400000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (60, 3, 52, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-19' AS Date), 580000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (61, 3, 21, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-22' AS Date), 2970000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (63, 3, 1, CAST(N'2021-03-18' AS Date), CAST(N'2021-03-20' AS Date), 2400000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (64, 11, 1, CAST(N'2021-03-21' AS Date), CAST(N'2021-03-24' AS Date), 3600000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (65, 19, 39, CAST(N'2021-03-22' AS Date), CAST(N'2021-03-23' AS Date), 700000)
INSERT [dbo].[Booking] ([booking_id], [user_id], [home_id], [date_check_in], [date_check_out], [total_price]) VALUES (75, 24, 44, CAST(N'2021-03-25' AS Date), CAST(N'2021-03-27' AS Date), 6400000)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Home] ON 

INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (1, N'BOM HOMES', N'Căn hộ dịch vụ', 2, 1200000, N'HN', N'hn_can_ho_1.jpg', N'Cầu Giấy, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'·Vị trí rất đẹp và thuận tiện ở quận Cầu Giấy<br/><br/>·Gần công viên Cầu Giấy, Lotteria, trung tâm mua sắm với môi trường ngoài trời yên tĩnh<br/><br/>·Bạn hoàn toàn có thể trải nghiệm những dịch vụ cao cấp tại đây<br/><br/>·Căn hộ được thiết kế với nhiều lựa chọn bố trí hợp lý và được trang bị theo tiêu chuẩn cao cấp 4 sao với ban công riêng và cảnh quan đẹp<br/><br/>·Có nhiều dịch vụ tại chỗ khác nhau như giặt ủi, dịch vụ vệ sinh, Wi-Fi miễn phí tốc độ cao, an ninh 24/7<br/><br/>·Dịch vụ khách hàng đặc biệt được cung cấp', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (2, N'CANAVAS LUXURY', N'Căn hộ dịch vụ', 2, 900000, N'HN', N'hn_can_ho_2.jpg', N'Cầu Giấy, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 4 khách)', N'Nằm ở con đường tấp nập nhất quận Cầu Giấy, Canvas Apartments thuận tiện để di chuyển lên Trung tâm thành phố cũng như gần các khu văn phòng, trung tâm thương mại. <br/><br/> <br/><br/> Mong muốn mang lại sự thoải mái nhất cho khách hàng, chính vì vậy căn hộ của Canvas cung cấp đầy đủ các tiện nghi như Wifi miễn phí, bảo vệ 24/24, dịch vụ dọn phòng và giặt là. <br/><br/> <br/><br/> 2 loại căn hộ mà chúng tôi có: Căn hộ 1 phòng ngủ và căn hộ 2 phòng ngủ. <br/><br/> <br/><br/> Ngay tại tòa nhà của Canvas Apartments cũng có các phương tiện vui chơi giải trí để khách hàng không bao giờ cảm thấy nhàm chán như nhà hàng, phòng gym, siêu thị, Gaming Center.<br/><br/> Canvas Serviced Apartment là căn hộ lý tưởng cho khách hàng muốn tìm kiếm sự thoải mái cũng như thuận tiện. ', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (3, N'THE AUTUMN HOMESTAY', N'Homestay', 1, 810000, N'HN', N'hn_homestay_1.jpg', N'Ba Đình, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Căn phòng được thiết kế theo phong cách gần gũi với thiên nhiên, sự phối hợp nhẹ nhàng giữa các vật dụng và lối trang trí tạo nên nét độc đáo của nơi đây, bạn cũng sẽ tìm được không ít những góc selfie ấn tượng ^^ . <br /> <br /> Đến với The Autumn bạn sẽ còn được đắm mình trongkhông gian bar và rooftop với tầm nhìn 2 mặt panorama ôm trọn hồ Trúc Bạch, hồ Tây thơ mộng- Homestay hiếm hoi tại Hà Nội sở hữu góc view hồ đắt giá. <br /> <br /> Ngoài ra The Autumn còn có khu bếp, phòng ăn đủ đồ. Hai bạn có thể tự tay nấu cho nhau những món ăn ngon, cùng nghe nhạc, nhâm nhi tách cafe và cùng khám phá Vẻ đẹp Hà Nội bên hồ! <br /> <br /> Chào mừng bạn đến với The Autumn Homestay - cùng chúng tôi ghi lại những yêu thương của bạn!!! ', 0)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (4, N'ROSY 5 - POOL', N'Chung cư', 1, 650000, N'HN', N'hn_chung_cu_1.jpg', N'Nam Từ Liêm, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Vinhomes Green Bay là một thành phố sinh thái đầy cây và hoa.<br/><br/>Sân bay quốc tế Nội Bài là 40 phút (30km) bằng Grab / Taxi.<br/><br/>- Khu phố cổ: 30 phút di chuyển bằng ô tô<br/><br/>- Sân vận động quốc gia Mỹ Đình: 10 phút<br/><br/>Chúng tôi sẽ gửi mật mã vào nhà trước khi bạn check-in<br/><br/>', 0)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (5, N'THE ROYAL HOMIES', N'Studio', 1, 3100000, N'SG', N'sg_studio_1.jpg', N'Quận 7, Hồ Chí Minh, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'The Royal Homies - Phú Mỹ Hưng tọa lạc tại Nội khu Hưng Gia 1, phường Tân Phong, quận 7. Khu dân dư đông đúc, an ninh thắt chặt bởi đội ngủ bảo vệ Phú Mỹ Hưng. Trung tâm hành chính và tập trung nhiều khu vui chơi giải trí, nhà hàng, quán ăn, quán cà phê, siêu thị, chợ, trung tâm mua sắm, thương mại, cách Trung tâm Hội nghị và Triển lãm Sài Gòn 1,3 km. Nơi lưu trú có tiện nghi nhà hàng phục vụ món ăn và thức uống có trong thực đơn, quầy lễ tân làm việc 24 giờ và dịch vụ phòng đến 15 giờ chiều mỗi ngày, WiFi được lắp đặt có thể sử dụng miễn phí trong toàn bộ khuôn viên.<br/><br/>Tất cả các phòng được trang bị máy lạnh, lò vi sóng, bếp nấu ăn riêng từng phòng, tủ lạnh, ấm đun nước, chậu vệ sinh, máy sấy tóc và bàn làm việc. Tại các phòng của khách sạn được trang bị tủ quần áo, TV màn hình phẳng và phòng tắm riêng biệt.Tất cả các phòng điều có cửa sổ và tầm nhìn hướng đường phố và công viên, sân vườn<br/><br/>Du khách có thể thuê xe máy và xe hơi có tài xế tại chỗ nghỉ.<br/><br/>Bến Nhà Rồng và Bảo tàng Mỹ thuật đều nằm trong bán kính 7 km. Sân bay gần nhất là sân bay quốc tế Tân Sơn Nhất, cách đó 12 km, và khách sạn căn hộ này cung cấp dịch vụ đưa đón sân bay với một khoản phụ phí.<br/><br/>Chúng tôi sử dụng ngôn ngữ của bạn!', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (6, N'SAIGON DWELLING', N'Studio', 1, 600000, N'SG', N'sg_studio_2.jpg', N'Phú Nhuận, Hồ Chí Minh, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 3 giường · 3 phòng ngủ · 6 khách (tối đa 7 khách)', N'Chỗ ở của chúng tôi nằm trên tầng 24. Với đầy đủ nội thất, hoàn toàn riêng tư, yên tĩnh và an toàn.Có thể chứa tới 6 người, lý tưởng cho khách doanh nhân, gia đình (có trẻ em và người già) hoặc một nhóm bạn.<br/><br/>- Phòng ngủ: 3 phòng ngủ có giường cỡ king / giường cỡ queen, khăn trải giường và khăn tắm mới được cung cấp hàng ngày. Két sắt, bàn trang điểm, tủ quần áo, móc treo quần áo,...<br/><br/>- Phòng khách: ti vi LCD, giường sofa và ban công có tầm nhìn tuyệt vời ra toàn cảnh thành phố<br/><br/>- Phòng tắm: vòi hoa sen, nước nóng, khăn tắm, giấy vệ sinh, xà phòng, xà phòng rửa tay, dầu gội và bộ vòi sen đều được cung cấp<br/><br/>- Không gian bếp: tủ lạnh lớn, lò vi sóng, bếp, ấm đun nước cùng với dụng cụ nấu ăn, bộ bữa tối đầy đủ và ly<br/><br/>- Phòng giặt: máy giặt, năng lượng giặt và giá treo quần áo ngoài trời', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (7, N'VIETLIFE''S CULTURE JOURNEY', N'Căn hộ dịch vụ', 1, 1000000, N'SG', N'sg_can_ho_1.jpg', N'Quận 7, Hồ Chí Minh, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Một khu phước hợp với thiết kế ấn tượng mang đậm đà bản sắc dân tộc Việt kết hợp hài hoà với nội thất sang trọng cùng các tiện ích như phòng chiếu film, phòng làm việc chung, phòng thiền, nhà hàng, thư viện nằm tại khu dân cư đa văn hoá Phú Mỹ Hưng, khu vực trung tâm quận 7<br/><br/>Trung tâm mua sắm Crescent Mall: bạn có thể tận hưởng mua sắm với nhiều cửa hàng thời trang. Nó có một khu ẩm thực lớn (tầng 5) để phục vụ khẩu vị của bạn với khẩu vị khác biệt. Có một rạp chiếu phim CGV, tại tầng 5 để bạn giải trí. Siêu thị nằm ở tầng hầm<br/><br/>Trung tâm Hội nghị & Triển lãm Sài Gòn - SECC<br/><br/>Bệnh viện FV : là một trong những cơ sở chăm sóc sức khỏe hàng đầu và được quốc tế công nhận của Việt Nam: một bệnh viện hiện đại, một cửa hoàn chỉnh với tiêu chuẩn quốc tế cao nhất, có trụ sở tại Thành phố Hồ Chí Minh.<br/><br/>Lottemart: Thành phố mặt trời mọc đối diện với Lottemart, rất tốt để bạn ăn tại Khu ẩm thực ở Tầng 3 và mua trái cây hoặc đi mua sắm. Có một rạp chiếu phim, Rạp chiếu phim Lotte, tại tầng 5 để bạn giải trí.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (8, N'STAY & FUN No.1', N'Studio', 1, 800000, N'SG', N'sg_studio_3.jpg', N'Quận 4, Hồ Chí Minh, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'- Homestay chúng mình nằm ngay điểm giao giữa Q1 và Q4, sát bên cầu Khánh Hội và Calmette<br/><br/>- Nhà có đầy đủ các tiện nghi như TV có kết nối Internet và Netflix, bếp trang bị đủ đồ để bạn có thể nấu nướng cơ bản, bãi đỗ xe máy ngay bên tầng trệt.<br/><br/>- View phòng nhìn thẳng ra Landmark 81, ban đêm lên đèn rất chill nhé<br/><br/>- Ở nhà bọn mình, mọi người chỉ mất 5-10 phút để đi bộ ra Bitexco, phố đi bộ Nguyễn Huệ, bảo tàng Hồ Chí Minh, bảo tàng Mỹ Thuật thành phố<br/><br/>- Đặc biệt đi từ cầu Khánh Hội mọi người còn có thể ngắm hoàng hôn trên Bến Nhà Rồng, hoặc ghé Bến Bạch Đằng để du ngoạn sông Sài Gòn bằng bus trên sông<br/><br/>- Xung quanh khu vực nhà tụi mình có nhiều điểm ăn uống nổi tiếng, có thể đi bộ tới được luôn như: Bún Đậu Homemade, khu ẩm thực Vĩnh Khánh, xa một xíu có khu ẩm thực Chợ 200 Xóm Chiếu.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (9, N'NEO-CLASSIC CONDO', N'Chung cư', 2, 1750000, N'DN', N'dn_chung_cu_1.jpg', N'Sơn Trà, Đà Nẵng, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 6 khách)', N'- Neo-Classic cách trung tâm thành phố 15 phút di chuyển bằng xe máy<br/><br/>- Phòng khách là một không gian tuyệt đẹp với cửa sổ cao cao và đầy nắng<br/><br/>- Chỗ ở của chúng tôi có một giá sách và bàn làm việc cho bạn nếu bạn cần một nơi làm việc tiện lợi<br/><br/>- Được trang bị đầy đủ các tiện nghi hiện đại<br/><br/>Neo-Classic là nơi lý tưởng để bạn nghỉ ngơi, thiết kế với phong cách tân cổ điển, cùng 2 phòng ngủ lớn và nhà bếp. Rất gần với biển và các điểm tham quan du lịch nổi tiếng.<br/><br/>Chỉ mất 1 phút đi bộ đến bãi biển Phạm Văn Đồng và nhà hàng hải sản Bé Mặn, 10 phút đi bộ đến bãi biển Mỹ Khê. Hay mất 5 phút lái xe đến núi Khỉ và 10 phút lái xe đến trung tâm thành phố.<br/><br/>Chỗ ở của chúng tôi gồm 2 phòng ngủ có 2 giường cỡ King, thích hợp cho gia đình đi du lịch hoặc làm việc. Khách có thể sử dụng thiết bị nhà bếp để nấu ăn hàng ngày.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (11, N'THE MONARCHY ÐÀ N?NG', N'Chung cư', 2, 1100000, N'DN', N'dn_chung_cu_2.jpg', N'Sơn Trà, Đà Nẵng, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 2 giường · 2 phòng ngủ · 2 khách (tối đa 4 khách)', N'Căn hộ của chúng tôi có sân hiên, nhà bếp đầy đủ tiện nghi với lò vi sóng, lò sưởi, khu vực tiếp khách, TV màn hình LCD, máy giặt cũng như phòng tắm riêng với vòi sen và máy sấy tóc. Để thuận tiện hơn, khăn tắm và ga trải giường có thể được cung cấp với khoản phụ phí.<br/><br/>The Balcony Housing nằm cách bãi biển Mỹ Khê 2km, giữa cầu Trần Thị Lý và cầu Rồng. Sân bay gần nhất là Sân bay Quốc tế Đà Nẵng cách căn hộ khoảng 5km.<br/><br/>- Nhận/ trả phòng tự động;<br/><br/>- Quán cà phê ở tầng dưới với nhiều đồ uống đặc trưng;<br/><br/>- Cách nhiều siêu thị nhỏ vài bước chân.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (12, N'ICITY VILLA RIVERFRONT', N'Biệt thự', 5, 8500000, N'DN', N'dn_biet_thu_1.jpg', N'Ngũ Hành Sơn, Đà Nẵng, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Icity Villa Riverfront Danang nằm trong chuỗi biệt thự và khách sạn căn hộ 5 sao đã đưa vào vận hành khai thác bởi Icity Hotel Group, nằm trong chuỗi hệ thống các biệt thự và căn hộ dịch vụ chất lượng 5 sao trên khắp Việt Nam. Villa nằm tại Hải Châu, quận trung tâm của Thành phố Đà Nẵng, đối diện là sông Hàn thơ mộng, cách siêu thị Lotte và công viên Châu Á 1,2km, cách siêu thị Mega Market 500m.<br/><br/>Biệt thự có 1 phòng khách, 1 bếp, 1 bàn ăn rộng, 5 phòng ngủ, 4 phòng tắm và nhà vệ sinh, 1 sân thượng có tầm nhìn ra sông, 1 phòng giặt ủi. Biệt thự được thiết kế theo phong cách hiện đại và sang trọng. Căn biệt thự sử dụng chủ yếu các loại đá cẩm thạch và gỗ tự nhiên, nội thất sang trọng với thiết bị từ Đức và Nhật như bếp từ, tủ lạnh của Hafele, thiết bị vệ sinh Hansgrohe, hệ thống ánh sang chuẩn quốc tế 3000K, được thiết kế và bố trí khoa học giúp quý khách có cảm giác thật sự thư giãn. Bên ngoài có sân vườn và ban công khá rộng rãi phù hợp cho các nhóm công tác, du lịch, khách gia đình có con nhỏ.<br/><br/>Các dịch vụ hỗ trợ: Tour du lịch, thực phẩm khô và bia, rượu vang trắng và đỏ, thuê người nấu ăn dọn dẹp, thuê xe máy…<br/><br/>Chúng tôi còn cung cấp dịch vụ đón sân miễn phí cho khách đặt phòng với các loại xe thuộc dòng cao cấp như: Lexus, Mercedes, Dcar...', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (13, N'CLOUDY VIEW GARDEN', N'Biệt thự', 2, 3500000, N'HN', N'ddtivekfcee8B2z1vHlBm4nI.png', N'Ba Vì, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 10 giường · 2 phòng ngủ · 15 khách (tối đa 20 khách)', N'Với điểm nhấn là bể bơi hiện đại, có view ra đồi chè xanh mát, ngắm mây luồn qua núi. Hãy cùng bạn bè và người thân thưởng thức những bữa tiệc BBQ với bàn ăn ngoài trời độc đáo.<br/><br/>Vài điều về CLOUDY VIEW – Ba Vì:<br/><br/> Địa điểm: Ba Vì, cách Hà Nội khoảng 50 km<br/><br/>- Sức chứa: Tiêu chuẩn 15 người (nếu đóng phụ thu thì tối đa cả đoàn là 20 người)<br/><br/>Cơ sở vật chất:- 2 phòng ngủ có điều hòa hai chiều- 1 phòng ngủ tập thể có 4 đệm đôi- 1 phòng ngủ tập thể có 3 đệm đôi, 2 đệm đơn- 2 nhà vệ sinh- Bể bơi hiện đại, có view ra đồi chè- Phòng khách ấm cúng- Phòng bếp đầy đủ tiện nghi- Khu vực hồ câu cá- Không gian và bếp nướng BBQ ngoài trời- Sân vườn thoáng mát, rộng rãi- Hát Karaoke giải trí', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (14, N'KAIA RESIDENCE - PRIVATE', N'Studio', 1, 1140000, N'DN', N'pu35x3Sk2-W9OEKa64rfevLG.jpg', N'Hải Châu, Đà Nẵng, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Ẩn mình trong một thung lũng yên tĩnh ở trung tâm Đà Nẵng, ẩn sau một khu vườn yên tĩnh thuần khiết, The Kaia Residence, một nơi lưu trú được thiết kế cá nhân hóa cao chỉ với 10 căn hộ, là một lời nhắc nhở không ngừng về vẻ đẹp của kiến ​​trúc hiện đại thế kỷ 20.<br/><br/>Trọng tâm chính của thiết kế là bảo tồn tất cả các kiến ​​trúc ban đầu của biệt thự Grandpa của chúng tôi được xây dựng vào những năm 1960, bắt đầu từ sân thượng đến cửa sổ sắt và tất cả các cây ăn quả trong vườn, mang lại cảm giác hoài cổ, cảm giác những ngày xưa tốt đẹp, đến với cư dân.<br/><br/>Mỗi phòng đều có ban công riêng, nhìn ra khung cảnh vườn xanh, nhà bếp được trang bị tốt và bàn viết tùy chỉnh kết hợp với nhiều loại ghế bành và ghế sofa, mang đến không gian sống thư giãn nhưng ấm cúng như ở nhà.<br/><br/>Ánh sáng được thiết lập và màn hình nội thất tùy chỉnh mang đến cảm giác ấm áp đặc biệt của tình yêu, đến từ tất cả những ký ức về phông chữ của Ông nội thân yêu nhất của chúng ta.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (15, N'QHOME D''E.LI DORADO', N'Studio', 1, 1100000, N'HN', N'69ad8ebe05e3fdbda4f2.jpg', N'Tây Hồ, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Căn hộ tọa lạc ở tầng 17 tòa D''El Dorado Premium Phú thượng, 1 tổ hợp căn hộ với các dịch vu thu phí như bể bơi, gym, spa. Căn hộ nhìn ra Hồ tây thơ mộng và được trang bị nội thất hiện đại mang lại cho quý khách cảm giác thư giản khi trải nghiệm tại Qhome.<br/><br/>Căn hộ phù hợp cho quý khách lưu trú trong chuyến công tác tại Hà Nội hay những khách hàng mong muốn có 1 nơi thư giản, thay đổi không khí với người thương.<br/><br/>Từ D.''El Dorado, bạn có thể thả bộ đi dạo ven Hồ Tây, thưởng thức các món ăn vặt nổi tiếng ở Tây Hồ và thăm thú,chơi đùa tại công viên nước Hồ tây hoặc ghi lại các khoảng khắc tại thung lũng hoa.<br/><br/>Căn hộ được trang bị máy pha cafe, bếp, lò vi sóng, smart ti vi, tủ lạnh...<br/><br/>Qhome mong muốn mang lại cho quý khách 1 trải nghiệm tuyệt vời, vì vậy đừng ngần ngại khi đặt căn hộ của chúng tôi.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (16, N'STUDIO BOME MITS', N'Homestay', 1, 550000, N'HN', N'lFDKeJtJazl6FduCnObQqXwf.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Căn studio biệt lập tại số 4 Hàm long, căn hộ nằm trên tầng 4, nhiều ánh sáng.<br/><br/>Rộng 40m2, ban công rộng , view đẹp<br/><br/>Yên tĩnh
,
TV netflix,

máy giặt riêng,

Bếp từ
,
đồ bếp , bát đũa nồi chảo', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (17, N'LUX STUDIO RESORT', N'Studio', 1, 720000, N'HN', N'room_31435_50_1567267574.jpg', N'Nam Từ Liêm, Hà Nội, Vietnam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Lấy cảm hứng từ vịnh, Vinhomes Greenbay được kiến tạo để trở thành thiên đường sống đích thực dành riêng cho quý khách yêu cuộc sống xanh và cuộc sống sang để tận hưởng trọn vẹn giá trị cuộc sống.<br/><br/>Tọa lạc ở ngay cửa ngõ khu vực hành chính của thủ đô, đối diện Trung tâm hội nghị quốc gia Mỹ đình, Vinhomes Greenbay được ví như Vịnh xanh trong lòng phố để mỗi ngày quý khách được sống trong môi trường sinh thái tràn ngập sắc xanh cùng với hệ thống tiện ích đẳng cấp, dịch vụ tiêu chuẩn 5 sao ivà cảm nhận cuộc sống sôi động giữa trung tâm nhộn nhịp.

<br/><br/>Từ Amy Luxstudio - Vinhomes Greenbay quý khách chỉ bước một bước là tới muôn nơi, nhịp sống năng động ở ngay thềm nhà: shophouse, cửa hàng tiện ích, cafe, hiệu thuốc, .....<br/><br/>- 3 PHÚT tới " Little Seoul" Trung Hòa Nhân Chính<br/><br/>- 5 PHÚT tới Bảo tàng Hà Nội/ Kangnam Landmark<br/><br/>- 10 PHÚT tới Lăng Bác<br/><br/>- 15 PHÚT tới hồ Hoàn Kiếm<br/><br/>- 20 PHÚT tới Sân bay Nội Bài', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (18, N'22HOUSING 81 LINH LANG', N'Căn hộ dịch vụ', 2, 680000, N'HN', N'5L3W_EU0AOwBYBC_LnVnSFXK.jpg', N'Ba Đình, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Căn hộ của chúng tôi được đặt tại Mặt phố Linh Lang, ba đình Hà Nội. Căn hộ rộng 55m2, full đồ đạc được thiết kế hiện đại và theo phòng cách của nhật bản.<br/><br/>Xung quanh có rất nhiều nhà hàng và quán cafe, siêu thị, cirlce, siêu thị Vinmart<br/><br/>Bên cạnh đó, tôi cũng là một ngườivô cùng thân thiện và thoải mái. Chính vì vậy đừng ngại ngần mà chia sẻ với chúng tôi những điều bạn đang thắc mắc hoặc những khó khăn bạn gặp phải khi ở đây.<br/><br/>Chúng tôi cũng luôn mong muốn được cùng bạn khám phá nhiều địa điểm tốt đẹp nhất tại đây.<br/><br/>Vậy còn chần chừ gì nữa ngay bây giờ hãy lên kế hoạch để tận hưởng những khoảnh khắc tuyệt vời cùng nhau.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (19, N'MOON WEST LAKE SERVICE', N'Căn hộ dịch vụ', 1, 1000000, N'HN', N'room_30353_28_1566371260.jpg', N'Tây Hồ, Hà Nội, Vietnam ', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Khu căn hộ dịch vụ cao cấp bên bờ Hồ Tây yên tĩnh<br/><br/>Cách trung tâm Hà Nọi 4km về phía Tây
Khung cảnh thơ mộng bên bờ Hồ Tây
Trang thiết bị hiện đại, sang trọng
Cách sân bay Nội Bài chỉ 20 phút xe hơi
Quý khách sẽ cảm nhận được không khí trong lành từ ngoài ô cửa sổ hay trên ban công căn hộ, với cảnh sắc tươi mát của những hàng cây xanh kế bên khu căn hộ.<br/><br/>Chúng tôi là những người bản địa vô cùng thân thiện và thoải mái. Chính vì vậy đừng ngại ngần mà chia sẻ với chúng tôi những điều bạn đang thắc mắc hoặc những khó khăn bạn gặp phải khi ở đây.<br/><br/>Bên cạnh đó chúng tôi cũng luôn mong muốn được cùng bạn khám phá nhiều địa điểm tốt đẹp nhất tại đây.<br/><br/>MOON West Lake Serviced Apartment là dành riêng cho bạn!', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (20, N'S. CAMELLIA 7_MANAGED', N'Căn hộ dịch vụ', 2, 950000, N'DN', N'room_24829_18_1557643916.jpg', N'Ngũ Hành Sơn, Đà Nẵng, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 6 khách)', N'S. Camellia 7 có diện tích 70m2 gồm phòng khách, bếp, phòng ngủ và không gian làm việc. Với thiết kế hiện đại và gu thẩm mỹ tinh tế dễ dàng gây thiện cảm cho người nhìn. Đầy đủ trang thiết bị tiện nghi, hiện đại, sẽ giúp các bạn sẽ cảm thấy thoải mái như ở nhà:<br/><br/>- Ghế sofa, tủ quần áo, bàn làm việc<br/><br/>- Bếp có lò vi sóng, tủ lạnh, bếp nấu, ấm siêu tốc, đồ bếp<br/><br/>- Khu vực phòng ăn, bàn ăn<br/><br/>- Nhà tắm và vệ sinh chung, vòi sen, máy sấy tóc<br/><br/>- Wifi miễn phí, chỗ để xe miễn phí<br/><br/>S. Camellia 7 nằm ở vị trí khá tốt gần bãi biển Mỹ Khê xinh đẹp, 10 phút xe máy là vào trung tâm thành phố. Xung quanh khá nhiều nhà hàng, quán cà phê, spa, chợ,...Chỗ ở của chúng tôi thực sự là điểm đến lý tưởng của nhiều du khách.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (21, N'999 CONDOTEL', N'Căn hộ dịch vụ', 2, 990000, N'NT', N'room_27965_19_1567515071.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 6 khách)', N'999 Condotel toạ lạc tại khu bãi biển Phạm Văn Đồng là Căn hộ cao cấp có tầm nhìn ra biển bao gồm 2 phòng ngủ, 2 phòng tắm, ban công , phòng khách, một gian bếp đầy đủ tiện nghi để nấu nướng...Tất cả căn hộ đều trang bị Smart TV màn hình phẳng, Wifi miễn phí, bếp từ, tủ lạnh cỡ lớn, lò vi sóng, máy giặt, máy sấy, bàn ủi và đầy đủ thiết bị vệ sinh cá nhân...<br/><br/>- Chỗ nghỉ cách bờ biển chỉ 100m, địa danh Hòn Chồng 500m, Tháp Bà Ponagar 1,3km, tắm bùn i-resort 2km, chợ đầm 2,4km...<br/><br/>- Khuôn viên 999 Condotel thoáng đãng mát mẽ . Bạn có thể tản bộ ngắm nhìn đường phố và bãi biển danh tiếng Hòn Chồng. Tha hồ trải nghiệm các quán ăn, nhà hàng, cà phê, spa, siêu thị 24h tại tầng trệt,...<br/><br/>- Quý khách nghỉ dưỡng tại 999 Condotel có thể thưởng thức Buffet sáng lên tới 100 món với giá chỉ từ 100.000đ, chúng tôi cung cấp dịch vụ cho thuê xe máy, xe đưa đón sân bay, tour du lịch giá rẻ...<br/><br/>- Với thiết kế không gian sang trọng và nội thất cao cấp mang phong cách Châu Âu, các căn hộ của chúng tôi sẽ đem đến sự thoải mái nhẹ nhàng giúp bạn có một giấc ngủ ngon sau một ngày dài làm việc, giải trí...<br/><br/>- Chỗ nghỉ chúng tôi phù hợp cho tất cả mọi người, gia đình và nhất là các cặp đôi.<br/><br/>', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (22, N'SCENIA BAY RESIDENCES', N'Căn hộ dịch vụ', 2, 1900000, N'NT', N'SBR---2-BEDROOM-APT-02.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 6 khách)', N'Scenia Bay Residences do tập đoàn InVision Hospitality quản lý nằm trong tổ hợp tòa nhà Scenia Bay Nha Trang sát biển có bốn mặt tiền hướng ra các tuyến đường: Phạm Văn Đồng, Nguyễn Biểu, Phạm Ngọc Thạch, Sao Biển, gồm Trung tâm thương mại & dịch vụ, Khách sạn GLOW Scenia Bay tầm cỡ 5 sao và Khu căn hộ Scenia Bay Residences.<br/><br/>Căn hộ rộng 73 m2 gồm 02 phòng ngủ, mỗi phòng đều có giường cỡ Queen và tầm nhìn tuyệt đẹp ra Vịnh Nha Trang và núi Cô Tiên. Thiết kế hiện đại, nhiều ánh sáng tự nhiên và nhà bếp được trang bị đầy đủ giúp căn hộ này trở thành sự lựa chọn hoàn hảo cho kỳ nghỉ gia đình.<br/><br/>Tiện nghi:<br/><br/>- Ban công riêng, hướng biển hoặc núi Cô Tiên<br/><br/>- Phòng bếp đầy đủ tiện nghi gồm tủ lạnh, lò vi sóng, máy nướng bánh mì, nồi cơm điện và các tiện nghi hiện đại khác.<br/><br/>- Dịch vụ dọn phòng hằng ngày miễn phí<br/><br/>- Kết nối Wi-Fi miễn phí<br/><br/>- Smart TV 50''''', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (23, N'HOMESTAY CITY CENTER', N'Homestay', 5, 2200000, N'NT', N'mIrJL8Jo3x7cjuqmhAGilSbY.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'P H O Homestay nằm ở đường Tuệ Tĩnh, cách biển chỉ 5ph đi bộ. Vị trí trung tâm thành phố luôn nên bạn khỏi lăn tăn là cách trung tâm bao xa nhe hihi.<br/><br/>Ngoài ra những còn đường xung quanh có rất nhiều cửa hàng ăn uống, cửa hàng tiện lợi hay trung tâm mua sắm. Sát sàn sạt là Bệnh viện quân y 87 và công an thành phố cho nên độ an ninh cực kì cao nha.<br/><br/>Tuy P H O nằm trong hẻm nhưng rất dễ tìm và xe khách giường nằm vẫn có thể vào được luôn nhé. Phía trước nhà đường xá rộng rãi và thoáng mát nên cũng có chỗ đậu oto ngoài trời nè.<br/><br/>Loanh quanh khu vực lân cận và đường xá bây giờ thì vào nhà ha Nhà mình bao gồm:<br/><br/>Phòng ngủ: 5 phòng ngủ - 7 giường (5 giường đôi, 2 giường đơn)<br/><br/>Tất cả phòng ngủ đều có toilet riêng, được chuẩn bị khăn, bàn chải, kem đánh răng, sữa tắm và dầu gội. Máy sấy tóc, bàn ủi và tủ lạnh.<br/><br/>Bếp: lò vi sóng, bếp ga, xoong nồi, chén bát, ấm siêu tốc. Có máy giặt.<br/><br/>Khu vực tiếp khách sinh hoạt chung, sân vườn rộng rãi. Máy uống nước nóng lạnh. Có dụng cụ để nướng BBQ', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (27, N'SCV1-BIG VILLA', N'Biệt thự', 5, 6000000, N'DN', N'room_41267_1_1576765230.jpg', N'Ngũ Hành Sơn, Đà Nẵng, Việt Nam', N'Nguyên căn · 5 Phòng tắm · 8 giường · 5 phòng ngủ · 10 khách (tối đa 15 khách)


', N'Biệt thự Song Cat nằm ở khu vực khá yên tĩnh của Đà Nẵng. Biệt thự gồm 5 phòng ngủ, hồ bơi riêng, phòng trẻ em, phòng giải trí với bi lắc và phóng phi tiêu. Không gian bếp với kiến trúc sang trọng và rộng rãi lại đầy đủ đồ dùng bếp, nơi bạn có thể chuẩn bị những món ăn ngon cho gia đình và người thân. Khu vực hồ bơi thoáng đãng nơi bạn có thể tổ chức tiệc BBQ.<br/><br/>Bên cạnh đó, tôi cũng là một người bản địa vô cùng thân thiện và thoải mái. Chính vì vậy đừng ngại ngần mà chia sẻ với chúng tôi những điều bạn đang thắc mắc hoặc những khó khăn bạn gặp phải khi ở đây.<br/><br/>Chúng tôi cũng luôn mong muốn được cùng bạn khám phá nhiều địa điểm tốt đẹp nhất tại đây.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (29, N'MOON LINGHT HOUSE', N'Chung cư', 1, 500000, N'NT', N'1529485856_7da8cd9e7dc39c9dc5d2 (1).jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 7 khách)', N'Tiện nghi của khu phức hợp: bể bơi, gym khu vui chơi trẻ em, spa<br/><br/>Nội thất cao cấp: sàn gỗ cứng, quầy đá cẩm thạch, ghế sofa da<br/><br/>Thiết bị công nghệ cao: wifi Google, rèm tự động, đèn đổi màu<br/><br/>Xung quanh: nhiều nhà hàng, quán cà phê, quán ăn nhỏ, bar, pub...<br/><br/>Gần chùa Trần Quốc, Phú Tây Hồ, Lăng Hồ Chí Minh, 10 phút vào Phố Cổ', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (30, N'VIEVID 2 SEAVIEW', N'Studio', 1, 900000, N'NT', N'room_12758_482_1564117373.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 5 khách)', N'Ẩn mình trong một thung lũng yên tĩnh ở trung tâm Đà Nẵng, ẩn sau một khu vườn yên tĩnh thuần khiết, The Kaia Residence, một nơi lưu trú được thiết kế cá nhân hóa cao chỉ với 10 căn hộ, là một lời nhắc nhở không ngừng về vẻ đẹp của kiến ​​trúc hiện đại thế kỷ 20.<br/><br/>Trọng tâm chính của thiết kế là bảo tồn tất cả các kiến ​​trúc ban đầu của biệt thự Grandpa của chúng tôi được xây dựng vào những năm 1960, bắt đầu từ sân thượng đến cửa sổ sắt và tất cả các cây ăn quả trong vườn, mang lại cảm giác hoài cổ, cảm giác những ngày xưa tốt đẹp, đến với cư dân.<br/><br/>Mỗi phòng đều có ban công riêng, nhìn ra khung cảnh vườn xanh, nhà bếp được trang bị tốt và bàn viết tùy chỉnh kết hợp với nhiều loại ghế bành và ghế sofa, mang đến không gian sống thư giãn nhưng ấm cúng như ở nhà.<br/><br/>Ánh sáng được thiết lập và màn hình nội thất tùy chỉnh mang đến cảm giác ấm áp đặc biệt của tình yêu, đến từ tất cả những ký ức về phông chữ của Ông nội thân yêu nhất của chúng ta.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (32, N'KEMKAY OLD QUARTER CITY', N'Homestay', 3, 1250000, N'HN', N'PyxpGwY5p0vr3OjVWCnhrntQ.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 6 giường · 3 phòng ngủ · 4 khách (tối đa 12 khách)', N'A 100 square meter - entire Apartment with 6 king beds , 2 sofas , very nearby Hoan Kiem Lake . KemKay Old quarter is situated in a historical apartment buiding which is built since French war. The house uses natural daylight with a large skylight. The entrance is a short alley what is a feature of houses in Old Quarter area. .Nestled within the Old Quarter on Hang Be Street, it can''t get any more better than this', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (33, N'TRIBAL VIBES ROOM', N'Studio', 1, 2000000, N'HN', N'1534997084_37238890_279165439310087_7784575928478203904_o.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Hà Nội nổi tiếng với nhiều nhà hàng tuyệt vời, quán cà phê và những nơi khác giấu trong các con hẻm nhỏ. Phía sau các cửa hàng hoặc trên các con phố nhỏ của khu phố cổ.<br/><br/>Đây là một phần của cuộc sống ở Hà Nội. Vì vậy, nếu bạn muốn trải nghiệm Hà Nội thực sự và sống như một người Hà Nội thì Tribal Vibes Room là nơi phù hợp cho các cặp đôi!<br/><br/>Đi qua một lối vào nhỏ vào một con hẻm nhỏ điển hình của Hà Nội và khám phá một thế giới hoàn toàn mới. Tách biệt, riêng tư, yên tĩnh và chỉ cách một quãng ngắn từ cuộc sống sôi động của Khu Phố Cổ.<br/><br/>Chúng tôi tin rằng chỗ ở của chúng tôi được thiết kế theo phong cách hoang dã của châu Âu. Sẽ mang đến cho bạn một cảm giác hoàn toàm mới lạ.<br/><br/>Mỗi phòng đều được trang trí khác nhau với những bức tranh động vật, họa tiết bộ lạc và màu nâu nhạt. Tất cả đều được làm bằng vật liệu tự nhiên từ khắp nơi trên Việt Nam. Chúng tôi hy vọng rằng sẽ thêm một sự rung cảm đặc biệt cho chuyến đi của bạn và sẽ có một chuyến đi không giống bất cứ một ai.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (34, N'SAZIHOME STUDIO', N'Studio', 1, 690000, N'HN', N'RxdTs0izzR8_Yw2XWGLg6hxO.png', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'- Vị trí: trung tâm của Hà Nội - đối diện nhà hát lớn và chỉ mất 50 mét từ hồ Hoàn Kiếm. Chỗ ở của chúng tôi nằm trong một khu vực tốt với nhiều nhà hàng, quán bar và quán cà phê xung quanh nó. Điểm hoàn hảo để khám phá trung tâm của Old Town.<br/><br/>- Khu vực khá hoàn hảo bởi cửa cách âm thanh hoàn hảo: luôn khiến bạn ngủ sâu<br/><br/>- Giường cỡ Queen với nệm thoải mái, bộ khăn trải giường bằng vải cotton Ai Cập 100%. Tương ứng tiêu chuẩn khách sạn 5 sao.<br/><br/>Chúng tôi sẽ gửi Hướng dẫn với thông tin hữu ích về địa điểm / thực phẩm Khuyến nghị cho khách được xác nhận. Bạn sẽ cảm thấy thoải mái và dễ dàng hơn để khám phá Hà Nội.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (35, N'THE BLOOM HANOI', N'Căn hộ dịch vụ', 1, 850000, N'HN', N'pyCouuOP98IWwEnvnNqdMAti.png', N'Cầu Giấy, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Căn hộ rộng tới 43m2 có phòng ngủ và khu vực phòng khách, bàn ăn, bếp riêng biệt, phòng tắm có bồn tắm xinh xắn. Đặc biệt, phòng khách còn dẫn ra một ban công rộng rãi nhìn ra con đường Dịch Vọng Hậu tấp nập của quận Cầu Giấy.<br/><br/>Nếu bạn muốn tự chuẩn bị cho bạn những món ăn phù hợp với khẩu vị thì The Bloom Hà Nội chính là một lựa chọn hoàn hảo. Khu vực bếp của căn hộ được trang bị bếp từ an toàn, lò vi sóng, tủ lạnh lớn cùng bộ dụng cụ nấu ăn, chén đĩa đầy đủ cho gia đình. Ngoài ra, khu vực xung quanh khách sạn tập trung rất nhiều nhà hàng, quán ăn Âu, Á, Việt...<br/><br/>Lựa chọn The Bloom, bạn sẽ không phải lo tới khoản phí giặt là đắt đỏ khi chúng tôi hỗ trợ giặt là mỗi ngày 5 món đồ miễn phí cho mỗi khách.<br/><br/>Nằm trong trung tâm kinh tế của Hà Nội, từ đây bạn có thể dễ dàng đi tới sân bay Tân Sơn Nhất, bến xe Mỹ Đình...', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (36, N'LII''S HOMESTAY', N'Homestay', 1, 1200000, N'HN', N'BXSWxc8JJfPItWkkKpNpwqMf.jpg', N'Tây Hồ, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Lii''s Homestay là 1 homestay nằm ở giữa lòng thủ đô Hà Nội ngay sát Hồ tây. Lii''s Homestay hướng tới yếu tố thiên nhiên trong quộc sống, chúng tôi luôn chăm chút từng decor nhỏ nhất trong phòng. Chúng tôi chăm sóc khác hàng của mình như những người trong gia đình. Lii''s Homestay rất yên tĩnh . Chỉ với 5 phút đi là các bạn sẽ tới được Hồ Tây. Hãy đến với chúng tôi ngay hôm nay', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (37, N'DELUXE VIEW HOTAY', N'Chung cư', 1, 1600000, N'HN', N'room_69292_1_1583392102.jpg', N'Tây Hồ, Hà Nội, Việt Nam', N'Nguyên căn · 3 Phòng tắm · 2 giường · 2 phòng ngủ · 2 khách (tối đa 5 khách)', N'Tiện nghi của khu phức hợp: bể bơi, gym khu vui chơi trẻ em, spa<br/><br/>Nội thất cao cấp: sàn gỗ cứng, quầy đá cẩm thạch, ghế sofa da<br/><br/>Thiết bị công nghệ cao: wifi Google, rèm tự động, đèn đổi màu<br/><br/>Xung quanh: nhiều nhà hàng, quán cà phê, quán ăn nhỏ, bar, pub...<br/><br/>Gần chùa Trần Quốc, Phú Tây Hồ, Lăng Hồ Chí Minh, 10 phút vào Phố Cổ', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (39, N'NATURALLIGHT HOMESTAY', N'Homestay', 1, 700000, N'HN', N'5KWOSZvid66wXAqUqmITfiQb.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Căn phòng theo phong cách minimalism, được chúng mình cẩn thận chăm chút từng chi tiết nhỏ nhất. Phòng có đầy đủ các trang thiết bị, vật dụng thiết yếu nhất có thể đáp ứng được nhu cầu của cả các khách hàng khó tính. Với nhiều năm kinh nghiệm làm việc ở khách sạn cao cấp, Luustay tự tin rằng có thể mang đến cho các bạn những trải nghiệm tốt nhất.<br/>• Phòng 25 mét vuông trên tầng 2<br/><br/>• Máy giặt & máy sấy miễn phí<br/><br/>• Nhà bếp đầy đủ vật dụng & được trang bị mới hoàn toàn<br/><br/>• 5 phút đi bộ đến Khu Phố Cổ và 10 phút đi bộ đến Hồ Hoàn Kiếm, nằm ngay trung tâm Chợ Đồng Xuân<br/><br/>', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (42, N'VIP ROOM - COUPLE ONLY', N'Căn hộ dịch vụ', 1, 700000, N'DN', N'YKfdIRrsyeu-cD9MQ--xjpil.jfif', N'Hải Châu, Đà Nẵng, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)


', N'? Quy trình thông minh đặt và chọn phòng chỉ bằng 1 chạm qua máy tính bảng hiện đại và tiện lợi tại Lễ tân, thiết bị "có một không hai" chỉ có tại Lotus<br/><br/>? Nhiều lựa chọn cho cảm xúc với 4 loại phòng phù hợp với túi tiền : Standard, Superior, VIP, LUXURY.<br/><br/>? Không gian siêu lãng mạn để "tình bể bình" cho các cặp đôi thỏa sức thăng hoa cùng với mọi cung bậc tình yêu.<br/><br/>? 12 phòng từ phong cách Hongkong đỏ rực nóng bỏng, Phòng Nhật Bản ma mị chuyên nghiệp, Phòng Ba Tư Địa Trung Hải thanh tao quyến rũ, hoặc phòng Nest Bird trang bị Lồng Chim khổng lồ úp trọn đôi uyên ương trên giường tròn, hay lạc vào một khu rừng nhiệt đới ngay trong phòng với phòng Luxury Tropical... v.v...<br/><br/>? Quý khách sẽ được nhận ngay Voucher GIẢM GIÁ 50% cho lần thứ 6 sử dụng dịch vụ tại khách sạn.<br/><br/>? Ngoài ra, bạn sẽ được tận hưởng cảm giác siêu lãng mạn và nồng ấm tại với dịch vụ set up & trang trí trọn gói cho các lễ kỷ niệm tình yêu, sinh nhật, chụp ảnh cưới,...<br/><br/>Hãy đến và thả mình vào một không gian tình yêu ngọt ngào bất tận ngay hôm nay! Dịch vụ tận tình, chuyên nghiệp 24/24.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (43, N'2BR BALCONY SEAVIEW', N'Chung cư', 1, 690000, N'DN', N'Heq1u_tUDQz2PXbkdSV5H7EB.jpg', N'Ngũ Hành Sơn, Đà Nẵng, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 7 khách)', N'WINNIE CONDO (24/7 support) will provide the best experience for you when traveling to Da Nang with 67sqm luxurious condo for Young Family/Friends, equipped with Essential amenities, WIFI & ACs. Our location is SUPER, just 1 min walk to MY KHE BEACH, with many bars, cafes and restaurants nearby.<br/><br/>This apartment is on the 【36th floor】 of a high apartment building with a view of the beach from Balcony and the best location in Danang city because it is just 60 meters away from one of the most beautiful beaches on the planet, My Khe, which gives you a stunning and breath-taking Sea view, Sky view and City view every morning when you wake up.<br/><br/>WINNIE CONDO includes 2 private bedrooms, 1 private Bathrooms, 1 kitchen, 1 balcony and a laundry area. This apartment can accommodate from 4 to 7 people, but if your group has more than 7 people, you are still welcome, there is 【no extra fee】. Extra pillows, blankets and', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (44, N'LOUIS & ANNIE VILLA', N'Biệt thự', 5, 3200000, N'NT', N'WiuK7WUDyrxvI7NHKJs--QNs.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 5 Phòng tắm · 7 giường · 5 phòng ngủ · 10 khách (tối đa 14 khách)', N'Toàn bộ ngôi nhà có tổng cộng 5 phòng ngủ với 3 giường lớn King size (1m8 x 2m) và 4 giường đôi (1m6 x 2m)<br/><br/>Tầng dưới gồm phòng khách, bếp lớn, khu vực ăn uống và 1 phòng ngủ.<br/><br/>Tầng trên là 4 phòng ngủ và khu ban công trải dài<br/><br/>Bao quanh nhà là khu vườn dài, khu vực nướng BBQ riêng và bàn ghế ăn ngoài trời, cà phê<br/><br/>Toàn bộ 5 phòng ngủ đều có phòng tắm riêng và 1 toilet riêng tại khu vực phòng khách.<br/><br/>Trang bị đầy đủ khăn tắm, khăn mặt, bàn chải đánh răng, sữa tắm, dầu gội, tăm bông.....<br/><br/>Khu vực bếp đầy đủ tiện nghi cho việc nấu nướng<br/><br/>Bãi biển riêng của khu biệt thự cách nhà 7 phút đi bộ.<br/><br/>Khu vực sát bên cạnh Bến cáp treo Vinpearl và Cảng du lịch Nha Trang, rất thuận tiện cho nhóm bạn, hoặc gia đình có nhu cầu đi chơi đảo, Vinpearl<br/><br/>Tại nhà có dịch vụ ký gửi bán vé tour tham quan đảo và các loại vé từ các văn phòng công ty Vinpearl, Hòn tằm... nên bạn không cần đi đâu xa và xếp hàng để mua vé, chỉ cần yêu cầu, nhân viên công ty sẽ đến tận nhà để giao vé với giá vé đúng theo niêm yết của các Công ty và khu vui chơi ( điểm này các bạn có thể tìm hiểu giá vé trên mạng trước nhé)', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (45, N'VIEVID 4 ARIYANA 4', N'Chung cư', 1, 1180000, N'NT', N'room_16410_30_1559036101.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 2 giường · 1 phòng ngủ · 4 khách (tối đa 4 khách)', N'- 35 km từ sân bay Cam Ranh (40 phút lái xe). Dịch vụ đón và trả khách tại sân bay có thể được bố trí theo yêu cầu. Phí: 12 $(ngày) hoặc 14 (đêm) / xe 4 chỗ / một chiều.<br/><br/>- Cách Ga Nha Trang 1,7 km<br/><br/>- 1,7 km từ Chợ Đầm<br/><br/>- 0,8 km đến Chợ Đêm<br/><br/>- Cách trung tâm thương mại Vincom Plaza 0,4 km<br/><br/>- 9 km đến Tháp Chàm Po Nagar (10 phút lái xe)<br/><br/>- Cách trạm cáp treo Vinpearl 9 km- Nhiều nhà hàng phục vụ ẩm thực chỉ nằm ở các tầng dưới của tòa nhà. và ... 6 phút đi bộ đến bãi biển<br/><br/>- Được trang bị 1 giường đôi cỡ King và 2 giường sofa, lý tưởng cho một cặp đôi hoặc một gia đình nhỏ (2 người lớn và 2 trẻ em) để trải nghiệm thời gian tốt nhất ở Nha Trang', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (46, N'RELAXING 2BR APARTMENT', N'Căn hộ dịch vụ', 2, 800000, N'NT', N'room_19279_7_1547003292.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 5 khách)', N'Tòa nhà nằm ngay trước biển Bãi Dương. Đối diện khu du lịch Hòn Chồng (1 địa điểm tham quan nổi tiếng ở Nha Trang), cách bãi du thuyền đầu tiên ở Nha Trang chỉ 2km<br/><br/>Chỗ nghỉ này cách bãi biển chỉ 1 phút đi bộ. Nằm cách khu du lịch Hòn Chồng ở Nha Trang 500m, căn hộ có sàn gỗ, 3 điều hòa, có Wi-Fi miễn phí và ban công rộng rãi. Bếp được thiết kế đầy đủ tiện nghi như ở nhà bao gồm đầy đủ các thiết bị nấu nướng, khách có thể nấu những bữa ăn thịnh soạn như ở nhà (bếp từ âm, máy hút mùi, lò vi sóng, nồi cơm điện, ấm siêu tốc, nồi inox, xoong, chảo, bát, đĩa, dao dĩa. Chợ Vĩnh Hải - chợ địa phương lớn nhất khu vực chỉ cách 1.5km có bán rất nhiểu hải sản, rau xanh, thực phẩm cần thiết rất rẻ và tươi.... Căn hộ cách Tháp Chàm PoNagar 1,2 km và có chỗ đỗ xe riêng ngay trong hầm .Chỗ nghỉ này có khu vực phòng ăn và bếp với 3 điều hòa, tủ lạnh, lò vi sóng, máy giặt và bếp nấu. TV màn hình phẳng cũng được trang bị trong phòng.<br/><br/>"Relaxing 2 BR Apartment with gateway to the Ocean" cách Chợ Đầm 2,4 km, Bảo tàng Alexandre Yersin 2,6 km và sân bay gần nhất là sân bay quốc tế Cam Ranh 40 km.<br/><br/>Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 10 cho kỳ nghỉ dành cho gia đình.<br/><br/>Relaxing 2 BR Apartment with gateway to the Ocean to the beach cũng được đánh giá là đáng giá tiền nhất ở Nha Trang! Khách sẽ tiết kiệm được nhiều hơn so với nghỉ tại những chỗ nghỉ khác ở thành phố này', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (47, N'SPLENDID SEAVIEW', N'Chung cư', 2, 1100000, N'NT', N'1515556490_IMG_6713.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 5 khách)', N'Thuộckhu căn hộ Mường Thanh Viễn Triều nằm ngay sát biển, chỉ mất khoảng 2 phút đi bộ đến bãi tắm Hòn Chồng, qua trung tâm thành phố chỉ mất 10 phút đi xe và 35 phút đến Sân bay quốc tế Cam Ranh. Căn hộ 2 phòng ngủ “Splendid Seaview” là sự lựa chọn hoàn hảo cho chuyến du lịch của bạn khi tới thành phố biển Nha Trang. Với thiết kế mặt hướng biển, lưng tựa núi bạn có thể ngắm nhìn khung cảnh tuyệt đẹp của Nha Trang:<br/><br/>Phía Đông: Mặt biển đường Phạm Văn Đồng, trước mặt là Hòn Chồng, Bãi Dương, từ hướng này có thể ngắm trọn vẹn Vịnh Nha Trang xinh đẹp kéo dài từ núi Cô Tiên đến cảng Cầu Đá.<br/><br/>Phía Nam: Mặt đường quy hoạch, từ vị trí này bạn có thể ngắm nhìn trung tâm thành phố, tháp bà Panagar<br/><br/>Phía Bắc: Mặt đường Hòn Chồng view nhìn núi Cô Tiên và khu đô thị mới phía Bắc thành phố<br/><br/>Căn hộ với thiết kế hiện đại và nội thất được bài trí hợp lý khiến không gian của căn hộ được tối ưu. Không gian bếp được trang bị với những đồ dùng thiết yếu cho một gia đình, bạn sẽ dễ dàng trổ tài nấu nướng những thực phẩm biển tươi ngay tại căn bếp này.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (48, N'VINTAGE TWO BEDROOM', N'Chung cư', 2, 580000, N'NT', N'3thc2n1bIgUNaf2OB5sI7cYz.jpg', N'Nha Trang, Khánh Hòa, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 4 khách)


', N'Vị trí của chúng tôi rất tuyệt, phía trước các di tích Hòn Chong, cách tháp Ponagar khoảng 1km, tắm bùn 3,5 km, Chủ nhà và nhân viên có thể nói tiếng Trung, tiếng Anh và tiếng Việt. Căn hộ có view biển đẹp, bạn có thể ngắm bình minh Tất cả chủ nhà và nhân viên không gian căn hộ sẽ tương tác với khách<br/><br/>* Hướng dẫn các tiện ích xung quanh căn hộ như sau:<br/><br/>- Tầng 1 là Trung tâm thương mại (Siêu thị, Thực phẩm và Đồ uống, Cửa hàng Coffe cao cấp ...).<br/><br/>- Chỉ cách bãi biển 100 mét.<br/><br/>- Chỉ 200 mét đến Hòn Chong Điểm tham quan.<br/><br/>- Chỉ 3 km đến trung tâm thành phố Nha Trang.<br/><br/>- Chỉ 2 km đến chùa Ponagar.<br/><br/>- Chỉ 3 km để tắm khoáng nóng & bùn I-Resort. Hầu như có các hoạt động tại trung tâm Nha trang là nơi chúng tôi tọa lạc.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (50, N'PARADISE HOME - LUXURY', N'Căn hộ dịch vụ', 2, 1800000, N'HN', N'AQ6iIGB9J_kOuNEpqQuGV6Uk.jpg', N'Hai Bà Trưng, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 5 khách)', N'Paradise Luxury apartment nằm trên con phố Nguyễn Du. Vị trí thuận tiện cách ga Hà Nội chỉ 500m, cách phố cổ Hà Nội 2km. Xung quanh còn có công viên Thống Nhất, hồ Thiền Quang, có nhiều nhà hàng quán ăn ngon, khu trung tâm mua sắm thuận tiện.<br/><br/>Tòa căn hộ Paradise bao gồm 8 tầng và 1 tầng thượng view ra mặt phố, có cửa sổ thoáng mát, được thiết kế theo phong cách hiện đại,sang trọng: 1 giường đôi lớn, sofa, bếp và dụng cụ bếp cơ bản, phòng tắm có bồn tắm, tủ quần áo, TV, điều hòa.<br/><br/>Căn hộ của chúng tôi bao gồm 2 phòng ngủ, có tất cả mọi thứ bạn cần để nấu một bữa ăn ngon: tủ lạnh, hop, lò vi sóng cũng như dao kéo, đồ sành sứ và đồ dùng. Trong phòng ngủ, bạn sẽ tìm thấy toàn bộ vật dụng cần thiết thoải mái của chúng tôi: gối và đêm êm ái, bàn là, ti vi giải trí,...<br/><br/>Cách sân bay Nội Bài 25km ( khoảng 45 phút ngồi xe taxi). Paradise có cung cấp dịch vụ taxi sân bay với giá cả phù hợp, bạn có thể liên hệ trực tiếp với Paradise để được hỗ trợ.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (51, N'BOWHOME - CASA D''ARTE', N'Studio', 1, 1150000, N'HN', N'1531120224_AUBE0293-min.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 2 giường · 1 phòng ngủ · 4 khách (tối đa 5 khách)


', N'Bawhome - Case D''Arte nằm trong tòa nhà 100 năm tuổi của Pháp. Với phong cách độc đáo mà không có nơi nào có thể so sánh được.<br/><br/>Tại tầng 1 với phòng khách ấm cúng cùng nhà bếp hiện đại. Ban công tuyệt đẹp để bạn có thể thả hồn ngắm cảnh phố phường Hà Nội tấp nập mỗi tối một cách nhẹ nhàng và thư thái.<br/><br/>Chỗ ở của chúng tôi có một phòng gác mái nhỏ để bạn có thể phòng đọc sách và giải trí như nghe nhạc được yên tĩnh mà không ai làm phiền đến bạn. Sau một ngày bận rộn khám phá phố phường, bạn có thể trở về với căn homestay cùng một cuốn sách, một tách trà, nghe một bài hát cũ và ngắm nhìn đường phố lên đèn chắc chắn sẽ làm tâm trạng của bạn khá lên rất nhiều.<br/><br/>Với cấu trúc thiết kế theo phong cách Pháp cổ cũng giống như bạn đang lạc vào xứ sở Alice. Một nơi tuyệt đẹp nếu bạn chịu khám phá hết cả một đọa đường hầm xấu xí cậy đó<br/><br/>Chỗ ở của chúng tôi có đầy đủ:<br/><br/>- Nhà bếp, nơi có tất cả các nguyên liệu và vật dụng để giú bạn có một bữa tối tuyệt vời<br/><br/>- Wi-Fi tốc độ cao và một góc đọc sách yên tĩnh dành cho bạn<br/><br/>- Phòng tắm riêng đầy đủ tiện nghi và ban công đẹp mắt', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (52, N'VINHOMES GREEN BAY', N'Chung cư', 1, 580000, N'HN', N'1525940794_PM3.2.jfif', N'Cầu Giấy, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'- V-HOUSE 6 Serviced Apartment bao gồm 37 phòng căn hộ dịch vụ<br/><br/>- Tòa nhà được thiết kế theo phong cách hiện đại với đầy đủ trang thiết bị<br/><br/>- Chúng tôi sẽ mang lại cho khách hàng dịch vụ tốt nhất và chỗ ở tuyệt vời nhất tại Hà Nội<br/><br/>- V-HOUSE 6 Serviced Apartment nằm tại trung tâm của khu đô thị Trung Hòa với rất nhiều dịch vụ xung quanh: nhà hàng, siêu thị, thể thao, giải trí...<br/><br/>- Góc bếp nhỏ xinh đầy đủ đồ dùng nấu nướng, gia vị để bạn có thể tự tay nấu ăn những món bạn yêu thích<br/><br/>- Cửa sổ kính lớn giúp căn phòng luôn tràn ngập ánh sáng', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (53, N'SPACIOUS APARTMENT', N'Chung cư', 4, 3700000, N'HN', N'room_12653_2_1568428219.jpg', N'Đống Đa, Hà Nội, Việt Nam', N'Nguyên căn · 3 Phòng tắm · 4 giường · 4 phòng ngủ · 4 khách (tối đa 9 khách)', N'- Vị trí: trung tâm của Hà Nội - đối diện nhà hát lớn và chỉ mất 50 mét từ hồ Hoàn Kiếm. Chỗ ở của chúng tôi nằm trong một khu vực tốt với nhiều nhà hàng, quán bar và quán cà phê xung quanh nó. Điểm hoàn hảo để khám phá trung tâm của Old Town.<br/><br/>- Khu vực khá hoàn hảo bởi cửa cách âm thanh hoàn hảo: luôn khiến bạn ngủ sâu<br/><br/>- Giường cỡ Queen với nệm thoải mái, bộ khăn trải giường bằng vải cotton Ai Cập 100%. Tương ứng tiêu chuẩn khách sạn 5 sao.<br/><br/>Chúng tôi sẽ gửi Hướng dẫn với thông tin hữu ích về địa điểm / thực phẩm Khuyến nghị cho khách được xác nhận. Bạn sẽ cảm thấy thoải mái và dễ dàng hơn để khám phá Hà Nội.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (54, N'BYN''S HOME TWO', N'Studio', 2, 1850000, N'HN', N'DSC_8884.jpg', N'Ba Đình, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 5 khách (tối đa 5 khách)', N'Căn hộ của tôi nằm ở Vinhomes Metropolis . Tòa nhà này có trung tâm mua sắm, siêu thị, rất nhiều nhà hàng và hồ bơi, phòng tập thể dục .... cho nhà ở. Bạn có thể ở đây và sử dụng bữa trưa và bữa tối tại Vincom Plaza ...<br/><br/>Căn hộ có tầm nhìn tuyệt vời cho bạn và gia đình bạn. bạn sẽ được hạnh phúc trong căn hộ của chúng tôi. Cảm ơn và chúc bạn có một khoảng thời gian vui vẻ ở Hà Nội!<br/><br/>Bên cạnh đó, tôi cũng là một người vô cùng thân thiện và thoải mái. Chính vì vậy đừng ngại ngần mà chia sẻ với chúng tôi những điều bạn đang thắc mắc hoặc những khó khăn bạn gặp phải khi ở đây.<br/><br/>Chúng tôi cũng luôn mong muốn được cùng bạn khám phá nhiều địa điểm tốt đẹp nhất tại đây.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (55, N'HANOI HOME 3', N'Căn hộ dịch vụ', 1, 690000, N'HN', N'a0kYNICbgh2egSSZ9jTBKgFU.png', N'Ba Vì, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 2 khách)', N'Căn hộ mới và hiện đại vừa được trang bị tiện nghi giúp khách hàng cảm thấy như đang ở nhà. Toàn bộ căn hộ tràn ngập ánh sáng tự nhiên, tạo sự vừa thoáng vừa rộng rãi. Các tòa nhà có đầy đủ tiện nghi bao gồm Phòng tập thể dục, bể bơi 4 mùa, sân vườn đẹp, nhà hàng, khu vui chơi trẻ em, Cửa hàng dược phẩm ... Giao thông rất thuận tiện để đi bất cứ nơi nào trong thành phố cũng như các khu công nghiệp quanh thủ đô Hà Nội. Khách truy cập vào toàn bộ nơi. Tôi sẽ có mặt 24/7. Khu phố rất an toàn và xinh đẹp với công viên, hồ nước và khu giải trí. Cửa hàng tiện lợi, siêu thị và các dịch vụ khác cũng có sẵn trong khoảng cách đi bộ. Rất an toàn để có được xung quanh. Grab hoặc taxi được khuyến nghị nếu bạn muốn đi quanh thành phố.<br/><br/>Chúng tôi sẽ gửi mật mã vào nhà trước khi bạn check-in<br/><br/>Thẻ thang máy sẽ được gửi đến khi bạn đến check-in', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (56, N'CHI''S HOUSE #4', N'Căn hộ dịch vụ', 2, 1500000, N'HN', N'room_15776_247_1566795834.jpg', N'Tây Hồ, Hà Nội, Việt Nam', N'Nguyên căn · 2 Phòng tắm · 2 giường · 2 phòng ngủ · 4 khách (tối đa 5 khách)', N'Căn hộ tọa lạc ở tầng 17 tòa D''El Dorado Premium Phú thượng, 1 tổ hợp căn hộ với các dịch vu thu phí như bể bơi, gym, spa. Căn hộ nhìn ra Hồ tây thơ mộng và được trang bị nội thất hiện đại mang lại cho quý khách cảm giác thư giản khi trải nghiệm tại Qhome.<br/><br/>Căn hộ phù hợp cho quý khách lưu trú trong chuyến công tác tại Hà Nội hay những khách hàng mong muốn có 1 nơi thư giản, thay đổi không khí với người thương.<br/><br/>Từ D.''El Dorado, bạn có thể thả bộ đi dạo ven Hồ Tây, thưởng thức các món ăn vặt nổi tiếng ở Tây Hồ và thăm thú,chơi đùa tại công viên nước Hồ tây hoặc ghi lại các khoảng khắc tại thung lũng hoa.<br/><br/>Căn hộ được trang bị máy pha cafe, bếp, lò vi sóng, smart ti vi, tủ lạnh...<br/><br/>Qhome mong muốn mang lại cho quý khách 1 trải nghiệm tuyệt vời, vì vậy đừng ngần ngại khi đặt căn hộ của chúng tôi.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (68, N'SERVICED 1BR FLOOR', N'Căn hộ dịch vụ', 2, 650000, N'HN', N'Vmz7EdF9hkEm0YX5qDpJ_mNK.jpg', N'Tây Hồ, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Nằm trên tuyến phố đi bộ Trịnh Công Sơn - phố đi bộ thứ 2 ở Hà Nội, vị trí ở ngay nơi có nhiều hồ đẹp tại quận Tây Hồ như Hồ Sen, Đầm Sen, tiếp đó là Hồ Tây rộng lớn. “Chính vì có vị trí thuận lợi về cảnh quan như vậy nên khi đến phố Trịnh Công Sơn, du khách được hưởng thụ không gian yên tĩnh, đầy trữ tình. ‘break’ Hơn nữa, tuyến phố nằm xa các tuyến đường lớn ồn ào, lại được bao quanh nhiều ao hồ, trong đó có hồ sen, đầm sen… làm cho phố Trịnh Công Sơn càng đúng nghĩa là không gian đi bộ, sinh hoạt văn hóa, ẩm thực. ‘break’ Chỗ ở của chúng tôi nằm trong phạm vi gần 1 số điểm du lịch quanh hồ Tây như: công viên nước hồ Tây, hai con rồng đá hồ Tây, phủ Tây Hồ, đường Hàn Quốc bến Nhật Bản, chùa Vạn Niên, chùa Thiên Niên, chùa Tảo Sách, ... hay khu phố Tây sầm uất đường Xuân Diệu với các quán ăn nhà hàng Âu sang trọng với tầm nhìn đẹp nhất Hà Nội. ‘break’ Chỗ ở của chúng tôi cũng gần bến xe buýt hay gần cầu Nhật Tân, thuận tiện cho việc đi lại, di chuyển ra sân bay hay đi vào khu trung tâm nội đô.', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (70, N'CAMELLIA HOMESTAY', N'Biệt thự', 7, 5800000, N'HN', N'1yysAYJIGleQqbVE0ekJsRXa.jpg', N'Ba Vì, Hà Nội, Việt Nam', N'Nguyên căn · 7 Phòng tắm · 13 giường · 7 phòng ngủ · 24 khách (tối đa 32 khách)', N'Nếu như trước đây, mọi người đều đổ dồn về thành thị để tìm kiếm một nơi giải tỏa căng thẳng, một nơi vui chơi, và hội họp bạn bè, thì giờ đây, hòa chung với xu hướng mới, để đạt được tới sự cân bằng và hạnh phúc, sự kết nối hoàn hảo họ cần một nơi để trải nghiệm bên nhau, cùng tạo ra những kỉ niệm đáng nhớ. <br /><br /> Đến với dự án Camellia, các quý khách sẽ trở thành tâm điểm của một không gian và hệ sinh thái thiên nhiên gần gũi được xây dựng xung quanh. Các tiện ích trong không gian và cảnh quan đều được lựa chọn để tạo nên một không gian thoải mái, cân bằng, nơi nhu cầu về sự thư giãn, một không gian bình yên để gắn kết, thỏa mãn sự hạnh phúc <br /><br /> · 1 Căn Villa: Tổng sức chứa tối đa 20 <br /><br /> - gồm 4 phòng ngủ trên tầng 2, hai phòng sức chứa 4 người và 2 phòng sức chứa 3 người, mỗi phòng có WC riêng <br /><br /> - 1 phòng Dom dưới tầng 1, sức chứa 6 (ba giường 2 tầng), dùng WC chung của tầng 1 <br /><br /> - 1 phòng sinh hoạt chung: phòng khách, bếp, bàn ăn <br /><br /> - Bể bơi phía trước villa <br /><br /> · 1 nhà Container <br /><br /> - Chia đôi 2 phòng có WC riêng, mỗi phòng sức chứa 2 <br /><br /> - 1 nhà bếp phía sát ngoài container dùng chung cho 2 phòng container <br /><br /> - Có bàn thưởng trà xinh xắn phía trước hiên <br /><br />', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (71, N'LUXURY 5STAR STUDIO', N'Chu cư', 1, 560000, N'HN', N'4AuZs9lWQZdCQsToc1Yq3Tb4.jpg', N'Nam Từ Liêm, Hà Nội, Việt Nam', N'Nguyên căn · 1 Phòng tắm · 1 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Căn hộ mới và hiện đại vừa được trang bị tiện nghi giúp khách hàng cảm thấy như đang ở nhà. Toàn bộ căn hộ tràn ngập ánh sáng tự nhiên, tạo sự vừa thoáng vừa rộng rãi. Các tòa nhà có đầy đủ tiện nghi bao gồm Phòng tập thể dục, bể bơi 4 mùa, sân vườn đẹp, nhà hàng, khu vui chơi trẻ em, Cửa hàng dược phẩm ... Giao thông rất thuận tiện để đi bất cứ nơi nào trong thành phố cũng như các khu công nghiệp quanh thủ đô Hà Nội. Phòng studio ấm cúng với nội thất chất lượng cao được bố trí với các chi tiết: <br /><br /> - 01 giường King <br /><br /> - 01 phòng tắm <br /><br /> - Nhà bếp và thiết bị gia dụng <br /><br /> -TV và truy cập Internet tốc độ cao miễn phí <br /><br /> - Máy giặt và bàn ủi, bạn có thể sử dụng dịch vụ giặt ủi miễn phí <br /><br /> - Máy sấy tóc, bếp điện, lò nướng microway. <br /><br /> Vinhomes Green Bay là một thành phố sinh thái đầy cây và hoa. <br /><br /> Sân bay quốc tế Nội Bài là 40 phút (30km) bằng Grab / Taxi. <br /><br /> - Khu phố cổ: 30 phút di chuyển bằng ô tô <br /><br /> - Sân vận động quốc gia Mỹ Đình: 10 phút <br /><br /> Chúng tôi sẽ gửi mật mã vào nhà trước khi bạn check-in <br /><br /> Thẻ thang máy sẽ được gửi đến khi bạn đến check-in <br /><br />', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (72, N'F7 HOMESTAY MAZZANINE', N'Căn hộ dịch vụ', 1, 600000, N'HN', N'_DSC1853.jpg', N'Hoàn Kiếm, Hà Nội, Việt Nam', N'Phòng riêng · 1 Phòng tắm · 3 giường · 1 phòng ngủ · 2 khách (tối đa 3 khách)', N'Căn phòng theo phong cách minimalism, được chúng mình cẩn thận chăm chút từng chi tiết nhỏ nhất. Phòng có đầy đủ các trang thiết bị, vật dụng thiết yếu nhất có thể đáp ứng được nhu cầu của cả các khách hàng khó tính. Với nhiều năm kinh nghiệm làm việc ở khách sạn cao cấp, Luustay tự tin rằng có thể mang đến cho các bạn những trải nghiệm tốt nhất.<br/>• Phòng 25 mét vuông trên tầng 2<br/><br/>• Máy giặt & máy sấy miễn phí<br/><br/>• Nhà bếp đầy đủ vật dụng & được trang bị mới hoàn toàn<br/><br/>• 5 phút đi bộ đến Khu Phố Cổ và 10 phút đi bộ đến Hồ Hoàn Kiếm, nằm ngay trung tâm Chợ Đồng Xuân<br/><br/>', 1)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (76, N'home_name_update', N'Biệt thự', 5, 1300000, N'HN', N'image_intro_update', N'Hải Phòng', N'short_update', N'detail_update', 0)
INSERT [dbo].[Home] ([home_id], [home_name], [home_type], [room_number], [price], [place_id], [image_intro], [address], [short_description], [detail_description], [restore]) VALUES (77, N'new', N'Căn hộ dịch vụ', 2, 1200000, N'DN', N'new', N'TP HCM', N'new', N'new <br/><br/> new <br/><br/>', 0)
SET IDENTITY_INSERT [dbo].[Home] OFF
GO
SET IDENTITY_INSERT [dbo].[Images_Detail] ON 

INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (7, 3, N'room_14385_394_1550574174.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (8, 3, N'1537780857__DSF5475.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (9, 3, N'room_14385_400_1550574240.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (10, 4, N'room_31020_82_1566965786.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (11, 4, N'room_31020_83_1566965787.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (12, 4, N'room_31020_89_1566965793.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (14, 15, N'del-dorado-premium-4-1.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (15, 15, N'9ZFkREoAW8TI2BOKDMo_a1g5.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (16, 15, N'69ad8ebe05e3fdbda4f2.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (17, 16, N'dLQ3SOHAOvwGWbk167k7abp0.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (18, 16, N'GvEyUc400nNBsDYE3sBqbN5y.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (19, 16, N'rjT-V7nNDfKiZT8Evb0OMBpv.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (20, 17, N'room_31435_50_1567267574.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (21, 17, N'room_31435_61_1567267594.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (22, 17, N'room_31435_69_1567267690.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (23, 18, N'5L3W_EU0AOwBYBC_LnVnSFXK.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (24, 18, N'dkG8Mf5FTb0kMz7sLBD-pqOT.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (25, 18, N'WOBO_3ArxlzxqLkjtLRv4ljV.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (26, 19, N'room_30353_86_1566371547.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (27, 19, N'room_30353_34_1566371450.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (28, 19, N'room_30353_36_1566371453.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (29, 32, N'PyxpGwY5p0vr3OjVWCnhrntQ.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (30, 32, N'lRYdf8rpyP-HYuNbhK_2G8Kw.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (31, 32, N'F1WL3HkqDquD9E1qbYq1tO4T.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (32, 33, N'1534997082_22713265_179175142642451_3260649097806128429_o.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (33, 33, N'1534997976_a.png')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (34, 33, N'53F99A55-7747-45E5-B70A-495EE8D49532.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (35, 34, N'RxdTs0izzR8_Yw2XWGLg6hxO.png')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (36, 34, N'1536127719_302 (4).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (37, 34, N'1536127713_302 (3).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (39, 35, N'805 (4).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (40, 35, N'805 (3).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (41, 36, N'BXSWxc8JJfPItWkkKpNpwqMf.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (42, 36, N'N6zYFPCTWCVmtAHFKGg_rSNu.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (43, 36, N'1DRfyf_WU3jzV0FDcpxHyJnD.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (44, 37, N'room_69292_36_1583392134.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (45, 39, N'3Dk1RLZwCS2m7z7_nlNXb-BG.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (46, 39, N'zqnnL_oNtgpQSFSGDgAEClQy.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (47, 39, N'5KWOSZvid66wXAqUqmITfiQb.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (48, 50, N'0v57yVew_YpAe2SJOj6MlUVM.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (49, 50, N'sVJjmC4iq8ecf0NlL2ya0-0r.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (50, 50, N'GLLFS2bRhG89YYZyodZFcTB7.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (51, 51, N'1531120240_AUBE0461-min.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (52, 51, N'1531120237_AUBE0239-min.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (53, 51, N'1531120230_AUBE0267-min.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (54, 52, N'1525939670_B02A9981.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (55, 52, N'1525939844_B02A9965.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (56, 52, N'1525939780_B02A9878.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (60, 37, N'room_69292_29_1583392126.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (61, 37, N'room_69292_28_1583392125.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (62, 53, N'DSC_8884 (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (63, 53, N'DSC_8886.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (64, 53, N'DSC_8881.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (65, 54, N'room_12653_4_1568428220.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (66, 54, N'room_12653_7_1568428677.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (67, 54, N'room_12653_8_1568428678.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (68, 55, N'IMG_2669.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (69, 55, N'IMG_2663.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (70, 55, N'IMG_2680.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (71, 56, N'room_15776_242_1566795828.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (72, 56, N'room_15776_231_1566795817.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (73, 56, N'room_15776_246_1566795833.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (89, 27, N'room_41267_2_1576765231.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (90, 27, N'room_41267_3_1576765232.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (91, 27, N'room_41267_8_1576765239.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (92, 42, N'GyH9bQWPHV7kxuZ8VKTHgo8V.jfif')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (93, 42, N'zvMAyyHRjkZrD_RbSeqIPxzU.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (94, 42, N'95UZwpMfJ8QLeNlD9Qz_q4Em.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (95, 43, N'Heq1u_tUDQz2PXbkdSV5H7EB (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (96, 43, N'oZ519mzV_UeBS9PFGMDsMug8.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (97, 43, N'H0JgDBmDAE_enHwy9II_0JHM.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (110, 21, N'room_27965_3_1567514905.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (111, 21, N'room_27965_1_1567514902.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (112, 21, N'room_27965_15_1567515065.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (113, 22, N'SBR---2-BEDROOM-APT-04.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (114, 22, N'SBR---2-BEDROOM-APT-06.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (115, 22, N'SBR---SWIMMING-POOL-03.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (116, 23, N'KYQDmAmNagFERsCeqhbS9Ihj.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (117, 23, N'xRFUuxmH4UBwpjThz7Lr2fDS.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (118, 23, N'ZGPRdu8LiCKAAWA3Ytt2qW9M.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (119, 44, N'bP8Nk8Lvah-AtfGwY4Ux0boA.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (120, 44, N'q_rkwai7M-4b4rskdjNI9crI.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (121, 44, N'hPTB9qTWBsMg1kH0qJzGtXs_.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (122, 45, N'room_16410_30_1559036101 (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (123, 45, N'1540564892_10a.jfif')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (124, 45, N'1540564882_8.jfif')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (125, 46, N'room_19279_13_1547003471.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (126, 46, N'room_19279_10_1547003295.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (127, 46, N'room_19279_9_1547003293.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (128, 47, N'1515556483_IMG_6697.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (129, 47, N'1515556485_IMG_6710.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (130, 47, N'1515556486_IMG_6683.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (131, 48, N'3thc2n1bIgUNaf2OB5sI7cYz (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (132, 48, N'4WSjwwMGPz_mrNm7UxJWvXn-.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (133, 48, N'ky74nzr07l8IrhUuB5ADexS6.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (134, 29, N'1524567955_IMG_2531_copy.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (135, 29, N'1524567953_IMG_2544_copy.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (136, 29, N'1524567952_IMG_2540_copy.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (137, 30, N'1527504311_131811844.jpg')
GO
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (138, 30, N'1527504604_IMG_6670.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (139, 30, N'1527504604_IMG_8856.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (143, 35, N'805 (4).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (144, 68, N'Vmz7EdF9hkEm0YX5qDpJ_mNK (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (145, 68, N'0R8g6fX-KS7oTox6E4w4gmcx.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (146, 68, N'pNMZS9Llo-f-fXYlanH1HepY.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (149, 70, N'nqoj3wEAo1ja3TsdSJmfsr4u.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (150, 70, N'wNOlUazYPmK0NzCmlz4VFONB.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (151, 70, N'fbH_Pv_UyujcSZtxVDPHiueN.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (152, 71, N'ohyjgQc4Nl1_5xGXL1R2V0_H.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (153, 71, N'a3s2-j5gvcUor9QqeauI_yLL.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (154, 71, N'dChjbqSJ_R-tjqGJtAaFr_7_.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1170, 76, N'a_update')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1171, 76, N'b_update')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1172, 76, N'c_update')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1182, 77, N'1')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1183, 77, N'2')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1184, 77, N'3')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1194, 72, N'_DSC1853 (1).jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1195, 72, N'_DSC1866.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1196, 72, N'_DSC1861.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1200, 1, N'del-dorado-premium-4-1.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1201, 1, N'9ZFkREoAW8TI2BOKDMo_a1g5.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1202, 1, N'69ad8ebe05e3fdbda4f2.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1209, 6, N'room_27779_43_1563358185.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1210, 6, N'room_27779_47_1563358190.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1211, 6, N'room_27779_52_1563358197.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1233, 11, N'sH23Ho3M0e8jIThTXL3e4F4d.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1234, 11, N'BvZqXTSc-o9noN5IdYv29czi.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1235, 11, N'l13QjtQRa8Dot7_oD3XDcS_Q.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1242, 8, N'room_26268_13_1560937411.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1243, 8, N'room_26268_26_1560937647.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1244, 8, N'room_26268_11_1560937408.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1245, 14, N'-StwVUctzifP_bi4-fmD_FhG.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1246, 14, N'KoHnTMdH4JtuOR27XyONC-L2.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1247, 14, N'2_YX_Dmfhx-CyApGY_rWpXJ9.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1248, 2, N'2q_Mbbd3xPIWYsh39443qzy2.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1249, 2, N'ksKAmCmHDgWQLvvNnubwUXp5.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1250, 2, N'_skwkdn9mzUOts02J42W1JqO.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1251, 5, N'jWIr0J7gK1ANy3M0f4UUyz3P.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1252, 5, N'WX8aowjElrUy_hnJCsXFYxDS.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1253, 5, N'JK12t4VGHwPBFrityUTH0w0B.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1254, 7, N'room_34919_28_1571193529.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1255, 7, N'room_34919_32_1571193531.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1256, 7, N'room_34919_34_1571193531.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1257, 20, N'room_24829_20_1557643919.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1258, 20, N'room_24829_17_1557643913.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1259, 20, N'room_24829_14_1557643908.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1260, 9, N'1537857354_21125519_1449412561794796_2254630396375859648_o.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1261, 9, N'1537857352_21055963_1449400095129376_4895601070001807387_o.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1262, 9, N'1537857354_21125734_1449399995129386_8943009373445568949_o.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1263, 13, N'f45y7ukrHUSBzNZHMOBj0Fyf.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1264, 13, N'p0Z5tGXebwRS_sA12rMFc6Kx.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1265, 13, N'C7YGZjExlM-ETrw30jDxjp62.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1266, 12, N'cjMALZUu1tBVpg5eCgzdW_it.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1267, 12, N'room_34353_16_1570506036.jpg')
INSERT [dbo].[Images_Detail] ([image_id], [home_id], [image_url]) VALUES (1268, 12, N'lqq0oJ0Lg_ye3ZCyKpgHldD-.jpg')
SET IDENTITY_INSERT [dbo].[Images_Detail] OFF
GO
INSERT [dbo].[Place] ([place_id], [place_name], [image], [total_home]) VALUES (N'DN', N'Đà Nẵng', N'danang.png', 2413)
INSERT [dbo].[Place] ([place_id], [place_name], [image], [total_home]) VALUES (N'HN', N'Hà Nội', N'hanoi.png', 3046)
INSERT [dbo].[Place] ([place_id], [place_name], [image], [total_home]) VALUES (N'NT', N'Nha Trang', N'nhatrang.png', 2537)
INSERT [dbo].[Place] ([place_id], [place_name], [image], [total_home]) VALUES (N'SG', N'Sài Gòn', N'tphcm.png', 2933)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (1, N'user@gmail.com', N'0987654321', N'Mr.User', N'123', 1, N'Sóc Sơn - Hà Nội - Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (2, N'admin@gmail.com', N'0123456789', N'Mr.Admin', N'123', 0, N'Sóc Sơn - Hà Nội - Việt Nam', N'ROLE_ADMIN', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (3, N'coosi29@gmail.com', N'0837436484', N'Hà Văn Quang', N'123', 1, N'Cầu Giấy - Hà Nội', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (4, N'loto@gmail.com', N'0123123123', N'Alexer', N'123', 0, N'Ba Đình, Hà Nội, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (5, N'tuannv@gmail.com', N'0968904962', N'Nguyễn Văn Tuấn', N'321', 1, N'Quận 7, Hồ Chí Minh, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (6, N'aloha@gmail.com', N'0232343434', N'Vương Văn Truờng', N'123', 0, N'Sơn Trà, Đà Nẵng, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (7, N'hailt@fe.ed.vn', N'098675845', N'Lê Thanh Hải', N'123', 1, N'Hồ Tùng Mậu, Cầu Giấy, Hà Nội', N'ROLE_User', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (8, N'sodesu@gmail.com', N'0937383647', N'Nguyễn Văn Dũng', N'123', 0, N'Nam Từ Liêm, Hà Nội, Vietnam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (9, N'aloalo@gmail.com', N'0937236534', N'Hoàng Đức Trường', N'123', 1, N'Sơn Trà, Đà Nẵng, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (10, N'booking@gmail.com', N'0937252433', N'Nguyễn Thành Long', N'123', 0, N'Nha Trang, Khánh Hòa, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (11, N'member@gmail.com', N'0328423232', N'Nguyễn Đăng Hoàng Long', N'123', 0, N'Nha Trang, Khánh Hòa, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (12, N'hashtree@gmail.com', N'0973625362', N'Đỗ Thị Thu Hằng', N'123', 1, N'Xuân Giang - Sóc Sơn - Hà Nội', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (13, N'miuukiu@gmail.com', N'0354165200', N'Nguyễn Thị Trà My', N'123', 1, N'Minh Khai, Hà Giang, Việt Nam', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (19, N'khuend@gmail.com', N'0937463543', N'Nguyễn Đình Khuê', N'123', 1, N'', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (20, N'locolo@gmail.com', N'0356827374', N'Nguyễn Trần Đăng', N'123', 1, N'', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (21, N'ahihe@gmail.com', N'0984735746', N'Trần Minh Khải', N'123', 1, N'Hoàng Hoa Thám - Hà Nội', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (22, N'arater@gmail.com', N'0937363526', N'Đỗ Thị Thu Hằng', N'123', 1, N'', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (23, N'likika@gmail.com', N'0352654536', N'Lý Anh Dũng', N'123', 1, N'', N'ROLE_USER', 1)
INSERT [dbo].[User] ([user_id], [email], [phone], [name], [password], [gender], [address], [role], [verify]) VALUES (24, N'include@gmail.com', N'0908363625', N'Nguyễn Đình Quang', N'123', 1, N'', N'ROLE_USER', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([home_id])
REFERENCES [dbo].[Home] ([home_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Home]  WITH CHECK ADD FOREIGN KEY([place_id])
REFERENCES [dbo].[Place] ([place_id])
GO
ALTER TABLE [dbo].[Images_Detail]  WITH CHECK ADD FOREIGN KEY([home_id])
REFERENCES [dbo].[Home] ([home_id])
GO
USE [master]
GO
ALTER DATABASE [Luxstay] SET  READ_WRITE 
GO
