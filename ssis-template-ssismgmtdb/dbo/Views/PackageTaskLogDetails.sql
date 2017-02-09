CREATE VIEW dbo.PackageTaskLogDetails
AS
SELECT        TOP (100) dbo.PackageLog.MachineName, dbo.PackageLog.UserName, dbo.PackageLog.PackageName, dbo.PackageLog.PackageStartTime, 
                         dbo.PackageTaskLog.ControlName, MIN(dbo.PackageTaskLog.Task_Start_Time) AS 'Tasks Started', MAX(dbo.PackageTaskLog.Task_End_Time) AS 'Tasks Finished', 
                         DATEPART(ss, MAX(dbo.PackageTaskLog.Task_End_Time) - MIN(dbo.PackageTaskLog.Task_Start_Time)) AS 'Running Time', SUM(DATEPART(ss, 
                         dbo.PackageTaskLog.Task_Execution_Time)) AS 'Execution Seconds', SUM(dbo.PackageStatistics.Rows) AS 'Total Row Count', 
                         SUM(dbo.PackageTaskLog.TotalErrorCount) AS 'Total Error Count', SUM(dbo.PackageTaskLog.TotalWarningCount) AS 'Total Warning Count', 
                         dbo.sysSSISLog.message AS 'TaskMessage'
FROM            dbo.PackageStatistics LEFT OUTER JOIN
                         dbo.PackageTaskLog ON dbo.PackageTaskLog.ControlName = dbo.PackageStatistics.TaskName AND 
                         dbo.PackageTaskLog.PackageLogID = dbo.PackageStatistics.PackageLogID LEFT OUTER JOIN
                         dbo.PackageLog ON dbo.PackageStatistics.PackageLogID = dbo.PackageLog.PackageLogID LEFT OUTER JOIN
                         dbo.sysSSISLog ON dbo.PackageTaskLog.ControlName = dbo.sysSSISLog.source AND dbo.sysSSISLog.event <> 'OnWarning' AND 
                         dbo.sysSSISLog.starttime >= DATEADD(second, DATEDIFF(second, '20000101', dbo.PackageLog.PackageStartTime), '20000101')
GROUP BY dbo.PackageLog.UserName, dbo.PackageLog.MachineName, dbo.PackageLog.PackageName, dbo.PackageTaskLog.ControlName, 
                         dbo.PackageLog.PackageStartTime, dbo.PackageLog.PackageEndTime, dbo.sysSSISLog.message
ORDER BY dbo.PackageLog.PackageStartTime DESC

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[1] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PackageStatistics (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PackageTaskLog (dbo)"
            Begin Extent = 
               Top = 6
               Left = 282
               Bottom = 135
               Right = 499
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PackageLog (dbo)"
            Begin Extent = 
               Top = 6
               Left = 537
               Bottom = 135
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sysSSISLog (dbo)"
            Begin Extent = 
               Top = 6
               Left = 812
               Bottom = 135
               Right = 998
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
       ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'PackageTaskLogDetails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'PackageTaskLogDetails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'PackageTaskLogDetails';

