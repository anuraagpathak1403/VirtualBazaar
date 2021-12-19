
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 09/19/2017 00:29:15
-- Generated from EDMX file: E:\BPS\virtualbazaars\VirtualBazaar\BazaarModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [VirtualBazar];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AdvertiserCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdvertiserCategories];
GO
IF OBJECT_ID(N'[dbo].[AdvertiserRegisterations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdvertiserRegisterations];
GO
IF OBJECT_ID(N'[dbo].[AdvertiserVideos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdvertiserVideos];
GO
IF OBJECT_ID(N'[dbo].[Cities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cities];
GO
IF OBJECT_ID(N'[BazaarModelStoreContainer].[Coupons]', 'U') IS NOT NULL
    DROP TABLE [BazaarModelStoreContainer].[Coupons];
GO
IF OBJECT_ID(N'[dbo].[Localities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Localities];
GO
IF OBJECT_ID(N'[BazaarModelStoreContainer].[Menupermissions]', 'U') IS NOT NULL
    DROP TABLE [BazaarModelStoreContainer].[Menupermissions];
GO
IF OBJECT_ID(N'[BazaarModelStoreContainer].[Menus]', 'U') IS NOT NULL
    DROP TABLE [BazaarModelStoreContainer].[Menus];
GO
IF OBJECT_ID(N'[dbo].[States]', 'U') IS NOT NULL
    DROP TABLE [dbo].[States];
GO
IF OBJECT_ID(N'[dbo].[UserInfoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserInfoes];
GO
IF OBJECT_ID(N'[dbo].[VideoComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VideoComments];
GO
IF OBJECT_ID(N'[dbo].[VideoRatings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VideoRatings];
GO
IF OBJECT_ID(N'[dbo].[VideosApprovals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VideosApprovals];
GO
IF OBJECT_ID(N'[dbo].[VideoVisitors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VideoVisitors];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserInfoes'
CREATE TABLE [dbo].[UserInfoes] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [RoleID] int  NOT NULL,
    [MobileNo] nvarchar(max)  NOT NULL,
    [MailID] nvarchar(max)  NOT NULL,
    [AadharNo] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [AdvertiserID] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL
);
GO

-- Creating table 'AdvertiserVideos'
CREATE TABLE [dbo].[AdvertiserVideos] (
    [VideoID] int IDENTITY(1,1) NOT NULL,
    [AdvertiserID] int  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Extension] nvarchar(max)  NOT NULL,
    [ContentType] nvarchar(max)  NOT NULL,
    [Duration] time  NOT NULL,
    [ApprovalStatus] int  NOT NULL,
    [ActiveStatus] int  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [Video] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AdvertiserRegisterations'
CREATE TABLE [dbo].[AdvertiserRegisterations] (
    [AdvertiserID] int IDENTITY(1,1) NOT NULL,
    [OrganisationName] nvarchar(max)  NOT NULL,
    [Category] int  NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [LocalityID] int  NOT NULL,
    [Landmark] nvarchar(max)  NOT NULL,
    [CityID] int  NOT NULL,
    [StateID] int  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [MobileNo] nvarchar(max)  NOT NULL,
    [EmailID] nvarchar(max)  NOT NULL,
    [Website] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [RegisterDate] datetime  NOT NULL,
    [CustomerName] nvarchar(max)  NOT NULL,
    [CustomerMobileNum] nvarchar(max)  NOT NULL,
    [CustomerEmailID] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Scheme] nvarchar(max)  NOT NULL,
    [ViewsAllowed] int  NOT NULL,
    [Keyword] nvarchar(max)  NOT NULL,
    [Latitude] nvarchar(max)  NULL,
    [Longitude] nvarchar(max)  NULL,
    [ApprovalStatus] int  NULL,
    [MobileStatus] int  NULL
);
GO

-- Creating table 'AdvertiserCategories'
CREATE TABLE [dbo].[AdvertiserCategories] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [Category] nvarchar(max)  NOT NULL,
    [Icons] nvarchar(max)  NULL
);
GO

-- Creating table 'Localities'
CREATE TABLE [dbo].[Localities] (
    [LocalityID] int IDENTITY(1,1) NOT NULL,
    [CityID] int  NOT NULL,
    [LocalityName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [StateID] int IDENTITY(1,1) NOT NULL,
    [StateName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [CityID] int IDENTITY(1,1) NOT NULL,
    [StateID] int  NOT NULL,
    [CityName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'VideoVisitors'
CREATE TABLE [dbo].[VideoVisitors] (
    [VisitorID] int IDENTITY(1,1) NOT NULL,
    [VideoID] int  NOT NULL,
    [UserID] int  NOT NULL,
    [IPAddress] nvarchar(max)  NOT NULL,
    [Region] nvarchar(max)  NOT NULL,
    [ViewDuration] time  NULL,
    [VisitDate] datetime  NOT NULL
);
GO

-- Creating table 'VideoComments'
CREATE TABLE [dbo].[VideoComments] (
    [CommentID] int IDENTITY(1,1) NOT NULL,
    [VideoID] int  NOT NULL,
    [Comments] nvarchar(max)  NOT NULL,
    [CommentsBy] nvarchar(max)  NOT NULL,
    [CommentDate] datetime  NOT NULL
);
GO

-- Creating table 'VideoRatings'
CREATE TABLE [dbo].[VideoRatings] (
    [RatingID] int IDENTITY(1,1) NOT NULL,
    [VideoID] int  NOT NULL,
    [Rating] int  NOT NULL,
    [UserID] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'VideosApprovals'
CREATE TABLE [dbo].[VideosApprovals] (
    [ApprovalID] int IDENTITY(1,1) NOT NULL,
    [AdvertiserID] int  NOT NULL,
    [Title] nvarchar(max)  NULL,
    [FileName] nvarchar(max)  NOT NULL,
    [ContentType] nvarchar(max)  NULL,
    [FileType] int  NOT NULL,
    [ApprovalStatus] int  NOT NULL,
    [SubmitDate] datetime  NOT NULL
);
GO

-- Creating table 'Menus'
CREATE TABLE [dbo].[Menus] (
    [MenuId] int IDENTITY(1,1) NOT NULL,
    [ParentID] int  NOT NULL,
    [MenuName] nvarchar(max)  NOT NULL,
    [MenuURL] nvarchar(max)  NOT NULL,
    [MenuOrder] int  NOT NULL,
    [MenuID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Menupermissions'
CREATE TABLE [dbo].[Menupermissions] (
    [MenuID] int  NOT NULL,
    [User_Recno] int  NOT NULL,
    [EditviewRight] int  NOT NULL,
    [MenuId] int  NOT NULL
);
GO

-- Creating table 'Coupons'
CREATE TABLE [dbo].[Coupons] (
    [CouponId] int IDENTITY(1,1) NOT NULL,
    [AdvertiserID] int  NOT NULL,
    [UserID] int  NOT NULL,
    [Discount] decimal(18,0)  NOT NULL,
    [Validupto] datetime  NOT NULL,
    [UsedStatus] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [CouponNumber] nvarchar(max)  NOT NULL,
    [CouponNumber1] nvarchar(100)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserID] in table 'UserInfoes'
ALTER TABLE [dbo].[UserInfoes]
ADD CONSTRAINT [PK_UserInfoes]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [VideoID] in table 'AdvertiserVideos'
ALTER TABLE [dbo].[AdvertiserVideos]
ADD CONSTRAINT [PK_AdvertiserVideos]
    PRIMARY KEY CLUSTERED ([VideoID] ASC);
GO

-- Creating primary key on [AdvertiserID] in table 'AdvertiserRegisterations'
ALTER TABLE [dbo].[AdvertiserRegisterations]
ADD CONSTRAINT [PK_AdvertiserRegisterations]
    PRIMARY KEY CLUSTERED ([AdvertiserID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'AdvertiserCategories'
ALTER TABLE [dbo].[AdvertiserCategories]
ADD CONSTRAINT [PK_AdvertiserCategories]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [LocalityID] in table 'Localities'
ALTER TABLE [dbo].[Localities]
ADD CONSTRAINT [PK_Localities]
    PRIMARY KEY CLUSTERED ([LocalityID] ASC);
GO

-- Creating primary key on [StateID] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([StateID] ASC);
GO

-- Creating primary key on [CityID] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([CityID] ASC);
GO

-- Creating primary key on [VisitorID] in table 'VideoVisitors'
ALTER TABLE [dbo].[VideoVisitors]
ADD CONSTRAINT [PK_VideoVisitors]
    PRIMARY KEY CLUSTERED ([VisitorID] ASC);
GO

-- Creating primary key on [CommentID] in table 'VideoComments'
ALTER TABLE [dbo].[VideoComments]
ADD CONSTRAINT [PK_VideoComments]
    PRIMARY KEY CLUSTERED ([CommentID] ASC);
GO

-- Creating primary key on [RatingID] in table 'VideoRatings'
ALTER TABLE [dbo].[VideoRatings]
ADD CONSTRAINT [PK_VideoRatings]
    PRIMARY KEY CLUSTERED ([RatingID] ASC);
GO

-- Creating primary key on [ApprovalID] in table 'VideosApprovals'
ALTER TABLE [dbo].[VideosApprovals]
ADD CONSTRAINT [PK_VideosApprovals]
    PRIMARY KEY CLUSTERED ([ApprovalID] ASC);
GO

-- Creating primary key on [MenuId], [MenuID] in table 'Menus'
ALTER TABLE [dbo].[Menus]
ADD CONSTRAINT [PK_Menus]
    PRIMARY KEY CLUSTERED ([MenuId], [MenuID] ASC);
GO

-- Creating primary key on [MenuID], [MenuId] in table 'Menupermissions'
ALTER TABLE [dbo].[Menupermissions]
ADD CONSTRAINT [PK_Menupermissions]
    PRIMARY KEY CLUSTERED ([MenuID], [MenuId] ASC);
GO

-- Creating primary key on [CouponId] in table 'Coupons'
ALTER TABLE [dbo].[Coupons]
ADD CONSTRAINT [PK_Coupons]
    PRIMARY KEY CLUSTERED ([CouponId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------