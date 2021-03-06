USE [EHR]
GO
/****** Object:  StoredProcedure [dbo].[ValidateAdmin]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[ValidateAdmin] 
	(
	@username varchar(50),
	@password varchar(50),
	@Results int Output	
	)
	AS
	Set @Results = (Select COUNT(*) FROM adminLogin WHERE username= @username and password= @password COLLATE SQL_Latin1_General_CP1_CS_AS)
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[ValidateDoctor]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateDoctor]
(
	@username varchar(50),
	@password varchar(50),
	@Results int Output	
) 
AS
set @Results=(Select count(*) FROM doctor_signup_table WHERE username= @username and password=@password COLLATE SQL_Latin1_General_CP1_CS_AS)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[ValidateInsurance]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidateInsurance]
(
	@username varchar(50),
	@password varchar(50),
	@Results int Output	
) 
	
AS
set @Results=(Select count(*) FROM insurance_signup_table WHERE username= @username and password=@password COLLATE SQL_Latin1_General_CP1_CS_AS)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[ValidateUser] 
	(
	@username varchar(50),
	@password varchar(50),
	@Results int Output	
	)
	AS
	Set @Results = (Select count(*) FROM patient_signup_table WHERE username= @username and pswd= @password COLLATE SQL_Latin1_General_CP1_CS_AS)
	RETURN
GO
/****** Object:  Table [dbo].[adminLogin]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adminLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[displayname] [varchar](50) NULL,
	[imagename] [varchar](50) NULL,
 CONSTRAINT [PK_adminLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city_table](
	[state_id] [int] NULL,
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[cityname] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_table](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[countryname] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor_signup_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor_signup_table](
	[d_id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[mname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[dob] [varchar](50) NULL,
	[phoneno] [numeric](10, 0) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[imagename] [varchar](100) NOT NULL,
	[gender] [varchar](6) NOT NULL,
	[licensenumber] [varchar](100) NOT NULL,
	[degree] [varchar](50) NOT NULL,
	[speciality] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [varchar](1000) NOT NULL,
	[country_id] [int] NULL,
	[state_id] [int] NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK__doctor_s__D95F582B2DFF4743] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event_master]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event_master](
	[evt_id] [int] IDENTITY(1,1) NOT NULL,
	[evt_name] [varchar](50) NOT NULL,
	[evt_image] [varchar](max) NOT NULL,
 CONSTRAINT [PK_event_master] PRIMARY KEY CLUSTERED 
(
	[evt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[insurance_signup_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[insurance_signup_table](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[mname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[dob] [date] NULL,
	[phoneno] [numeric](10, 0) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[imagename] [varchar](100) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[licensenumber] [varchar](100) NOT NULL,
	[company] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [varchar](1000) NOT NULL,
	[country_id] [int] NULL,
	[state_id] [int] NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK__insuranc__98F919BA4CC1F0A4] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[labtest1]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[labtest1](
	[lab_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[test_date] [varchar](50) NULL,
	[lab_address] [varchar](1000) NULL,
	[patient_name] [varchar](500) NULL,
	[patient_age] [varchar](100) NULL,
	[test_name] [varchar](500) NULL,
	[doc_name] [varchar](500) NULL,
	[file_name] [varchar](100) NULL,
	[file_path] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[news]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[news](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [varchar](50) NOT NULL,
	[author] [varchar](50) NOT NULL,
	[news_title] [varchar](1000) NOT NULL,
	[news_point] [varchar](max) NOT NULL,
	[news_description] [varchar](max) NOT NULL,
	[news_catagory] [varchar](500) NOT NULL,
 CONSTRAINT [PK__news__7371E14E7A8EC712] PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_signup_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_signup_table](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[mname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[dob] [varchar](50) NULL,
	[phoneno] [numeric](10, 0) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[imagename] [varchar](200) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pswd] [varchar](50) NOT NULL,
	[address] [varchar](1000) NOT NULL,
	[country_id] [int] NULL,
	[state_id] [int] NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK__patient___82E06B910A5AF7F3] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prescription_master]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prescription_master](
	[p_pid] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[pre_date] [varchar](50) NULL,
	[patient_name] [varchar](50) NULL,
	[age] [varchar](50) NULL,
	[doctor_name] [varchar](50) NULL,
	[medicine_name] [varchar](50) NULL,
	[schedule] [varchar](50) NULL,
	[meal_schedule] [varchar](50) NULL,
	[unit] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[p_pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prescription_sub]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prescription_sub](
	[p_pid] [int] NULL,
	[p_id] [int] NULL,
	[medicine_name] [varchar](200) NULL,
	[schedule] [varchar](max) NULL,
	[meal_schedule] [varchar](max) NULL,
	[unit] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[report_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_table](
	[rt_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[report_date] [varchar](50) NULL,
	[p_name] [varchar](50) NULL,
	[p_age] [varchar](50) NULL,
	[marital_status] [varchar](50) NULL,
	[admit_date] [varchar](50) NULL,
	[admit_time] [varchar](50) NULL,
	[discharge_date] [varchar](50) NULL,
	[discharge_time] [varchar](50) NULL,
	[deaseas_name] [varchar](50) NULL,
	[deaseas_note] [varchar](1000) NULL,
	[room_type] [varchar](50) NULL,
	[noofdays] [varchar](50) NULL,
	[charge_room] [varchar](50) NULL,
	[doctor_charge] [varchar](50) NULL,
	[nursing_charge] [varchar](50) NULL,
	[medicine_charge] [varchar](50) NULL,
	[other_charge] [varchar](50) NULL,
 CONSTRAINT [PK__report_t__EF86171DC3A48E25] PRIMARY KEY CLUSTERED 
(
	[rt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state_table]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state_table](
	[country_id] [int] NULL,
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[statename] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sub_event_master]    Script Date: 15-04-2016 20:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sub_event_master](
	[sub_evt_id] [int] IDENTITY(1,1) NOT NULL,
	[evt_id] [int] NOT NULL,
	[image] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_sub_event_master] PRIMARY KEY CLUSTERED 
(
	[sub_evt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[city_table]  WITH CHECK ADD FOREIGN KEY([state_id])
REFERENCES [dbo].[state_table] ([state_id])
GO
ALTER TABLE [dbo].[doctor_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__doctor_si__city___2C3393D0] FOREIGN KEY([city_id])
REFERENCES [dbo].[city_table] ([city_id])
GO
ALTER TABLE [dbo].[doctor_signup_table] CHECK CONSTRAINT [FK__doctor_si__city___2C3393D0]
GO
ALTER TABLE [dbo].[doctor_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__doctor_si__count__2A4B4B5E] FOREIGN KEY([country_id])
REFERENCES [dbo].[country_table] ([country_id])
GO
ALTER TABLE [dbo].[doctor_signup_table] CHECK CONSTRAINT [FK__doctor_si__count__2A4B4B5E]
GO
ALTER TABLE [dbo].[doctor_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__doctor_si__state__2B3F6F97] FOREIGN KEY([state_id])
REFERENCES [dbo].[state_table] ([state_id])
GO
ALTER TABLE [dbo].[doctor_signup_table] CHECK CONSTRAINT [FK__doctor_si__state__2B3F6F97]
GO
ALTER TABLE [dbo].[insurance_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__insurance__city___30F848ED] FOREIGN KEY([city_id])
REFERENCES [dbo].[city_table] ([city_id])
GO
ALTER TABLE [dbo].[insurance_signup_table] CHECK CONSTRAINT [FK__insurance__city___30F848ED]
GO
ALTER TABLE [dbo].[insurance_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__insurance__count__2F10007B] FOREIGN KEY([country_id])
REFERENCES [dbo].[country_table] ([country_id])
GO
ALTER TABLE [dbo].[insurance_signup_table] CHECK CONSTRAINT [FK__insurance__count__2F10007B]
GO
ALTER TABLE [dbo].[insurance_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__insurance__state__300424B4] FOREIGN KEY([state_id])
REFERENCES [dbo].[state_table] ([state_id])
GO
ALTER TABLE [dbo].[insurance_signup_table] CHECK CONSTRAINT [FK__insurance__state__300424B4]
GO
ALTER TABLE [dbo].[labtest1]  WITH CHECK ADD  CONSTRAINT [FK__labtest1__p_id__38B96646] FOREIGN KEY([p_id])
REFERENCES [dbo].[patient_signup_table] ([p_id])
GO
ALTER TABLE [dbo].[labtest1] CHECK CONSTRAINT [FK__labtest1__p_id__38B96646]
GO
ALTER TABLE [dbo].[patient_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__patient_s__city___267ABA7A] FOREIGN KEY([city_id])
REFERENCES [dbo].[city_table] ([city_id])
GO
ALTER TABLE [dbo].[patient_signup_table] CHECK CONSTRAINT [FK__patient_s__city___267ABA7A]
GO
ALTER TABLE [dbo].[patient_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__patient_s__count__24927208] FOREIGN KEY([country_id])
REFERENCES [dbo].[country_table] ([country_id])
GO
ALTER TABLE [dbo].[patient_signup_table] CHECK CONSTRAINT [FK__patient_s__count__24927208]
GO
ALTER TABLE [dbo].[patient_signup_table]  WITH CHECK ADD  CONSTRAINT [FK__patient_s__state__25869641] FOREIGN KEY([state_id])
REFERENCES [dbo].[state_table] ([state_id])
GO
ALTER TABLE [dbo].[patient_signup_table] CHECK CONSTRAINT [FK__patient_s__state__25869641]
GO
ALTER TABLE [dbo].[prescription_master]  WITH CHECK ADD FOREIGN KEY([p_id])
REFERENCES [dbo].[patient_signup_table] ([p_id])
GO
ALTER TABLE [dbo].[prescription_sub]  WITH CHECK ADD FOREIGN KEY([p_pid])
REFERENCES [dbo].[prescription_master] ([p_pid])
GO
ALTER TABLE [dbo].[prescription_sub]  WITH CHECK ADD FOREIGN KEY([p_id])
REFERENCES [dbo].[patient_signup_table] ([p_id])
GO
ALTER TABLE [dbo].[report_table]  WITH CHECK ADD  CONSTRAINT [FK__report_tab__p_id__54CB950F] FOREIGN KEY([p_id])
REFERENCES [dbo].[patient_signup_table] ([p_id])
GO
ALTER TABLE [dbo].[report_table] CHECK CONSTRAINT [FK__report_tab__p_id__54CB950F]
GO
ALTER TABLE [dbo].[state_table]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country_table] ([country_id])
GO
