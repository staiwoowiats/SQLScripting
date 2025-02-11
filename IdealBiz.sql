USE [IdealBiz]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetWorkDays]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select [dbo].[fn_GetWorkDays] ('2017-07-10','2017-07-13')

create function [dbo].[fn_GetWorkDays] 
(
    @date1 datetime, 
    @date2 datetime 
)
returns int 
as 
begin 
    
    DECLARE @StartDate DATETIME
	DECLARE @EndDate DATETIME
	declare @DaysCount int
	SET @StartDate = @date1
	SET @EndDate = @date2

set  @DaysCount = (SELECT
   (DATEDIFF(dd, @StartDate, @EndDate) + 1)
  -(DATEDIFF(wk, @StartDate, @EndDate) * 2)
  
  ----(CASE WHEN DATENAME(dw, @StartDate) = 'Sunday' THEN 1 ELSE 0 END)
  ----(CASE WHEN DATENAME(dw, @EndDate) = 'Saturday' THEN 1 ELSE 0 END))
  
  
  
  -(case datepart(dw, @StartDate)+@@datefirst when 8 then 1 else 0 end) 
  -(case datepart(dw, @EndDate)+@@datefirst when 7 then 1 when 14 then 1 else 0 end))
  
       
      --return @DaysCount - 1
	  return @DaysCount 
end


