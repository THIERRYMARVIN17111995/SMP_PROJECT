USE [SMP_SMIB_DATABASE02]
GO
/****** Object:  StoredProcedure [dbo].[P_UPDATE_CLIENT_ARCHIVE_STATE_VALIDE_ACTIVE]    Script Date: 03/07/2022 12:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[P_UPDATE_CLIENT_ARCHIVE_STATE_VALIDE_ACTIVE]
@ID_Client int,
@revision varchar(80)
as begin
update T_Client_Archive SET Valider_archive_client=1 where ID_Client=@ID_Client AND revision=@revision
end