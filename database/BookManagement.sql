USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblCategoryID]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoryID](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategoryID] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserID] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[totalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[DetailID] [int] NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/17/2021 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[RoleID] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[Password] [nvarchar](20) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategoryID] ([CategoryID], [CategoryName]) VALUES (11, N'SGK')
INSERT [dbo].[tblCategoryID] ([CategoryID], [CategoryName]) VALUES (12, N'Sach nang cao')
INSERT [dbo].[tblCategoryID] ([CategoryID], [CategoryName]) VALUES (13, N'Truyen')
INSERT [dbo].[tblOrder] ([OrderId], [UserID], [Adress], [Date], [totalMoney]) VALUES (N'4a635ea0-c262-4107-850f-ce7579848e03', N'Se02', N'080902', N'07/15/2021', 123)
INSERT [dbo].[tblOrder] ([OrderId], [UserID], [Adress], [Date], [totalMoney]) VALUES (N'8db55543-16f3-4959-bd76-d626dc577e8e', N'Se02', N'080902', N'07/14/2021', 1123)
INSERT [dbo].[tblOrder] ([OrderId], [UserID], [Adress], [Date], [totalMoney]) VALUES (N'a112daeb-1f5e-4274-a78f-f86a743f6903', N'Se0123', N'sadsa1', N'07/20/2021', 2123)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderId], [ProductID], [Price], [Quantity]) VALUES (1, N'8db55543-16f3-4959-bd76-d626dc577e8e', N'5', 1000, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderId], [ProductID], [Price], [Quantity]) VALUES (2, N'8db55543-16f3-4959-bd76-d626dc577e8e', N'10', 123, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderId], [ProductID], [Price], [Quantity]) VALUES (1, N'8db55543-16f3-4959-bd76-d626dc577e8e', N'10', 123, 1)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderId], [ProductID], [Price], [Quantity]) VALUES (1, N'a112daeb-1f5e-4274-a78f-f86a743f6903', N'1', 1000, 2)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderId], [ProductID], [Price], [Quantity]) VALUES (2, N'a112daeb-1f5e-4274-a78f-f86a743f6903', N'10', 123, 1)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'1', N'Ngu van ', 1000, N'https://salt.tikicdn.com/cache/w444/media/catalog/product/i/m/img956.u335.d20160423.t174919.jpg', -1, 11, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'10', N'Hoa', 123, N'https://tailieuhoctap.net/wp-content/uploads/2019/04/sach-giao-khoa-hoa-hoc-12-210x300.jpg', 11, 12, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'2', N'Tin hoc', 10000, N'https://sachcuatui.net/wp-content/uploads/2019/11/sach-giao-khoa-tin-hoc-12.jpg', 10, 11, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'3', N'Toan', 1000, N'https://baiviet.com/wp-content/uploads/2018/09/giai-bai-tap-sgk-toan-hinh-hoc-lop-12.png', 17, 11, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'4', N'Ly', 1000, N'https://cf.shopee.vn/file/4dfa33da46dd8d6283b416662c684e2b', 7, 11, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'5', N'Songoku', 1000, N'https://cf.shopee.vn/file/9bc187b93382667d7f592f617325a818', 12, 13, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'6', N'Naruto', 1000, N'https://bookbuy.vn/Res/Images/Product/naruto-tap-43-tai-ban-2020-_52019_1.jpg', 10, 13, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'7 ', N'Onepiece', 1000, N'https://truyenkinhdien.com/wp-content/uploads/2020/09/truyen-tranh-one-piece-vua-hai-tac.jpg', 15, 13, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'8', N'Toan Nang Cao', 1233, N'https://toanmath.com/wp-content/uploads/2016/12/sach-giao-khoa-giai-tich-12-nang-cao.png', 4, 12, N'Active')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Price], [Image], [Quantity], [CategoryID], [Status]) VALUES (N'9', N'Ly Nang Cao', 111, N'https://tailieuhoctap.net/wp-content/uploads/2019/04/sach-giao-khoa-vat-ly-12-nang-cao.jpg', 10, 12, N'Active')
INSERT [dbo].[tblRoles] ([RoleID], [Name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([RoleID], [Name]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRoles] ([RoleID], [Name]) VALUES (N'US', N'User')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se01', N'HoaiNam', N'AD', N'30411231', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se0123', N'JavaScriptt', N'US', N'sadsa1', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se02', N'Quynhtrang111', N'AD', N'080902', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se021', N'JavaScriptt', N'US', N'sadsa', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se022', N'hoainamdoanvu', N'US', N'sadsa', N'1', N'inactive')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se024', N'quynhtranghoainam', N'AD', N'sadsa12', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se04', N'Duc', N'US', N'201', N'1', N'Active')
INSERT [dbo].[tblUsers] ([UserID], [Name], [RoleID], [Adress], [Password], [Status]) VALUES (N'Se05', N'Thinh', N'US', N'222111', N'1', N'Active')
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategoryID] ([CategoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategoryID]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