--select [dbo].[fn_GetWorkDays] 
--select [dbo].[fn_GetWorkDays]('2014-08-04','2014-08-20')
--select (DATEDIFF(dd, '2014-08-04','2014-08-20')) + 1
--select (DATEDIFF(wk, '2014-08-01','2014-08-20')) * 2


 
GO
/****** Object:  Table [dbo].[Lodgment Lines]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lodgment Lines](
	[CashID] [varchar](50) NOT NULL,
	[Contribution Posted] [bit] NULL,
	[Amount] [decimal](18, 2) NULL,
	[FileName] [varchar](50) NULL,
 CONSTRAINT [PK_Lodgment Lines] PRIMARY KEY CLUSTERED 
(
	[CashID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posted Schedule Lines]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posted Schedule Lines](
	[Fund Code] [nvarchar](10) NOT NULL,
	[DeActivated PIN] [tinyint] NOT NULL,
	[Document No_] [nvarchar](50) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Value Date] [datetime] NOT NULL,
	[Payment Date] [datetime] NOT NULL,
	[Month] [nvarchar](10) NOT NULL,
	[Year] [nvarchar](10) NOT NULL,
	[Employer Code] [nvarchar](30) NOT NULL,
	[Employer Name] [nvarchar](100) NOT NULL,
	[Employee Name] [nvarchar](100) NOT NULL,
	[RSA Pin] [nvarchar](20) NOT NULL,
	[ER Contribution] [decimal](38, 20) NOT NULL,
	[EE Contribution] [decimal](38, 20) NOT NULL,
	[ER AVC] [decimal](38, 20) NOT NULL,
	[EE AVC] [decimal](38, 20) NOT NULL,
	[Total Contribution] [decimal](38, 20) NOT NULL,
	[Cash ID] [nvarchar](12) NOT NULL,
	[C Type] [nvarchar](10) NOT NULL,
	[End Month] [nvarchar](10) NOT NULL,
	[End Year] [nvarchar](10) NOT NULL,
	[Fund Name] [nvarchar](100) NOT NULL,
	[Fund Reference] [nvarchar](30) NOT NULL,
	[Employee Remuneration] [decimal](38, 20) NOT NULL,
	[ER Bank Name] [nvarchar](30) NOT NULL,
	[ER Bank Sort Code] [nvarchar](10) NOT NULL,
	[PFC Bank Name] [nvarchar](100) NOT NULL,
	[PFC Bank Sort Code] [nvarchar](10) NOT NULL,
	[Payment Mode] [nvarchar](20) NOT NULL,
	[Instrument Number] [nvarchar](10) NOT NULL,
	[Schedule Total] [decimal](38, 20) NOT NULL,
	[Currency Code] [nvarchar](10) NOT NULL,
	[Custodian Code] [nvarchar](10) NOT NULL,
	[Pencom Batch] [nvarchar](10) NOT NULL,
	[File ID] [nvarchar](20) NOT NULL,
	[Schedule Date] [datetime] NOT NULL,
	[Created By] [nvarchar](50) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Created Time] [datetime] NOT NULL,
	[Contribution Period] [datetime] NOT NULL,
	[Posted] [tinyint] NOT NULL,
	[Schedule ID] [nvarchar](20) NOT NULL,
	[Refund] [tinyint] NOT NULL,
	[Refund To] [nvarchar](20) NOT NULL,
	[Rank Status] [int] NOT NULL,
	[Processed Date] [datetime] NOT NULL,
	[Schedule Status] [int] NOT NULL,
	[Ranking Comments] [nvarchar](100) NOT NULL,
	[Posting Error] [nvarchar](100) NOT NULL,
	[Auto Ranking] [tinyint] NOT NULL,
	[Manual Ranking] [tinyint] NOT NULL,
	[Rank Approval Status] [int] NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[Lock] [tinyint] NOT NULL,
	[Lock By] [nvarchar](50) NOT NULL,
	[Lock DateTime] [datetime] NOT NULL,
	[Lock Reason] [nvarchar](10) NOT NULL,
	[Lodgment Difference] [decimal](38, 20) NOT NULL,
	[Difference Authorizer] [nvarchar](50) NOT NULL,
	[Lodgment Reference] [nvarchar](20) NOT NULL,
	[No of Months] [int] NOT NULL,
	[Additional] [decimal](38, 20) NOT NULL,
	[Additional2] [decimal](38, 20) NOT NULL,
	[IsTrue] [tinyint] NOT NULL,
	[IsTrue2] [tinyint] NOT NULL,
	[Remark] [nvarchar](30) NOT NULL,
	[Remark2] [nvarchar](30) NOT NULL,
	[Refund Initiated] [tinyint] NOT NULL,
	[Refund Posted] [tinyint] NOT NULL,
	[Boolean3] [tinyint] NOT NULL,
	[Boolean4] [tinyint] NOT NULL,
	[Boolean5] [tinyint] NOT NULL,
	[Int1] [int] NOT NULL,
	[Int2] [int] NOT NULL,
	[Int3] [int] NOT NULL,
	[Int4] [int] NOT NULL,
	[Int5] [int] NOT NULL,
	[Dec1] [decimal](38, 20) NOT NULL,
	[Dec2] [decimal](38, 20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule Header]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule Header](
	[File Name] [varchar](100) NOT NULL,
	[No_] [varchar](100) NULL,
	[Schedule Date] [datetime] NULL,
	[Created By] [varchar](100) NULL,
	[Created Date] [datetime] NULL,
	[Created Time] [datetime] NULL,
	[LAst Date Modified] [datetime] NULL,
	[Import Datetime] [datetime] NULL,
 CONSTRAINT [PK_Schedule Header] PRIMARY KEY CLUSTERED 
(
	[File Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule Lines]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule Lines](
	[Fund Code] [nvarchar](10) NOT NULL,
	[DeActivated PIN] [tinyint] NOT NULL,
	[Document No_] [nvarchar](50) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Value Date] [datetime] NOT NULL,
	[Payment Date] [datetime] NOT NULL,
	[Month] [nvarchar](10) NOT NULL,
	[Year] [nvarchar](10) NOT NULL,
	[Employer Code] [nvarchar](30) NOT NULL,
	[Employer Name] [nvarchar](100) NOT NULL,
	[Employee Name] [nvarchar](100) NOT NULL,
	[RSA Pin] [nvarchar](20) NOT NULL,
	[ER Contribution] [decimal](38, 20) NOT NULL,
	[EE Contribution] [decimal](38, 20) NOT NULL,
	[ER AVC] [decimal](38, 20) NOT NULL,
	[EE AVC] [decimal](38, 20) NOT NULL,
	[Total Contribution] [decimal](38, 20) NOT NULL,
	[Cash ID] [nvarchar](12) NOT NULL,
	[C Type] [nvarchar](10) NOT NULL,
	[End Month] [nvarchar](10) NOT NULL,
	[End Year] [nvarchar](10) NOT NULL,
	[Fund Name] [nvarchar](100) NOT NULL,
	[Fund Reference] [nvarchar](30) NOT NULL,
	[Employee Remuneration] [decimal](38, 20) NOT NULL,
	[ER Bank Name] [nvarchar](30) NOT NULL,
	[ER Bank Sort Code] [nvarchar](10) NOT NULL,
	[PFC Bank Name] [nvarchar](100) NOT NULL,
	[PFC Bank Sort Code] [nvarchar](10) NOT NULL,
	[Payment Mode] [nvarchar](20) NOT NULL,
	[Instrument Number] [nvarchar](10) NOT NULL,
	[Schedule Total] [decimal](38, 20) NOT NULL,
	[Currency Code] [nvarchar](10) NOT NULL,
	[Custodian Code] [nvarchar](10) NOT NULL,
	[Pencom Batch] [nvarchar](10) NOT NULL,
	[File ID] [nvarchar](20) NOT NULL,
	[Schedule Date] [datetime] NOT NULL,
	[Created By] [nvarchar](50) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Created Time] [datetime] NOT NULL,
	[Contribution Period] [datetime] NOT NULL,
	[Posted] [tinyint] NOT NULL,
	[Schedule ID] [nvarchar](20) NOT NULL,
	[Refund] [tinyint] NOT NULL,
	[Refund To] [nvarchar](20) NOT NULL,
	[Rank Status] [int] NOT NULL,
	[Processed Date] [datetime] NOT NULL,
	[Schedule Status] [int] NOT NULL,
	[Ranking Comments] [nvarchar](100) NOT NULL,
	[Posting Error] [nvarchar](100) NOT NULL,
	[Auto Ranking] [tinyint] NOT NULL,
	[Manual Ranking] [tinyint] NOT NULL,
	[Rank Approval Status] [int] NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[Lock] [tinyint] NOT NULL,
	[Lock By] [nvarchar](50) NOT NULL,
	[Lock DateTime] [datetime] NOT NULL,
	[Lock Reason] [nvarchar](10) NOT NULL,
	[Lodgment Difference] [decimal](38, 20) NOT NULL,
	[Difference Authorizer] [nvarchar](50) NOT NULL,
	[Lodgment Reference] [nvarchar](20) NOT NULL,
	[No of Months] [int] NOT NULL,
	[Additional] [decimal](38, 20) NOT NULL,
	[Additional2] [decimal](38, 20) NOT NULL,
	[IsTrue] [tinyint] NOT NULL,
	[IsTrue2] [tinyint] NOT NULL,
	[Remark] [nvarchar](30) NOT NULL,
	[Remark2] [nvarchar](30) NOT NULL,
	[Refund Initiated] [tinyint] NOT NULL,
	[Refund Posted] [tinyint] NOT NULL,
	[Boolean3] [tinyint] NOT NULL,
	[Boolean4] [tinyint] NOT NULL,
	[Boolean5] [tinyint] NOT NULL,
	[Int1] [int] NOT NULL,
	[Int2] [int] NOT NULL,
	[Int3] [int] NOT NULL,
	[Int4] [int] NOT NULL,
	[Int5] [int] NOT NULL,
	[Dec1] [decimal](38, 20) NOT NULL,
	[Dec2] [decimal](38, 20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule Lines Back log]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule Lines Back log](
	[Fund Code] [nvarchar](10) NOT NULL,
	[DeActivated PIN] [tinyint] NOT NULL,
	[Document No_] [nvarchar](50) NOT NULL,
	[Line No_] [int] NOT NULL,
	[Value Date] [datetime] NOT NULL,
	[Payment Date] [datetime] NOT NULL,
	[Month] [nvarchar](10) NOT NULL,
	[Year] [nvarchar](10) NOT NULL,
	[Employer Code] [nvarchar](30) NOT NULL,
	[Employer Name] [nvarchar](100) NOT NULL,
	[Employee Name] [nvarchar](100) NOT NULL,
	[RSA Pin] [nvarchar](20) NOT NULL,
	[ER Contribution] [decimal](38, 20) NOT NULL,
	[EE Contribution] [decimal](38, 20) NOT NULL,
	[ER AVC] [decimal](38, 20) NOT NULL,
	[EE AVC] [decimal](38, 20) NOT NULL,
	[Total Contribution] [decimal](38, 20) NOT NULL,
	[Cash ID] [nvarchar](12) NOT NULL,
	[C Type] [nvarchar](10) NOT NULL,
	[End Month] [nvarchar](10) NOT NULL,
	[End Year] [nvarchar](10) NOT NULL,
	[Fund Name] [nvarchar](100) NOT NULL,
	[Fund Reference] [nvarchar](30) NOT NULL,
	[Employee Remuneration] [decimal](38, 20) NOT NULL,
	[ER Bank Name] [nvarchar](30) NOT NULL,
	[ER Bank Sort Code] [nvarchar](10) NOT NULL,
	[PFC Bank Name] [nvarchar](100) NOT NULL,
	[PFC Bank Sort Code] [nvarchar](10) NOT NULL,
	[Payment Mode] [nvarchar](20) NOT NULL,
	[Instrument Number] [nvarchar](10) NOT NULL,
	[Schedule Total] [decimal](38, 20) NOT NULL,
	[Currency Code] [nvarchar](10) NOT NULL,
	[Custodian Code] [nvarchar](10) NOT NULL,
	[Pencom Batch] [nvarchar](10) NOT NULL,
	[File ID] [nvarchar](20) NOT NULL,
	[Schedule Date] [datetime] NOT NULL,
	[Created By] [nvarchar](50) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Created Time] [datetime] NOT NULL,
	[Contribution Period] [datetime] NOT NULL,
	[Posted] [tinyint] NOT NULL,
	[Schedule ID] [nvarchar](20) NOT NULL,
	[Refund] [tinyint] NOT NULL,
	[Refund To] [nvarchar](20) NOT NULL,
	[Rank Status] [int] NOT NULL,
	[Processed Date] [datetime] NOT NULL,
	[Schedule Status] [int] NOT NULL,
	[Ranking Comments] [nvarchar](100) NOT NULL,
	[Posting Error] [nvarchar](100) NOT NULL,
	[Auto Ranking] [tinyint] NOT NULL,
	[Manual Ranking] [tinyint] NOT NULL,
	[Rank Approval Status] [int] NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[Lock] [tinyint] NOT NULL,
	[Lock By] [nvarchar](50) NOT NULL,
	[Lock DateTime] [datetime] NOT NULL,
	[Lock Reason] [nvarchar](10) NOT NULL,
	[Lodgment Difference] [decimal](38, 20) NOT NULL,
	[Difference Authorizer] [nvarchar](50) NOT NULL,
	[Lodgment Reference] [nvarchar](20) NOT NULL,
	[No of Months] [int] NOT NULL,
	[Additional] [decimal](38, 20) NOT NULL,
	[Additional2] [decimal](38, 20) NOT NULL,
	[IsTrue] [tinyint] NOT NULL,
	[IsTrue2] [tinyint] NOT NULL,
	[Remark] [nvarchar](30) NOT NULL,
	[Remark2] [nvarchar](30) NOT NULL,
	[Refund Initiated] [tinyint] NOT NULL,
	[Refund Posted] [tinyint] NOT NULL,
	[Boolean3] [tinyint] NOT NULL,
	[Boolean4] [tinyint] NOT NULL,
	[Boolean5] [tinyint] NOT NULL,
	[Int1] [int] NOT NULL,
	[Int2] [int] NOT NULL,
	[Int3] [int] NOT NULL,
	[Int4] [int] NOT NULL,
	[Int5] [int] NOT NULL,
	[Dec1] [decimal](38, 20) NOT NULL,
	[Dec2] [decimal](38, 20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountChart]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountChart](
	[intRecID] [int] IDENTITY(1,1) NOT NULL,
	[txtAccountNumber] [varchar](50) NOT NULL,
	[txtAccountName] [varchar](100) NULL,
	[intAccountGroup] [int] NULL,
	[isPosting] [bit] NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblAccountChart] PRIMARY KEY CLUSTERED 
(
	[txtAccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountGroup]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountGroup](
	[intAccountGroup] [int] IDENTITY(1,1) NOT NULL,
	[txtAccountGroupName] [varchar](100) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblAccountGroup] PRIMARY KEY CLUSTERED 
(
	[intAccountGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[intCategory] [int] NOT NULL,
	[intCompany] [int] NULL,
	[txtCategoryName] [varchar](50) NULL,
	[txtLedgerAccount] [varchar](50) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[intCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClosingBalance]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClosingBalance](
	[intRecordID] [int] IDENTITY(1,1) NOT NULL,
	[txtAccountCode] [varchar](50) NOT NULL,
	[txtPostPeriod] [varchar](10) NOT NULL,
	[numDebit] [decimal](18, 2) NULL,
	[numCredit] [decimal](18, 2) NULL,
	[dteClosed] [datetime] NULL,
	[txtCloseBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblClosingBalance] PRIMARY KEY CLUSTERED 
(
	[txtAccountCode] ASC,
	[txtPostPeriod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompany]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompany](
	[intCompany] [int] IDENTITY(1,1) NOT NULL,
	[txtCompanyName] [varchar](50) NOT NULL,
	[txtCompanyAddress] [varchar](50) NULL,
	[txtContactPhone] [varchar](50) NULL,
	[txtOfficePhone] [varchar](50) NULL,
	[txtEmailAddress] [varchar](50) NULL,
	[txtVatLedger] [varchar](50) NULL,
	[txtInventoryLedger] [varchar](50) NULL,
	[txtInventoryExpenseLedger] [varchar](50) NULL,
	[txtInventoryIncomeLedger] [varchar](50) NULL,
	[txtRecievableLedger] [varchar](50) NULL,
	[txtPayableLedger] [varchar](50) NULL,
	[txtGeneralIncomeLedger] [varchar](50) NULL,
	[blnConnect2GL] [bit] NULL,
	[blnApplyVat] [bit] NULL,
	[numVatRate] [decimal](18, 2) NULL,
	[dteCreated] [datetime] NULL,
	[btnLogo] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblCompany] PRIMARY KEY CLUSTERED 
(
	[txtCompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[intCustomerID] [int] IDENTITY(1,1) NOT NULL,
	[txtCustomerCode] [varchar](50) NOT NULL,
	[txtTitle] [varchar](100) NULL,
	[txtSex] [nchar](1) NULL,
	[txtCustomerName] [varchar](255) NULL,
	[txtHomeAddress] [varchar](255) NULL,
	[txtOfficeAddress] [varchar](255) NULL,
	[txtTelephone1] [varchar](50) NULL,
	[txtTelephone2] [varchar](50) NULL,
	[txtEmail] [varchar](100) NULL,
	[txtRelationShip] [varchar](50) NULL,
	[txtParentID] [varchar](50) NULL,
	[numCreditLimit] [decimal](18, 2) NULL,
	[dteDOB] [datetime] NULL,
	[dteAnniversory] [datetime] NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[txtCustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[intEmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[txtEmployeeCode] [varchar](50) NOT NULL,
	[txtName] [varchar](50) NULL,
	[txtAddress] [varchar](250) NULL,
	[txtTelephone] [varchar](20) NULL,
	[txtAltTelephone] [varchar](20) NULL,
	[txtRole] [varchar](20) NULL,
	[txtPaymentMode] [varchar](50) NULL,
	[txtNOKName] [varchar](50) NULL,
	[txtNOKTelephone] [varchar](50) NULL,
	[txtNOKRelationship] [varchar](50) NULL,
	[dteCreated] [datetime] NULL,
	[intCompanyID] [int] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[txtEmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblEmployee] UNIQUE NONCLUSTERED 
(
	[intEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeActivities]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeActivities](
	[intActivityID] [int] IDENTITY(1,1) NOT NULL,
	[intWorkItemID] [int] NULL,
	[intEmployeeID] [int] NULL,
	[intActivityType] [int] NULL,
	[intQuantity] [int] NULL,
	[dteCreated] [datetime] NULL,
	[dteDeallocated] [datetime] NULL,
	[txtProductionCode] [varchar](50) NULL,
 CONSTRAINT [PK_tblEmployeeActivities] PRIMARY KEY CLUSTERED 
(
	[intActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExpense]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpense](
	[intExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[txtExpenseCode] [varchar](50) NOT NULL,
	[dteExpense] [datetime] NULL,
	[numAmount] [decimal](18, 2) NULL,
	[txtNarration] [varchar](50) NULL,
	[txtExpenseType] [varchar](50) NULL,
	[txtPaymentSource] [varchar](50) NULL,
	[intCompany] [int] NULL,
	[isReversed] [bit] NULL,
 CONSTRAINT [PK_tblExpense] PRIMARY KEY CLUSTERED 
(
	[intExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGLEntry]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGLEntry](
	[intGLEntry] [int] IDENTITY(1,1) NOT NULL,
	[txtEntryCode] [varchar](50) NULL,
	[dteValueDate] [datetime] NULL,
	[txtLedgerAccount] [varchar](50) NULL,
	[txtMainAccount] [varchar](50) NULL,
	[numDebit] [decimal](18, 2) NULL,
	[numCredit] [decimal](18, 2) NULL,
	[txtNarration] [varchar](255) NULL,
	[txtPostPeriod] [varchar](10) NULL,
	[txtExternalCode] [varchar](50) NULL,
	[dteCreated] [datetime] NULL,
	[txtPostedBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblGLEntry] PRIMARY KEY CLUSTERED 
(
	[intGLEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInventoryEntry]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventoryEntry](
	[intEntryID] [int] IDENTITY(1,1) NOT NULL,
	[txtEntryCode] [varchar](50) NOT NULL,
	[txtItemCode] [varchar](50) NULL,
	[txtVendorCode] [varchar](50) NULL,
	[intQty] [int] NULL,
	[numUnitPrice] [decimal](18, 2) NULL,
	[numTotalPrice] [decimal](18, 2) NULL,
	[intTransType] [int] NULL,
	[dteTransactionDate] [datetime] NULL,
	[txtExternalEntryCode] [varchar](50) NULL,
	[txtStatus] [varchar](50) NULL,
	[dteSentForApproval] [datetime] NULL,
	[dteApproved] [datetime] NULL,
	[txtSentForApprovalBy] [varchar](50) NULL,
	[txtApprovedBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblInventoryEntry] PRIMARY KEY CLUSTERED 
(
	[intEntryID] ASC,
	[txtEntryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInventoryItems]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventoryItems](
	[intInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[txtItemCode] [varchar](50) NOT NULL,
	[txtItemName] [varchar](50) NULL,
	[txtUnitOfMeasure] [varchar](50) NULL,
	[numSellingPrice] [numeric](18, 2) NULL,
	[txtExpenseLedger] [varchar](50) NULL,
	[txtItemType] [char](1) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblInventoryItems] PRIMARY KEY CLUSTERED 
(
	[txtItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInventoryRequisition]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventoryRequisition](
	[intEntryID] [int] IDENTITY(1,1) NOT NULL,
	[txtEntryCode] [varchar](50) NULL,
	[intQty] [int] NULL,
	[dteTransaction] [datetime] NULL,
	[txtExternalEntryCode] [varchar](255) NULL,
	[txtNarration] [varchar](255) NULL,
	[dteCreated] [datetime] NULL,
	[txtStatus] [varchar](50) NULL,
	[dteSentForApproval] [datetime] NULL,
	[txtSentForApprovalBy] [varchar](50) NULL,
	[dteApproved] [datetime] NULL,
	[txtApprovedBy] [varchar](50) NULL,
	[txtExternalCode] [varchar](50) NULL,
 CONSTRAINT [PK_tblIventoryDispense] PRIMARY KEY CLUSTERED 
(
	[intEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItems]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItems](
	[intItemID] [int] IDENTITY(1,1) NOT NULL,
	[intCompany] [int] NULL,
	[txtInventoryCode] [varchar](30) NULL,
	[txtItemName] [varchar](50) NULL,
	[numCostOfSewing] [decimal](18, 2) NULL,
	[numCostOfAlteration] [decimal](18, 2) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblItems] PRIMARY KEY CLUSTERED 
(
	[intItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJournalDetails]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJournalDetails](
	[intJournalLine] [int] IDENTITY(1,1) NOT NULL,
	[txtJournalCode] [varchar](50) NULL,
	[txtPostPeriod] [varchar](10) NULL,
	[txtLedgerAccount] [varchar](20) NULL,
	[txtMainAccount] [varchar](20) NULL,
	[numDebit] [decimal](18, 2) NULL,
	[numCredit] [decimal](18, 2) NULL,
	[txtNarration] [varchar](255) NULL,
	[dteValueDate] [datetime] NULL,
	[dtePostDate] [datetime] NULL,
 CONSTRAINT [PK_tblJournalDetails] PRIMARY KEY CLUSTERED 
(
	[intJournalLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJournalMaster]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJournalMaster](
	[intJournalMaster] [int] IDENTITY(1,1) NOT NULL,
	[txtJournalCode] [varchar](50) NOT NULL,
	[numJournalAmount] [decimal](18, 2) NULL,
	[txtValueDate] [datetime] NULL,
	[txtPostPeriod] [varchar](10) NULL,
	[isPosted] [bit] NULL,
	[dtePostDate] [datetime] NULL,
	[dteCreated] [datetime] NULL,
	[txtStatus] [varchar](20) NULL,
	[dteApproved] [datetime] NULL,
	[dteSentForApproval] [datetime] NULL,
	[txtCreatedBy] [varchar](50) NULL,
	[txtPostedBy] [varchar](50) NULL,
	[txtSentForApprovalBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblJournalMaster] PRIMARY KEY CLUSTERED 
(
	[txtJournalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalCategory]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalCategory](
	[intCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[txtCategoryCode] [varchar](50) NOT NULL,
	[txtCategoryName] [varchar](100) NULL,
 CONSTRAINT [PK_tblMedicalCategory] PRIMARY KEY CLUSTERED 
(
	[txtCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalSubCategory]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalSubCategory](
	[intSubID] [int] IDENTITY(1,1) NOT NULL,
	[txtCategoryCode] [varchar](50) NULL,
	[txtSubCategoryCode] [varchar](50) NOT NULL,
	[txtSubCategoryName] [varchar](100) NULL,
 CONSTRAINT [PK_tblMedicalSubCategory] PRIMARY KEY CLUSTERED 
(
	[txtSubCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalTestType]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalTestType](
	[intTypeID] [int] IDENTITY(1,1) NOT NULL,
	[txtCategoryCode] [varchar](50) NULL,
	[txtSubCategoryCode] [varchar](50) NOT NULL,
	[txtTestCode] [varchar](50) NOT NULL,
	[txtTestName] [varchar](100) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblMedicalTestType] PRIMARY KEY CLUSTERED 
(
	[txtTestCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[intOrderID] [int] IDENTITY(1,1) NOT NULL,
	[txtOrderNumber] [varchar](50) NOT NULL,
	[intCompanyID] [int] NULL,
	[txtCustomerCode] [varchar](50) NULL,
	[numOrderAmount] [decimal](18, 2) NULL,
	[numDiscountAmount] [decimal](18, 2) NULL,
	[numOtherCharges] [decimal](18, 2) NULL,
	[numNetAmount] [decimal](18, 2) NULL,
	[numVAT] [decimal](18, 2) NULL,
	[dteOrderDate] [datetime] NULL,
	[dteDueDate] [datetime] NULL,
	[txtStatus] [varchar](50) NULL,
	[dteSentForApproval] [datetime] NULL,
	[dteConfirmed] [datetime] NULL,
	[dteCreated] [datetime] NULL,
	[txtCreatedBy] [varchar](50) NULL,
	[txtConfirmedBy] [varchar](50) NULL,
	[txtSentForApproval] [varchar](50) NULL,
	[blnHasInventoryItem] [bit] NULL,
 CONSTRAINT [PK_tblCustomerOrder] PRIMARY KEY CLUSTERED 
(
	[txtOrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderItems]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderItems](
	[intOrderItem] [int] IDENTITY(1,1) NOT NULL,
	[txtOrderNumber] [varchar](50) NULL,
	[txtItemCode] [varchar](50) NULL,
	[txtNarration] [varchar](255) NULL,
	[intQty] [int] NULL,
	[numUnitPrice] [decimal](18, 2) NULL,
	[numTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblOrderItems] PRIMARY KEY CLUSTERED 
(
	[intOrderItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderPayment]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderPayment](
	[intPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[txtPaymentRef] [varchar](255) NOT NULL,
	[txtOrderNumber] [varchar](50) NULL,
	[numAmount] [decimal](18, 2) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblOrderPayment] PRIMARY KEY CLUSTERED 
(
	[txtPaymentRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentRequest]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentRequest](
	[intPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[txtPaymentCode] [varchar](50) NULL,
	[intCompany] [int] NULL,
	[dtePayment] [datetime] NULL,
	[txtVendorCode] [varchar](50) NOT NULL,
	[txtRequisitionCode] [varchar](50) NOT NULL,
	[numAmount] [decimal](18, 2) NULL,
	[txtStatus] [varchar](20) NULL,
	[txtPaymentSource] [varchar](20) NULL,
	[txtNarration] [varchar](250) NULL,
	[dteCreated] [datetime] NULL,
	[dteSentForApproval] [datetime] NULL,
	[dteApproved] [datetime] NULL,
	[txtApprovedBy] [varchar](50) NULL,
	[txtCreatedBy] [varchar](50) NULL,
	[txtSentForApprovalBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblPaymentRequest] PRIMARY KEY CLUSTERED 
(
	[intPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPL]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPL](
	[intID] [int] IDENTITY(1,1) NOT NULL,
	[txtTitle] [varchar](50) NULL,
	[intType] [int] NULL,
	[txtScript] [varchar](255) NULL,
	[intOrderID] [int] NULL,
	[txtLedgerAccounts] [varchar](50) NULL,
 CONSTRAINT [PK_tblPL] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPostPeriod]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostPeriod](
	[intPostPeriod] [int] IDENTITY(1,1) NOT NULL,
	[txtPostPeriod] [varchar](50) NOT NULL,
	[dteStartDate] [datetime] NULL,
	[dteEndDate] [datetime] NULL,
	[isYearEnd] [bit] NULL,
	[isPeriodClose] [bit] NULL,
	[dteCreated] [datetime] NULL,
	[dtePeriodClose] [datetime] NULL,
	[txtPeriodCloseBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblPostPeriod] PRIMARY KEY CLUSTERED 
(
	[txtPostPeriod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductionItem]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductionItem](
	[intProductionID] [int] IDENTITY(1,1) NOT NULL,
	[txtProductionCode] [varchar](50) NOT NULL,
	[intCompanyID] [int] NULL,
	[dteDate] [datetime] NULL,
	[intItemID] [int] NULL,
	[txtStatus] [varchar](50) NULL,
	[txtCreatedBy] [varchar](20) NULL,
	[dteSentForApproval] [datetime] NULL,
	[dteApproved] [datetime] NULL,
	[dteReleased] [datetime] NULL,
	[txtApprovedBy] [varchar](50) NULL,
	[txtSentBy] [varchar](50) NULL,
	[txtReleasedBy] [varchar](50) NULL,
	[intCutter] [int] NULL,
	[intTailor] [int] NULL,
	[txtInventoryCode] [varchar](50) NULL,
	[txtInventoryEntryCode] [varchar](50) NULL,
 CONSTRAINT [PK_tblProductionItem] PRIMARY KEY CLUSTERED 
(
	[txtProductionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductionMaterial]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductionMaterial](
	[intProductionMaterialID] [int] IDENTITY(1,1) NOT NULL,
	[txtProductionCode] [varchar](50) NULL,
	[txtInventoryCode] [varchar](50) NULL,
	[intQty] [int] NULL,
	[numUnitPrice] [decimal](18, 2) NULL,
	[numTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblProductionMaterial] PRIMARY KEY CLUSTERED 
(
	[intProductionMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPurchaseRequest]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseRequest](
	[intRequisition] [int] IDENTITY(1,1) NOT NULL,
	[txtRequisitionCode] [varchar](50) NOT NULL,
	[txtVendorCode] [varchar](50) NULL,
	[intCompany] [int] NULL,
	[intRequisitionType] [bit] NULL,
	[txtExpenseLedger] [varchar](50) NULL,
	[txtItemCode] [varchar](50) NULL,
	[intQty] [int] NULL,
	[numUnitPrice] [decimal](18, 2) NULL,
	[numTotalAmount] [decimal](18, 2) NULL,
	[txtDescription] [varchar](50) NULL,
	[dteRequest] [datetime] NULL,
	[dteCreated] [datetime] NULL,
	[txtCreatedBy] [varchar](50) NULL,
	[txtStatus] [varchar](50) NULL,
	[dteSentForApproval] [datetime] NULL,
	[dteApproved] [datetime] NULL,
	[txtApprovedBy] [varchar](50) NULL,
	[txtSentForApprovalBy] [varchar](50) NULL,
 CONSTRAINT [PK_tblPurchaseRequest] PRIMARY KEY CLUSTERED 
(
	[txtRequisitionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReciepts]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReciepts](
	[intRecieptNo] [int] IDENTITY(1,1) NOT NULL,
	[txtRecieptCode] [varchar](50) NULL,
	[txtOrderNumber] [varchar](50) NULL,
	[dteReciept] [datetime] NULL,
	[numAmount] [decimal](18, 2) NULL,
	[txtRecieptType] [varchar](50) NULL,
	[dteReversed] [datetime] NULL,
	[txtNarration] [varchar](255) NULL,
 CONSTRAINT [PK_tblReciepts] PRIMARY KEY CLUSTERED 
(
	[intRecieptNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubAccount]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubAccount](
	[intSubAccount] [int] IDENTITY(1,1) NOT NULL,
	[txtAccountCode] [varchar](50) NOT NULL,
	[txtAccountName] [varchar](50) NULL,
	[txtMainAccount] [varchar](50) NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblSubAccount] PRIMARY KEY CLUSTERED 
(
	[txtAccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserAccess]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserAccess](
	[intAccess] [int] IDENTITY(1,1) NOT NULL,
	[txtGroupCode] [varchar](50) NOT NULL,
	[txtMenuCode] [varchar](50) NOT NULL,
	[blnIsMain] [bit] NULL,
	[blnCreate] [bit] NULL,
	[blnEdit] [bit] NULL,
	[blnDelete] [bit] NULL,
	[blnPrint] [bit] NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblUserAccess] PRIMARY KEY CLUSTERED 
(
	[txtGroupCode] ASC,
	[txtMenuCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserGroup]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserGroup](
	[intAccessGroup] [int] IDENTITY(1,1) NOT NULL,
	[txtGroupCode] [varchar](50) NOT NULL,
	[txtGroupName] [varchar](50) NOT NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblUserGroup] PRIMARY KEY CLUSTERED 
(
	[txtGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[intUser] [int] IDENTITY(1,1) NOT NULL,
	[txtFullName] [varchar](50) NULL,
	[txtSurname] [varchar](50) NULL,
	[txtUserName] [varchar](50) NOT NULL,
	[txtPassword] [varchar](50) NULL,
	[txtUserAccessGroup] [varchar](50) NULL,
	[dteCreated] [datetime] NULL,
	[blnIsActive] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[intUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVendor]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVendor](
	[intVendorID] [int] IDENTITY(1,1) NOT NULL,
	[txtVendorCode] [varchar](50) NOT NULL,
	[txtVendorName] [varchar](50) NOT NULL,
	[txtOfficeAddress] [varchar](50) NULL,
	[txtEmail] [varchar](50) NULL,
	[txtTelephone1] [varchar](50) NOT NULL,
	[txtTelephone2] [varchar](50) NULL,
	[txtTIN] [varchar](50) NULL,
	[txtContactPerson] [varchar](50) NOT NULL,
	[dteCreated] [datetime] NULL,
 CONSTRAINT [PK_tblVendor] PRIMARY KEY CLUSTERED 
(
	[txtVendorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uncleared Upload File]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uncleared Upload File](
	[Line No] [int] NOT NULL,
	[Narration] [nvarchar](250) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Value Date] [datetime] NOT NULL,
	[Transaction Date] [datetime] NOT NULL,
	[Employer Code] [nvarchar](250) NOT NULL,
	[Cash ID] [nvarchar](250) NOT NULL,
	[Upload Code] [nvarchar](10) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[Cleared] [tinyint] NOT NULL,
	[Allocation Date] [datetime] NOT NULL,
	[Lodgment Created] [tinyint] NOT NULL,
	[Date Cleared] [datetime] NOT NULL,
	[Cleared FileName] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccountChart] ADD  CONSTRAINT [DF_tblAccountChart_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblAccountGroup] ADD  CONSTRAINT [DF_tblAccountGroup_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblCompany] ADD  CONSTRAINT [DF_tblCompany_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF_tblCustomer_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblEmployeeActivities] ADD  CONSTRAINT [DF_tblEmployeeActivities_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblExpense] ADD  CONSTRAINT [DF_tblExpense_isReversed]  DEFAULT ((0)) FOR [isReversed]
GO
ALTER TABLE [dbo].[tblGLEntry] ADD  CONSTRAINT [DF_tblGLEntry_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblInventoryEntry] ADD  CONSTRAINT [DF_tblInventoryEntry_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblInventoryItems] ADD  CONSTRAINT [DF_tblInventoryItems_txtItemType]  DEFAULT ('P=Production Item, S= Sales Items') FOR [txtItemType]
GO
ALTER TABLE [dbo].[tblInventoryItems] ADD  CONSTRAINT [DF_tblInventoryItems_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblInventoryRequisition] ADD  CONSTRAINT [DF_tblIventoryDispense_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblInventoryRequisition] ADD  CONSTRAINT [DF_tblInventoryDispense_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblJournalMaster] ADD  CONSTRAINT [DF_tblJournalMaster_isPosted]  DEFAULT ((0)) FOR [isPosted]
GO
ALTER TABLE [dbo].[tblJournalMaster] ADD  CONSTRAINT [DF_tblJournalMaster_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblJournalMaster] ADD  CONSTRAINT [DF_tblJournalMaster_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblMedicalTestType] ADD  CONSTRAINT [DF_tblMedicalTestType_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblOrder] ADD  CONSTRAINT [DF_tblOrder_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblOrder] ADD  CONSTRAINT [DF_tblOrder_blnHasInventoryItem]  DEFAULT ((0)) FOR [blnHasInventoryItem]
GO
ALTER TABLE [dbo].[tblPaymentRequest] ADD  CONSTRAINT [DF_tblPaymentRequest_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblPaymentRequest] ADD  CONSTRAINT [DF_tblPaymentRequest_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblProductionItem] ADD  CONSTRAINT [DF_Table_1_dtedate]  DEFAULT (getdate()) FOR [dteDate]
GO
ALTER TABLE [dbo].[tblProductionItem] ADD  CONSTRAINT [DF_tblProductionItem_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblPurchaseRequest] ADD  CONSTRAINT [DF_tblPurchaseRequest_intCompany]  DEFAULT ((0)) FOR [intCompany]
GO
ALTER TABLE [dbo].[tblPurchaseRequest] ADD  CONSTRAINT [DF_tblPurchaseRequest_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblPurchaseRequest] ADD  CONSTRAINT [DF_tblPurchaseRequest_txtStatus]  DEFAULT ('Open') FOR [txtStatus]
GO
ALTER TABLE [dbo].[tblSubAccount] ADD  CONSTRAINT [DF_tblSubAccount_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblUserAccess] ADD  CONSTRAINT [DF_tblUserAccess_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblUserGroup] ADD  CONSTRAINT [DF_tblUserGroup_dteCreated]  DEFAULT (getdate()) FOR [dteCreated]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_txtStatus]  DEFAULT ((1)) FOR [blnIsActive]
GO
ALTER TABLE [dbo].[tblAccountChart]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountChart_tblAccountGroup] FOREIGN KEY([intAccountGroup])
REFERENCES [dbo].[tblAccountGroup] ([intAccountGroup])
GO
ALTER TABLE [dbo].[tblAccountChart] CHECK CONSTRAINT [FK_tblAccountChart_tblAccountGroup]
GO
ALTER TABLE [dbo].[tblEmployeeActivities]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeActivities_tblEmployee] FOREIGN KEY([intEmployeeID])
REFERENCES [dbo].[tblEmployee] ([intEmployeeID])
GO
ALTER TABLE [dbo].[tblEmployeeActivities] CHECK CONSTRAINT [FK_tblEmployeeActivities_tblEmployee]
GO
ALTER TABLE [dbo].[tblInventoryRequisition]  WITH CHECK ADD  CONSTRAINT [FK_tblIventoryDispense_tblInventoryEntry] FOREIGN KEY([txtEntryCode])
REFERENCES [dbo].[tblInventoryEntry] ([txtEntryCode])
GO
ALTER TABLE [dbo].[tblInventoryRequisition] CHECK CONSTRAINT [FK_tblIventoryDispense_tblInventoryEntry]
GO
ALTER TABLE [dbo].[tblJournalDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblJournalDetails_tblJournalMaster] FOREIGN KEY([txtJournalCode])
REFERENCES [dbo].[tblJournalMaster] ([txtJournalCode])
GO
ALTER TABLE [dbo].[tblJournalDetails] CHECK CONSTRAINT [FK_tblJournalDetails_tblJournalMaster]
GO
ALTER TABLE [dbo].[tblMedicalSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblMedicalSubCategory_tblMedicalCategory] FOREIGN KEY([txtCategoryCode])
REFERENCES [dbo].[tblMedicalCategory] ([txtCategoryCode])
GO
ALTER TABLE [dbo].[tblMedicalSubCategory] CHECK CONSTRAINT [FK_tblMedicalSubCategory_tblMedicalCategory]
GO
ALTER TABLE [dbo].[tblMedicalTestType]  WITH CHECK ADD  CONSTRAINT [FK_tblMedicalTestType_tblMedicalCategory] FOREIGN KEY([txtCategoryCode])
REFERENCES [dbo].[tblMedicalCategory] ([txtCategoryCode])
GO
ALTER TABLE [dbo].[tblMedicalTestType] CHECK CONSTRAINT [FK_tblMedicalTestType_tblMedicalCategory]
GO
ALTER TABLE [dbo].[tblMedicalTestType]  WITH CHECK ADD  CONSTRAINT [FK_tblMedicalTestType_tblMedicalSubCategory] FOREIGN KEY([txtSubCategoryCode])
REFERENCES [dbo].[tblMedicalSubCategory] ([txtSubCategoryCode])
GO
ALTER TABLE [dbo].[tblMedicalTestType] CHECK CONSTRAINT [FK_tblMedicalTestType_tblMedicalSubCategory]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerOrder_tblCustomer] FOREIGN KEY([txtCustomerCode])
REFERENCES [dbo].[tblCustomer] ([txtCustomerCode])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblCustomerOrder_tblCustomer]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblCompany] FOREIGN KEY([intCompanyID])
REFERENCES [dbo].[tblCompany] ([intCompany])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblCompany]
GO
ALTER TABLE [dbo].[tblOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderItems_tblOrder] FOREIGN KEY([txtOrderNumber])
REFERENCES [dbo].[tblOrder] ([txtOrderNumber])
GO
ALTER TABLE [dbo].[tblOrderItems] CHECK CONSTRAINT [FK_tblOrderItems_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderPayment_tblCustomerOrder] FOREIGN KEY([txtOrderNumber])
REFERENCES [dbo].[tblOrder] ([txtOrderNumber])
GO
ALTER TABLE [dbo].[tblOrderPayment] CHECK CONSTRAINT [FK_tblOrderPayment_tblCustomerOrder]
GO
ALTER TABLE [dbo].[tblPaymentRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblPaymentRequest_tblPurchaseRequest] FOREIGN KEY([txtRequisitionCode])
REFERENCES [dbo].[tblPurchaseRequest] ([txtRequisitionCode])
GO
ALTER TABLE [dbo].[tblPaymentRequest] CHECK CONSTRAINT [FK_tblPaymentRequest_tblPurchaseRequest]
GO
ALTER TABLE [dbo].[tblPaymentRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblPaymentRequest_tblVendor] FOREIGN KEY([txtVendorCode])
REFERENCES [dbo].[tblVendor] ([txtVendorCode])
GO
ALTER TABLE [dbo].[tblPaymentRequest] CHECK CONSTRAINT [FK_tblPaymentRequest_tblVendor]
GO
ALTER TABLE [dbo].[tblPurchaseRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseRequest_tblCompany] FOREIGN KEY([intCompany])
REFERENCES [dbo].[tblCompany] ([intCompany])
GO
ALTER TABLE [dbo].[tblPurchaseRequest] CHECK CONSTRAINT [FK_tblPurchaseRequest_tblCompany]
GO
ALTER TABLE [dbo].[tblPurchaseRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseRequest_tblVendor] FOREIGN KEY([txtVendorCode])
REFERENCES [dbo].[tblVendor] ([txtVendorCode])
GO
ALTER TABLE [dbo].[tblPurchaseRequest] CHECK CONSTRAINT [FK_tblPurchaseRequest_tblVendor]
GO
ALTER TABLE [dbo].[tblReciepts]  WITH CHECK ADD  CONSTRAINT [FK_tblReciepts_tblOrder] FOREIGN KEY([txtOrderNumber])
REFERENCES [dbo].[tblOrder] ([txtOrderNumber])
GO
ALTER TABLE [dbo].[tblReciepts] CHECK CONSTRAINT [FK_tblReciepts_tblOrder]
GO
ALTER TABLE [dbo].[tblSubAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblSubAccount_tblAccountChart] FOREIGN KEY([txtMainAccount])
REFERENCES [dbo].[tblAccountChart] ([txtAccountNumber])
GO
ALTER TABLE [dbo].[tblSubAccount] CHECK CONSTRAINT [FK_tblSubAccount_tblAccountChart]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUserGroup] FOREIGN KEY([txtUserAccessGroup])
REFERENCES [dbo].[tblUserGroup] ([txtGroupCode])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblUserGroup]
GO
/****** Object:  StoredProcedure [dbo].[sp_dml_closePeriod]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---3,6,8,1,2,5,7
---exec sp_pm_CleanUploadedApplicationDocuments 'ANN-233'
CREATE PROCEDURE [dbo].[sp_dml_closePeriod] 

--exec sp_dml_closePeriod '202110','202109'
--select * from [tblClosingBalance] order by txtpostperiod
--select * from tblGLEntry where txtMainAccount = '110022'
--select * from [dbo].[tblPostPeriod]

 @periodName varchar(20),
 @prevperiodName varchar(20)

AS

Declare @txtAccountNumber varchar(20) 
Declare @numDebit decimal(18,2) 
Declare @numCredit decimal(18,2) 
Declare @numNet decimal(18,2)
Declare @numNetOpening decimal(18,2)


--Declare @DocID int
--Declare @DocTypeID int
--Declare @DocumentIDs int
---Begin TRY
---Begin Transaction 

if (select count(*) from tblClosingBalance where txtPostPeriod = @periodName) > 1 

	begin
		select 'Failed ! - Period Already Closed'
	end
else

	begin
	
	DECLARE ml_cursor_accountChart CURSOR FOR

		
		--select * from [dbo].[tblAccountChart] 
		--select txtAccountNumber from [dbo].[tblAccountChart] where txtAccountNumber = '102101'
		select txtAccountNumber from [dbo].[tblAccountChart] --where txtAccountNumber = '102101'

			OPEN ml_cursor_accountChart
			WHILE (0=0) 
			BEGIN
			FETCH NEXT FROM ml_cursor_accountChart INTO @txtAccountNumber
			IF (@@FETCH_STATUS <> 0) BREAK

				begin
				set @numCredit = 0
				set @numDebit = 0

				---select * from [tblGLEntry]
				---select * from [tblClosingBalance] where txtpostperiod = '202107'


				    set @numNet = isnull((select sum(numDebit) from [dbo].[tblGLEntry] where txtMainAccount = @txtAccountNumber and txtPostPeriod = @periodName),0) - isnull((select sum(numCredit) from [dbo].[tblGLEntry] where txtMainAccount = @txtAccountNumber and txtPostPeriod = @periodName),0) 
					set @numNetOpening = isnull((select numDebit from [dbo].[tblClosingBalance] where txtAccountCode = @txtAccountNumber and txtPostPeriod = @prevperiodName),0) - isnull((select numCredit from [dbo].[tblClosingBalance] where txtAccountCode = @txtAccountNumber and txtPostPeriod = @prevperiodName),0)

					set @numNet = @numNet + @numNetOpening

					if @numNet > 0
					begin
						set @numDebit = @numNet
						set @numCredit = 0
					end
					else if @numNet < 0

					begin
						set @numDebit = 0
						set @numCredit = abs(@numNet)
					end

					--select * from [tblClosingBalance]

					INSERT INTO [dbo].[tblClosingBalance] ([txtAccountCode],[txtPostPeriod],[numDebit],[numCredit],[dteClosed],[txtCloseBy])
     VALUES (@txtAccountNumber,@periodName,isnull(@numDebit,0),isnull(@numCredit,0),getdate(),'System') 

	

		 ---select * from tblPostPeriod
		
		--set @numDebit =	 isnull((select numDebit from [dbo].[tblClosingBalance] where txtAccountCode = @txtAccountNumber and txtPostPeriod = @prevperiodName),0) + 
					--isnull((select sum(numDebit) from [dbo].[tblGLEntry] where txtMainAccount = @txtAccountNumber and txtPostPeriod = @periodName),0) 

					--set @numCredit = isnull((select numCredit from [dbo].[tblClosingBalance] where txtAccountCode = @txtAccountNumber and txtPostPeriod = @prevperiodName),0) +
					--isnull((select sum(numCredit) from [dbo].[tblGLEntry] where txtMainAccount = @txtAccountNumber and txtPostPeriod = @periodName),0) 
			    end
				--print @txtAccountNumber + ' Debit: ' +  convert(varchar(10),@numDebit) + ' Credit: '  +  convert(varchar(10),@numCredit)
		    end
			--CONVERT(varchar(10),@Number)

			Close      ml_cursor_accountChart
			DeAllocate ml_cursor_accountChart

			update tblPostPeriod set isPeriodClose = 1, dtePeriodClose = getdate(), txtPeriodCloseBy = 'System' 
	        where txtPostPeriod = @periodName


			-- select dateadd(day,1,dteEndDate),dateadd(day,-1,(dateadd(month,2,dteStartDate))), * from tblPostPeriod where txtPostPeriod = '202107'
			
			--select substring(cast(getdate() as varchar(20)),0,8)

	--		COMMIT 
	
	select 'Success ! - Period Closed Successfully'

	end

		


--		select * from tblClosingBalance
---END TRY


---Begin CATCH

---ROLLBACK 

            
---end CATCH;

GO
/****** Object:  StoredProcedure [dbo].[sp_dml_creatPostPeriod]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_dml_creatPostPeriod '202107','2021-07-01','2021-07-31',0
--exec sp_dml_creatPostPeriod '202106','01-06-2021','30-06-2021',0

CREATE PROCEDURE [dbo].[sp_dml_creatPostPeriod]
	-- Add the parameters for the stored procedure here
	@periodName as varchar(20),
	@date1 as date,
	@date2 as date,
	@isYearEnd as bit

AS

BEGIN
	
	if (select count(*) from [dbo].[tblPostPeriod] where [txtPostPeriod] = @periodName)> 0 
	
		 select 'Post Period Already Exist'
	else if (select count(*) from [dbo].[tblPostPeriod] where isPeriodClose = 0) = 2
	select 'No of Allowable Open Period Reached'

	else
	begin
		 INSERT INTO [dbo].[tblPostPeriod] ([txtPostPeriod],[dteStartDate],[dteEndDate],[isYearEnd],[isPeriodClose],[dteCreated])
		 VALUES (@periodName,cast(@date1 as date),cast(@date2 as date),@isYearEnd,0,getdate())

		 select 'Success'
	 end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_dml_getTransactionCode]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec mfund_getMovementBatch
--declare @BatchNo varchar(50)
--exec pm_sp_getMovementBatch 2,@BatchNo

--exec sp_dml_getTransactionCode 'MedCat'

CREATE PROCEDURE [dbo].[sp_dml_getTransactionCode] 



@SourceType varchar(20)

AS

--exec sp_pm_getSPBatch 3,A

Declare @AppID int, @BatchID int, @BatchNo varchar(255)

if @SourceType = 'Journal'

begin
			begin
				if (select COUNT(*) from tblJournalMaster) > 0
					begin
						set @AppID = (select COUNT(*) from tblJournalMaster) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLJNL'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLJNL'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLJNL'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblJournalMaster',RESEED,0)
						set @AppID = (select COUNT(*) from tblJournalMaster) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'Ledger'



begin
			begin
				if (select count(distinct txtEntryCode) from tblGLEntry) > 0
					begin
						set @AppID = (select count(distinct txtEntryCode) from tblGLEntry) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLLDG'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLLDG'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLLDG'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLLDG'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblGLEntry',RESEED,0)
						set @AppID = (select count(distinct txtEntryCode) from tblGLEntry) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLLDG'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'Customer'

begin
			begin
				if (select count(distinct txtCustomerCode) from tblCustomer) > 0
					begin
						set @AppID = (select count(distinct txtCustomerCode) from tblCustomer) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLCUS'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLCUS'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLCUS'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLCUS'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblCustomer',RESEED,0)
						set @AppID = (select count(distinct txtCustomerCode) from tblCustomer) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLCUS'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'InventoryItem'

begin
			begin
				if (select count(distinct txtItemCode) from tblInventoryItems) > 0
					begin
						set @AppID = (select count(distinct txtItemCode) from tblInventoryItems) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLINVI'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLINVI'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLINVI'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLINVI'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblInventoryItems',RESEED,0)
						set @AppID = (select count(distinct txtItemCode) from tblInventoryItems) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLINVI'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'InventoryTran'

begin
			begin
				if (select count(distinct txtEntryCode) from tblInventoryEntry) > 0
					begin
						set @AppID = (select count(distinct txtEntryCode) from tblInventoryEntry) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLINVT'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLINVT'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLINVT'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLINVT'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblInventoryEntry',RESEED,0)
						set @AppID = (select count(distinct txtEntryCode) from tblInventoryEntry) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLINVI'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'Vendor'

begin
			begin
				if (select count(distinct txtVendorCode) from tblVendor) > 0
					begin
						set @AppID = (select count(distinct txtVendorCode) from tblVendor) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLVDR'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLVDR'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLVDR'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLVDR'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblVendor',RESEED,0)
						set @AppID = (select count(distinct txtVendorCode) from tblVendor) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLVDR'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end	

if @SourceType = 'Purchase'

begin
			begin
				if (select count(distinct txtRequisitionCode) from tblPurchaseRequest) > 0
					begin
						set @AppID = (select count(distinct txtRequisitionCode) from tblPurchaseRequest) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLPCR'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLPCR'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLPCR'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLPCR'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblPurchaseRequest',RESEED,0)
						set @AppID = (select count(distinct txtRequisitionCode) from tblPurchaseRequest) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLPCR'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end

if @SourceType = 'Order'

begin
			begin
				if (select count(distinct txtOrderNumber) from tblOrder) > 0
					begin
						set @AppID = (select count(distinct txtOrderNumber) from tblOrder) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLORD'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLORD'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLORD'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLORD'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblOrder',RESEED,0)
						set @AppID = (select count(distinct txtOrderNumber) from tblOrder) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLORD'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'Reciept'

begin
			begin
				if (select count(distinct txtRecieptCode) from tblReciepts) > 0
					begin
						set @AppID = (select count(distinct txtRecieptCode) from tblReciepts) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLRCP'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLRCP'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLRCP'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLRCP'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblReciepts',RESEED,0)
						set @AppID = (select count(distinct txtRecieptCode) from tblReciepts) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLRCP'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end

if @SourceType = 'Expense'

begin
			begin
				if (select count(distinct txtExpenseCode) from tblExpense) > 0
					begin
						set @AppID = (select count(distinct txtExpenseCode) from tblExpense) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLEXP'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLEXP'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLEXP'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLEXP'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblExpense',RESEED,0)
						set @AppID = (select count(distinct txtExpenseCode) from tblExpense) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLEXP'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end

if @SourceType = 'Employee'

begin
			begin
				if (select count(distinct txtEmployeeCode) from tblEmployee) > 0
					begin
						set @AppID = (select count(distinct txtEmployeeCode) from tblEmployee) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLEMP'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLEMP'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLEMP'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLEMP'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblEmployee',RESEED,0)
						set @AppID = (select count(distinct txtEmployeeCode) from tblEmployee) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLEMP'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'Production'

begin
			begin
				if (select count(distinct txtProductionCode) from tblProductionItem) > 0
					begin
						set @AppID = (select count(distinct txtProductionCode) from tblProductionItem) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLPRD'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLPRD'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLPRD'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLPRD'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblProductionItem',RESEED,0)
						set @AppID = (select count(distinct txtProductionCode) from tblProductionItem) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLPRD'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'Payment'

begin
			begin
				if (select count(distinct txtPaymentCode) from tblPaymentRequest) > 0
					begin
						set @AppID = (select count(distinct txtPaymentCode) from tblPaymentRequest) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLPMT'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLPMT'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLPMT'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLPMT'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblPaymentRequest',RESEED,0)
						set @AppID = (select count(distinct txtPaymentCode) from tblPaymentRequest) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLPMT'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'MedCat'

begin
			begin
				if (select count(distinct txtCategoryCode) from tblMedicalCategory) > 0
					begin
						set @AppID = (select count(distinct txtCategoryCode) from tblMedicalCategory) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDMCAT'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDMCAT'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDMCAT'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDMCAT'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblMedicalCategory',RESEED,0)
						set @AppID = (select count(distinct txtCategoryCode) from tblMedicalCategory) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDMCAT'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'MedSubCat'

begin
			begin
				if (select count(distinct txtSubCategoryCode) from tblMedicalSubCategory) > 0
					begin
						set @AppID = (select count(distinct txtSubCategoryCode) from tblMedicalSubCategory) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDMSUB'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDMSUB'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDMSUB'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDMSUB'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblMedicalSubCategory',RESEED,0)
						set @AppID = (select count(distinct txtSubCategoryCode) from tblMedicalSubCategory) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDMSUB'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'MedTest'

begin
			begin
				if (select count(distinct txtTestCode) from tblMedicalTestType) > 0
					begin
						set @AppID = (select count(distinct txtTestCode) from tblMedicalTestType) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDMTST'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDMTST'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDMTST'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDMTST'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblMedicalTestType',RESEED,0)
						set @AppID = (select count(distinct txtTestCode) from tblMedicalTestType) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDMTST'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end


if @SourceType = 'UserGroup'

begin
			begin
				if (select count(distinct txtGroupCode) from tblUserGroup) > 0
					begin
						set @AppID = (select count(distinct txtGroupCode) from tblUserGroup) --+ 1
						if len(@AppID)= 1 
						
					set @BatchNo =	(select 'IDLGRP'+'000'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 2 
					set @BatchNo =	(select 'IDLGRP'+'00'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 3 
					set @BatchNo =	(select 'IDLGRP'+'0'+ convert(varchar(50),@AppID+1) )
					else if len(@AppID)= 4 
					set @BatchNo =	(select 'IDLGRP'+''+ convert(varchar(50),@AppID+1) )
					---set @BatchNo =	(select 'IDLJNL'+'000'+ convert(varchar(50),@AppID+1) + '-' + convert(varchar(20),year(getdate())) +''+ convert(varchar(20),month(getdate()))+ convert(varchar(20),day(getdate()))+'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1))

					end
				else  
					begin
						DBCC CHECKIDENT('tblUserGroup',RESEED,0)
						set @AppID = (select count(distinct txtGroupCode) from tblUserGroup) --+ 1
						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
				set @BatchNo =	(select 'IDLGRP'+'000'+ convert(varchar(50),@AppID+1))
					end
			end
end






		----------------------------Generating the applicationCode----------------------------------------------------------------
--else if @BatchType = 'A'

--begin
--			begin
--				if (select COUNT(*) from tblMemberApplication) > 0
--					begin
					    
--						set @AppID = (select COUNT(*) from tblMemberApplication where fkiAppTypeId = @Apptype ) --+ 1
--						if @AppID < cast((select top 1 substring(txtapplicationcode,5,len(txtapplicationcode)) from tblMemberApplication where fkiAppTypeId = @Apptype order by pkimemberapplicationID desc) as int)
--						set @BatchNo =	isnull((select ltrim(rtrim((txtTypeCode))) from tblApplicationType where pkiAppTypeId = @Apptype),'NAN') +'-'+convert(varchar(20),ISNULL(@AppID,0)+ 2)
--						else
--						set @BatchNo =	isnull((select ltrim(rtrim((txtTypeCode))) from tblApplicationType where pkiAppTypeId = @Apptype),'NAN') +'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1)
--					end
--				else  
--					begin
--						DBCC CHECKIDENT('tblMemberApplication',RESEED,0)
--						set @AppID = (select COUNT(*) from tblMemberApplication where fkiAppTypeId = @Apptype) --+ 1
--						--select 'BATCH'+''+year(getdate()) +''+month(getdate())+day(getdate())+''+ISNULL(@AppID,0)+ 1
--				set @BatchNo =	isnull((select ltrim(rtrim((txtTypeCode))) from tblApplicationType where pkiAppTypeId = @Apptype),'NAN') +'-'+convert(varchar(20),ISNULL(@AppID,0)+ 1)
--					end
--			end
--end
		----------------------------------------------------------------------------------------------------------------------------

select @BatchNo




GO
/****** Object:  StoredProcedure [dbo].[sp_dml_PL]    Script Date: 31-03-2022 10:18:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---3,6,8,1,2,5,7
---exec sp_dml_PL '202111'

CREATE PROCEDURE [dbo].[sp_dml_PL] 

--exec sp_dml_closePeriod '202109','202108'
--select * from [tblClosingBalance] order by txtpostperiod
--select * from tblGLEntry where txtMainAccount = '110022'

 @periodName varchar(20) 

AS

Declare @txtAccountNumber varchar(20) 
Declare @txtTitle varchar(250) 
Declare @numDebit decimal(18,2) 
Declare @numCredit decimal(18,2) 
Declare @numNet decimal(18,2)
Declare @intType int
Declare @intOrderID int
declare @script varchar(300)
declare @balance decimal(18,2)

	begin

			CREATE TABLE #PL
			(
			 txtAccountNumber varchar(100),
			 txtAccountName varchar(50), 
			 numAmount decimal(18,2),
			 intOrderID int,
			 intType int
			)

			--drop table #PL

	
			DECLARE ml_cursor_accountChart CURSOR FOR

			--select * from [dbo].[tblPL]

				select intID, txtTitle, txtScript,intType,intOrderID from [dbo].[tblPL] order by intOrderID asc

					OPEN ml_cursor_accountChart
					WHILE (0=0) 
					BEGIN
							FETCH NEXT FROM ml_cursor_accountChart INTO @txtAccountNumber,@txtTitle, @script,@intType,@intOrderID
							IF (@@FETCH_STATUS <> 0) BREAK

							if @intType > 0 and @intType < 3
								begin
								    set @balance=0
									set @script=  replace(@script,'_period',@periodName)
									DECLARE @temp table (#temp varchar (MAX));
									insert @temp exec (@script)
									SET @balance = isnull((select * from @temp ),0)
									delete from @temp
									set @txtTitle = '    ' + @txtTitle
									insert into #PL values (@txtAccountNumber,@txtTitle,@balance,@intOrderID,@intType) 
									print @script
								end
							else if @intType = 0 
							begin
							    
								insert into #PL values (@txtAccountNumber,@txtTitle,0,@intOrderID,@intType) 

								
							end	

							else if @intType = 3 

							begin

						--	select sum(numAmount)  from _table where intType  in (1)

								set @script=  replace(@script,'_table','#PL')

								    DECLARE @tempp table (#temp varchar (MAX));
									insert @tempp exec (@script)
									SET @balance = (select * from @tempp )
									delete from @tempp

									set @txtTitle = '    ' + @txtTitle
									insert into #PL values (@txtAccountNumber,@txtTitle,@balance,@intOrderID,@intType) 
									print 'here' + @script
								--set @balance = (select sum(numAmount)  from _table where intOrderID in (1,2,3))

							end

							--select	(select sum(numAmount)  from _table where intType  in (3)) - (select sum(numAmount)  from _table where intType  in (4))

							else if @intType = 4 

							begin

						

								set @script=  replace(@script,'_table','#PL')

								--select	(select sum(numAmount)  from _table where intType  in (3)) - (select sum(numAmount)  from _table where intType  in (4))

								    DECLARE @tempp2 table (#temp varchar (MAX));
									insert @tempp2 exec (@script)
									SET @balance = (select * from @tempp2 )
									delete from @tempp2

									set @txtTitle = '    ' + @txtTitle
									insert into #PL values (@txtAccountNumber,@txtTitle,@balance,@intOrderID,@intType) 
									print 'here' + @script
								--set @balance = (select sum(numAmount)  from _table where intOrderID in (1,2,3))

							end

							else if @intType = 5 

							begin

						

								set @script=  replace(@script,'_table','#PL')

								    DECLARE @tempp3 table (#temp varchar (MAX));
									insert @tempp3 exec (@script)
									SET @balance = (select * from @tempp3 )
									delete from @tempp3

									set @txtTitle = '    ' + @txtTitle
									insert into #PL values (@txtAccountNumber,@txtTitle,@balance,@intOrderID,@intType) 
									print 'here' + @script
								--set @balance = (select sum(numAmount)  from _table where intOrderID in (1,2,3))

							end
							

							--select sum(numCredit) from tblGLEntry where txtMainAccount = '200105' and txtPostPeriod = 
					End
   					Close      ml_cursor_accountChart
					DeAllocate ml_cursor_accountChart

					select * from #PL
			--select 'Success ! - Period Closed Successfully'

	end

	


---END TRY


---Begin CATCH

---ROLLBACK 

            
---end CATCH;

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Customer Order, 2 = In house Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblEmployeeActivities', @level2type=N'COLUMN',@level2name=N'intActivityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Headers, 1= Income, 2= Expense, 3= Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPL', @level2type=N'COLUMN',@level2name=N'intType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Inventory, 0 = Non Inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPurchaseRequest', @level2type=N'COLUMN',@level2name=N'intRequisitionType'
GO
