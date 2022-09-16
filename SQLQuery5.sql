create procedure P_UPDATE_CLIENT_ARCHIVE_STATE_VALIDE_ACTIVE
@ID_Client int,
@revision varchar(80),
@ID_Client_archive int 
as begin
update T_Client_Archive SET Valider_archive_client=1 where ID_Client=@ID_Client AND revision=@revision AND ID_Client_archive=@ID_Client_archive
end