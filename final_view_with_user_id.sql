create view R_Definition_Societe_archivage_original(ID_Societe,NomEnSigle_Societe,NomComplet_Societe,Adresse_Societe,Valider_Societe,ID_Definition,Valider_Definition,
RCCM,NUI,CAPITAL,Tel_1,Tel_2,email_soc,BP,Date,heure,ID_Pays,codepays,Pays,ID_RS,Raison_social,ID_Dep,nomdep,ID_Devise,pays_devise,devise,code,num,ID_Ville,Ville,rev,SocieteID,ID_Societe_archive,dateOP,valider_archive,status_del,logo,ID_Banque,nombanque,numbanque,nomagence,nomvilleb,ID_Compte,numCompte,typ_compte,rib,cl,ID_TR_BS,status_b,status_c,url_file,codepays_in,rev_verif,
ID_Utilisateur,Valider_Util,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
ID_Agent,Valider_Agent,
ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet
) 
as select 
s.ID_Societe,
sa.NomEnSigle_Societe,
sa.NomComplet_Societe,
sa.Adresse_Societe,
s.Valider_Societe,
d.ID_Definition,
d.Valider_Definition,sa.RCCM,sa.NUI,sa.CAPITAL,sa.Tel_1,sa.Tel_2,sa.email_soc,sa.BP,sa.Date_sav,sa.heure_save,p.ID_Pays,p.codepays,p.nompays,rs.ID_RS,rs.nom_rs,dp.ID_Dep,dp.nomdep,dvs.ID_Devise,dvs.pays,dvs.devise,dvs.code,dvs.num,v.ID_Ville,v.nom_ville,sa.revision,sa.Code_soc,sa.ID_Societe_archive,sa.dateOP,sa.valider_archive,sa.status_del,sa.logo,
 b.ID_Banque,b.nombanque,b.numbanque,b.nomagence,b.nomvilleb,c.ID_Compte,c.numCompte,c.typ_compte,c.rib,c.cl,bc.ID_TR_BS,b.status_b,c.status_c,c.url_file,sa.codepays_in,bc.rev_verif,
u.ID_Utilisateur,u.Valider_Util,
ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a.ID_Agent,a.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
cc.ID_Contact,cc.Civilite_Contact,cc.FonctionComplet_Contact,cc.FonctionAbreviation_Contact,cc.Nom_Contact,cc.Prenom_Contact,cc.Email1_Contact,cc.Email2_Contact,cc.Tel1_Contact,cc.Tel2_Contact,cc.Valider_Contact,(cc.Nom_Contact+' '+cc.Prenom_Contact)
from T_Societe s,T_Definition d,T_Pays p,T_Banque b,T_Compte c,T_Raison_social rs,T_Departement dp,T_Devise dvs,T_Ville v,T_Societe_Archive sa,TR_Banque_societe bc,T_Utilisateur u,T_Utilisateur_Archive ua,T_Agent a,T_Agent_Archive ar ,T_Contact cc
where
 s.ID_Societe=d.ID_Societe AND 
sa.ID_Pays=p.ID_Pays  AND
 sa.ID_RS=rs.ID_RS AND 
 dp.ID_Pays=p.ID_Pays AND
  Sa.ID_Devise=dvs.ID_Devise AND 
  c.ID_Banque=b.ID_Banque AND 
  bc.ID_Societe=s.ID_Societe AND 
  bc.ID_Banque=b.ID_Banque AND 
   v.ID_Dep=dp.ID_Dep AND 
   sa.ID_Ville=v.ID_Ville AND 
   sa.ID_Departement=dp.ID_Dep AND
    s.ID_Societe=sa.ID_Societe AND
    u.ID  _Utilisateur=ua.ID_Utilisateur AND 
    sa.ID_Utilisateur=u.ID_Utilisateur AND 
    ua.ID_Agent_Arch=ar.ID_Agent_Arch AND 
    a.ID_Agent=ar.ID_Agent AND 
    cc.ID_Agent_Arch=ar.ID_Agent_Arch AND 
     d.ID_Client IS NULL AND 
     d.ID_Four IS NULL   
     order by ID_Definition desc offset 0 rows;


CREATE  VIEW R_Professionnel_original(
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,Date_sav,heure_save,dateemb,lieunaissance,revision,
  ID_Pays,codepays,nompays,
  ID_Dep,nomdep,
  ID_Ville,nom_ville,
  ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,
  ID_Union,
  ID_Definition,Valider_Definition,rev_s,rev_f,rev_c,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,valider_archive,NomEnSigle_Societe,NomComplet_Societe,status_del,logo,
  ID_Pro,Prestation,Salaire,
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Utilisateur,status_af,codepays_in,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_TEMP_INFO_P_TR,revision_temp,valider_tempo_t,
  ID_TEMP_INFO_P,status_en,status_sup,status_valid,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,lieuaffecta,Valider_Util,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,nom_complet
  ) as select 
   a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.Date_sav,ar.heure_save,ar.dateemb,ar.lieunaissance,ar.revision,
  p.ID_Pays,p.codepays,p.nompays,
  dp.ID_Dep,dp.nomdep,
  v.ID_Ville,v.nom_ville,
  c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,
  u.ID_Union,
  d.ID_Definition,d.Valider_Definition,d.rev_s,d.rev_f,d.rev_c,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.valider_archive,sar.NomEnSigle_Societe,sar.NomComplet_Societe,sar.status_del,sar.logo,
  pr.ID_Pro,pr.Prestation,pr.Salaire,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
  users.ID_Utilisateur,ar.status_af,ar.codepays_in,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  tr.ID_TEMP_INFO_P_TR,tr.revision_temp,tr.valider_tempo_t,
  t.ID_TEMP_INFO_P,t.status_en,status_sup,t.status_valid,
  ti.ID_Titre,ti.nom_titre,
  tri.ID_TR_CORPS_TITRE,pr.lieuaffecta,users.Valider_Util,
  ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,(c.Nom_Contact+' '+c.Prenom_Contact)
  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Departement dp,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_Utilisateur_Archive ua,T_TITRE ti,TR_CORPS_TITRE tri,T_TEMP_INFO_PRO t ,T_Ville v,T_Contact c,T_Union u ,T_Definition d,T_Societe s,T_Societe_Archive sar,T_Prof pr,T_Corps cprs,T_Utilisateur users,T_Fonction f
   WHERE 
  ar.ID_Agent=a.ID_Agent AND 
  ar.ID_Pays=p.ID_Pays AND 
  ar.ID_Dep=dp.ID_Dep AND 
  dp.ID_Pays=p.ID_Pays AND 
  ar.ID_Ville=v.ID_Ville AND
  v.ID_Dep=dp.ID_Dep AND 
  ar.ID_Agent_Arch=c.ID_Agent_Arch AND 
  u.ID_Contact=c.ID_Contact AND
  u.ID_Definition=d.ID_Definition AND 
  d.ID_Societe=s.ID_Societe AND 
  s.ID_Societe=sar.ID_Societe AND
  c.ID_Contact=pr.ID_Contact AND 
  pr.ID_Corps=cprs.ID_Corps AND 
  f.ID_Fonction=t.ID_Fonction AND
  t.ID_Corps=cprs.ID_Corps AND 
  tr.ID_TEMP_INFO_P=t.ID_TEMP_INFO_P AND 
  tr.ID_Agent_Arch=ar.ID_Agent_Arch and
  f.ID_TR_CORPS_TITRE=tri.ID_TR_CORPS_TITRE AND
  cprs.ID_Corps=tri.ID_Corps AND
  ti.ID_Titre=tri.ID_Titre AND 
  ua.ID_Utilisateur=users.ID_Utilisateur AND
  ua.ID_Agent_Arch=ar.ID_Agent_Arch AND 
  ar.ID_Utilisateur=users.ID_Utilisateur;



CREATE VIEW R_Client_Definition_true(ID_Client,
Valider_Client,
ID_Utilisateur,Valider_Util,
ID_Client_archive,
NomEnSigle_Client,
NomComplet_Client,
Adresse_Client,
ConditionPaiement_Client,
RCCM,
NUI,
Tel_1,
Tel_2,
email_client,
BP,
Date_sav,
heure_save,
Valider_archive_client,
ID_Pays,
codepays,
nompays,
ID_TVA,
libelletva,
ID_RS,
nom_rs,
ID_Departement,
nomdep,
ID_Devise,
pays,
devise,
code,
num,
revision,
Code_Client,
ID_Ville,
nom_ville,
ID_Definition,
Valider_Definition,
ID_Societe,
NomEnSigle_Societe,
NomComplet_Societe,
Valider_Societe,valider_archive,
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_archive,Valider_cl,codepays_in,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
ID_Agent,Valider_Agent,
ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet
) as select 
cl.ID_Client,
cl.Valider_Client,
u.ID_Utilisateur,u.Valider_Util,
clr.ID_Client_archive,
clr.NomEnSigle_Client,
clr.NomComplet_Client,
clr.Adresse_Client,
clr.ConditionPaiement_Client,
clr.RCCM,
clr.NUI,
clr.Tel_1,
clr.Tel_2,
clr.email_client,
clr.BP,
clr.Date_sav,
clr.heure_save,
clr.Valider_archive_client,
p.ID_Pays,
p.codepays,
p.nompays,
tva.ID_TVA,
tva.libelletva,
rs.ID_RS,
rs.nom_rs,
dp.ID_Dep,
dp.nomdep,
dvs.ID_Devise,
dvs.pays,
dvs.devise,
dvs.code,
dvs.num,
clr.revision,
clr.Code_Client,
v.ID_Ville,
v.nom_ville,
df.ID_Definition,
df.Valider_Definition,
t.ID_Societe,
sar.NomEnSigle_Societe,
sar.NomComplet_Societe,
s.Valider_Societe,
sar.valider_archive,
CONCAT(clr.ConditionPaiement_Client,' Jours') AS condition_p,
clr.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_archive,td.Valider_cl,clr.codepays_in,
ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a.ID_Agent,a.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact)
FROM T_Tempo_definition_archive td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Client_Archive clr ON  td.ID_Client_archive=clr.ID_Client_archive
INNER JOIN T_Client cl ON  df.ID_Client=cl.ID_Client AND cl.ID_Client=clr.ID_Client 
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=clr.ID_Utilisateur 
INNER JOIN T_Pays p ON clr.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON clr.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_TVA tva ON tva.ID_TVA=clr.ID_TVA
INNER JOIN T_Utilisateur_Archive ua ON ua.ID_Utilisateur=u.ID_Utilisateur
INNER JOIN T_Agent_Archive ar ON ar.ID_Agent_Arch=ua.ID_Agent_Arch
INNER JOIN T_Agent a ON a.ID_Agent=ar.ID_Agent
INNER JOIN T_Contact c ON c.ID_Agent_Arch=ar.ID_Agent_Arch
LEFT JOIN  T_Devise dvs ON clr.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=clr.ID_RS;


CREATE VIEW R_Fournisseur_Definition_true(
ID_Four_Archive,
ID_Four,
ID_Utilisateur,Valider_Util
Valider_Four,
Valider_f_archive,
NomEnSigle_Four,
NomComplet_Four,
Adresse_Four,
ConditionPaiement_Four,
RCCM,
NUI,
Tel_1,
Tel_2,
email_f,
BP,
Date_sav,
heure_save,
ID_Pays,
codepays,
nompays,
ID_TVA,
libelletva,
ID_RS,
nom_rs,
ID_Departement,
nomdep,
ID_Devise,
pays,
devise,
code,
num,
revision,
Code_four,
ID_Ville,
nom_ville,
ID_Definition,
Valider_Definition,
ID_Societe,
NomEnSigle_Societe,
NomComplet_Societe,
Valider_Societe,
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_fourni,Valider_fo,valider_archive,codepays_in,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
ID_Agent,Valider_Agent,
ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet
) as select 
fa.ID_Four_Archive,
f.ID_Four,
f.ID_Utilisateur,
f.Valider_Four,
fa.Valider_f_archive,
fa.NomEnSigle_Four,
fa.NomComplet_Four,
fa.Adresse_Four,
fa.ConditionPaiement_Four,
fa.RCCM,
fa.NUI,
fa.Tel_1,
fa.Tel_2,
fa.email_f,
fa.BP,
fa.Date_sav,
fa.heure_save,
p.ID_Pays,
p.codepays,
p.nompays,
tva.ID_TVA,
tva.libelletva,
rs.ID_RS,
rs.nom_rs,
dp.ID_Dep,
dp.nomdep,
dvs.ID_Devise,
dvs.pays,
dvs.devise,
dvs.code,
dvs.num,
fa.revision,
fa.Code_four,
v.ID_Ville,
v.nom_ville,
df.ID_Definition,
df.Valider_Definition,
s.ID_Societe,
sar.NomEnSigle_Societe,
sar.NomComplet_Societe,
s.Valider_Societe,
CONCAT(fa.ConditionPaiement_Four,' Jours') as condition_P,
fa.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_fourni,td.Valider_fo,sar.valider_archive,fa.codepays_in,
ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a.ID_Agent,a.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact)
FROM T_Tempo_definition_archive_fourni td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Fournisseur_Archive fa ON td.ID_Four_Archive=fa.ID_Four_Archive
INNER JOIN T_Fournisseur f ON f.ID_Four=fa.ID_Four AND  df.ID_Four=f.ID_Four
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=fa.ID_Utilisateur
INNER JOIN T_Pays p ON fa.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON fa.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_TVA tva ON tva.ID_TVA=fa.ID_TVA 
INNER JOIN T_Utilisateur_Archive ua ON ua.ID_Utilisateur=u.ID_Utilisateur
INNER JOIN T_Agent_Archive ar ON ar.ID_Agent_Arch=ua.ID_Agent_Arch
INNER JOIN T_Agent a ON a.ID_Agent=ar.ID_Agent
INNER JOIN T_Contact c ON c.ID_Agent_Arch=ar.ID_Agent_Arch
LEFT JOIN  T_Devise dvs ON fa.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=fa.ID_RS;




CREATE VIEW R_CONTACT_CLIENT(
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Union,Valider_unition,revision_union
  ID_Contact_four_client,Valider_contact_four,
  ID_Contact_four_client_archive,Valider_contact_four_archive,nom_c_f,prenom_c_f,civilite_c_f,email_f_c_one,email_f_c_two,tel_one_f_c,tel_two_f_c,revision_f_c,code_contact_f_c,Date,Heure,
  ID_Utilisateur,Valider_Util,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Client,Valider_Client,
  ID_Client_archive,NomEnSigle_Client,Valider_archive_client,NomComplet_Client,
  ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
  ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet
) as select 
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.NomEnSigle_Societe,sar.valider_archive,
  u.ID_Union,u.Valider_unition,u.revision_union,
  cc.ID_Contact_four_client,cc.Valider_contact_four,
  car.ID_Contact_four_client_archive,car.Valider_contact_four_archive,car.nom_c_f,car.prenom_c_f,car.civilite_c_f,car.email_f_c_one,car.email_f_c_two,car.tel_one_f_c,car.tel_two_f_c,car.revision_f_c,car.code_contact_f_c,car.Date,car.Heure,
  users.ID_Utilisateur,users.Valider_Util,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  t.ID_Titre,t.nom_titre,
  tr.ID_TR_CORPS_TITRE,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
  cl.ID_Client,cl.Valider_Client,
  clr.ID_Client_archive,clr.NomEnSigle_Client,clr.Valider_archive_client,clr.NomComplet_Client,
  ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a.ID_Agent,a.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact)
  FROM T_Definition d,T_Societe s,T_Client cl,T_Agent a,T_Agent_Archive ar,T_Contact c,T_Utilisateur_Archive ua,T_Client_Archive clr,T_Societe_Archive sar,T_Union u,T_Contact_Four_Client cc,T_Contact_Four_Client_Archive car,T_Utilisateur users,T_Fonction f,T_TITRE t,TR_CORPS_TITRE tr,T_Corps cprs
  where 
  d.ID_Definition=u.ID_Definition AND 
  d.ID_Client=cl.ID_Client AND
  clr.ID_Client=cl.ID_Client AND 
  d.ID_Societe=s.ID_Societe AND 
  sar.ID_Societe=s.ID_Societe AND 
  u.ID_Contact_four_client_archive=car.ID_Contact_four_client_archive AND
  cc.ID_Contact_four_client=car.ID_Contact_four_client AND
  f.ID_TR_CORPS_TITRE=tr.ID_TR_CORPS_TITRE AND 
  f.ID_Fonction=car.ID_Fonction AND 
  tr.ID_Titre=t.ID_Titre AND 
  tr.ID_Corps=cprs.ID_Corps AND
  valider_archive=1 and Valider_archive_client=1 AND ua.Valider_Util_archive=1 AND
  users.ID_Utilisateur=ua.ID_Utilisateur AND 
  car.ID_Utilisateur=ua.ID_Utilisateur AND 
  ua.ID_Agent_Arch=ar.ID_Agent_Arch AND 
  a.ID_Agent=ar.ID_Agent AND 
  c.ID_Agent_Arch=ar.ID_Agent_Arch;




  CREATE VIEW R_CONTACT_FOURNISSEUR00(
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Union,Valider_unition,revision_union,
  ID_Contact_four_client,Valider_contact_four,
  ID_Contact_four_client_archive,Valider_contact_four_archive,nom_c_f,prenom_c_f,civilite_c_f,email_f_c_one,email_f_c_two,tel_one_f_c,tel_two_f_c,revision_f_c,code_contact_f_c,Date,Heure,
  ID_Utilisateur,Valider_Util,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Four,Valider_Four,
  ID_Four_Archive,NomEnSigle_Four,Valider_f_archive,NomComplet_Four,
  ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
  ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet

) as select 
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.NomEnSigle_Societe,sar.valider_archive,
  u.ID_Union,u.Valider_unition,u.revision_union,
  cc.ID_Contact_four_client,cc.Valider_contact_four,
  car.ID_Contact_four_client_archive,car.Valider_contact_four_archive,car.nom_c_f,car.prenom_c_f,car.civilite_c_f,car.email_f_c_one,car.email_f_c_two,car.tel_one_f_c,car.tel_two_f_c,car.revision_f_c,car.code_contact_f_c,car.Date,car.Heure,
  users.ID_Utilisateur,users.Valider_Util,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  t.ID_Titre,t.nom_titre,
  tr.ID_TR_CORPS_TITRE,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
  fo.ID_Four,fo.Valider_Four,
  forn.ID_Four_Archive,forn.NomEnSigle_Four,forn.Valider_f_archive,forn.NomComplet_Four,
  ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
  a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
  c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact)
  FROM T_Definition d,T_Societe s,T_Fournisseur fo,T_Fournisseur_Archive forn,T_Agent a,T_Agent_Archive ar,T_Contact c,T_Utilisateur_Archive ua,T_Societe_Archive sar,T_Union u,T_Contact_Four_Client cc,T_Contact_Four_Client_Archive car,T_Utilisateur users,T_Fonction f,T_TITRE t,TR_CORPS_TITRE tr,T_Corps cprs
  where 
  d.ID_Definition=u.ID_Definition AND 
  d.ID_Four=fo.ID_Four AND
  fo.ID_Four=forn.ID_Four AND 
  d.ID_Societe=s.ID_Societe AND 
  sar.ID_Societe=s.ID_Societe AND 
  u.ID_Contact_four_client_archive=car.ID_Contact_four_client_archive AND
  cc.ID_Contact_four_client=car.ID_Contact_four_client AND
  f.ID_TR_CORPS_TITRE=tr.ID_TR_CORPS_TITRE AND 
  f.ID_Fonction=car.ID_Fonction AND 
  tr.ID_Titre=t.ID_Titre AND 
    valider_archive=1 and Valider_f_archive=1 AND ua.Valider_Util_archive=1 AND
  tr.ID_Corps=cprs.ID_Corps AND
  users.ID_Utilisateur=ua.ID_Utilisateur AND 
  car.ID_Utilisateur=ua.ID_Utilisateur AND 
  ua.ID_Agent_Arch=ar.ID_Agent_Arch AND 
  a.ID_Agent=ar.ID_Agent AND 
  c.ID_Agent_Arch=ar.ID_Agent_Arch;


      
CREATE VIEW R_CONTRAT(ID_Client,
Valider_Client,
ID_Utilisateur,Valider_Util,
ID_Client_archive,
NomEnSigle_Client,
NomComplet_Client,
Adresse_Client,
ConditionPaiement_Client,
RCCM,
NUI,
Tel_1,
Tel_2,
email_client,
BP,
Date_sav,
heure_save,
Valider_archive_client,
ID_Pays,
codepays,
nompays,
ID_TVA,
libelletva,
ID_RS,
nom_rs,
ID_Departement,
nomdep,
ID_Devise,
pays,
devise,
code,
num,
revision,
Code_Client,
ID_Ville,
nom_ville,
ID_Definition,
Valider_Definition,
ID_Societe,
NomEnSigle_Societe,
NomComplet_Societe,
Valider_Societe,valider_archive,
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_archive,Valider_cl,codepays_in,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
ID_Agent,Valider_Agent,
ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet,
ID_Contrat,valider_contrat,
ID_Contrat_archive,valider_contrat_archive,Date,Heure,titre_contrat,Preventif,Curatif,codecontrat,revision_contrat
) as select 
cl.ID_Client,
cl.Valider_Client,
u.ID_Utilisateur,u.Valider_Util,
clr.ID_Client_archive,
clr.NomEnSigle_Client,
clr.NomComplet_Client,
clr.Adresse_Client,
clr.ConditionPaiement_Client,
clr.RCCM,
clr.NUI,
clr.Tel_1,
clr.Tel_2,
clr.email_client,
clr.BP,
clr.Date_sav,
clr.heure_save,
clr.Valider_archive_client,
p.ID_Pays,
p.codepays,
p.nompays,
tva.ID_TVA,
tva.libelletva,
rs.ID_RS,
rs.nom_rs,
dp.ID_Dep,
dp.nomdep,
dvs.ID_Devise,
dvs.pays,
dvs.devise,
dvs.code,
dvs.num,
clr.revision,
clr.Code_Client,
v.ID_Ville,
v.nom_ville,
df.ID_Definition,
df.Valider_Definition,
t.ID_Societe,
sar.NomEnSigle_Societe,
sar.NomComplet_Societe,
s.Valider_Societe,
sar.valider_archive,
CONCAT(clr.ConditionPaiement_Client,' Jours') AS condition_p,
clr.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_archive,td.Valider_cl,clr.codepays_in,
ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a.ID_Agent,a.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact),
ct.ID_Contrat,ct.valider_contrat,
ctr.ID_Contrat_archive,ctr.valider_contrat_archive,ctr.Date,ctr.Heure,ctr.titre_contrat,ctr.Preventif,ctr.Curatif,ctr.codecontrat,ctr.revision_contrat
FROM T_Tempo_definition_archive td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Client_Archive clr ON  td.ID_Client_archive=clr.ID_Client_archive
INNER JOIN T_Client cl ON  df.ID_Client=cl.ID_Client AND cl.ID_Client=clr.ID_Client 
INNER JOIN T_Pays p ON clr.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON clr.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_TVA tva ON tva.ID_TVA=clr.ID_TVA
INNER JOIN T_Contrat_Archive ctr ON df.ID_Definition=ctr.ID_Definition
INNER JOIN T_Contrat ct ON ct.ID_Contrat=ctr.ID_Contrat
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=ctr.ID_Utilisateur 
INNER JOIN T_Utilisateur_Archive ua ON ua.ID_Utilisateur=u.ID_Utilisateur
INNER JOIN T_Agent_Archive ar ON ar.ID_Agent_Arch=ua.ID_Agent_Arch
INNER JOIN T_Agent a ON a.ID_Agent=ar.ID_Agent
INNER JOIN T_Contact c ON c.ID_Agent_Arch=ar.ID_Agent_Arch
LEFT JOIN  T_Devise dvs ON clr.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=clr.ID_RS;





CREATE VIEW R_CONTRAT_APP_TRUE(ID_Client,
Valider_Client,
ID_Utilisateur,Valider_Util,
ID_Client_archive,
NomEnSigle_Client,
NomComplet_Client,
Adresse_Client,
ConditionPaiement_Client,
RCCM,
NUI,
Tel_1,
Tel_2,
email_client,
BP,
Date_sav,
heure_save,
Valider_archive_client,
ID_Pays,
codepays,
nompays,
ID_TVA,
libelletva,
ID_RS,
nom_rs,
ID_Departement,
nomdep,
ID_Devise,
pays,
devise,
code,
num,
revision,
Code_Client,
ID_Ville,
nom_ville,
ID_Definition,
Valider_Definition,
ID_Societe,
NomEnSigle_Societe,
NomComplet_Societe,
Valider_Societe,valider_archive,
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_archive,Valider_cl,codepays_in,
ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,statusLog,username,
ID_Agent,Valider_Agent,
ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,dateemb,lieunaissance,
ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,nom_complet,
ID_Contrat,valider_contrat,
ID_Contrat_archive,valider_contrat_archive,Date,Heure,titre_contrat,Preventif,Curatif,codecontrat,revision_contrat,
ID_App,
ID_AppAppareilDist,Type_AppDist,Marque_AppAppareilDist,Compteur_AppAppareilDist,
ID_AppAirCond,Marque_AirCond,Puissance_AirCondBTU,Type_Gaz,
ID_AppBachEau,Marque_AppBachEau,Puissance_AppBachEau,
ID_AppCuve,Marque_AppCuve,Puissance_AppCuve,
ID_AppGrpElect,Marque_AppGrpElect,Puissance_AppGrpElect,
ID_AppOnduleur,Marque_AppOnduleur,Puissance_AppOnduleur,
ID_AppReseau,Marque_AppReseau,Puissance_AppReseau,
ID_AppSurpresseur,Marque_AppSurpresseur,Puissance_AppSurpresseur,
ID_AppTuyauterie,Marque_AppTuyauterie,Puissance_AppTuyauterie,
ID_Corps,Abreviation_Corps,Nom_Corps,
ID_SousCorps,Nom_SousCorps,
ID_Site,NOM_Site,marque,puissance,num_serie
) as select 
cl.ID_Client,
cl.Valider_Client,
u.ID_Utilisateur,u.Valider_Util,
clr.ID_Client_archive,
clr.NomEnSigle_Client,
clr.NomComplet_Client,
clr.Adresse_Client,
clr.ConditionPaiement_Client,
clr.RCCM,
clr.NUI,
clr.Tel_1,
clr.Tel_2,
clr.email_client,
clr.BP,
clr.Date_sav,
clr.heure_save,
clr.Valider_archive_client,
p.ID_Pays,
p.codepays,
p.nompays,
tva.ID_TVA,
tva.libelletva,
rs.ID_RS,
rs.nom_rs,
dp.ID_Dep,
dp.nomdep,
dvs.ID_Devise,
dvs.pays,
dvs.devise,
dvs.code,
dvs.num,
clr.revision,
clr.Code_Client,
v.ID_Ville,
v.nom_ville,
df.ID_Definition,
df.Valider_Definition,
t.ID_Societe,
sar.NomEnSigle_Societe,
sar.NomComplet_Societe,
s.Valider_Societe,
sar.valider_archive,
CONCAT(clr.ConditionPaiement_Client,' Jours') AS condition_p,
clr.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_archive,td.Valider_cl,clr.codepays_in,
ua.ID_Utilisateur_Archive,ua.revision_user,ua.MotDePasse_Util,ua.Valider_Util_archive,ua.codeuser,ua.statusLog,ua.username,
a10.ID_Agent,a10.Valider_Agent,
ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.dateemb,ar.lieunaissance,
c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,(c.Nom_Contact+' '+c.Prenom_Contact),
ct.ID_Contrat,ct.valider_contrat,
ctr.ID_Contrat_archive,ctr.valider_contrat_archive,ctr.Date,ctr.Heure,ctr.titre_contrat,ctr.Preventif,ctr.Curatif,ctr.codecontrat,ctr.revision_contrat,
app.ID_App,
a.ID_AppAppareilDist,a.Type_AppDist,a.Marque_AppAppareilDist,a.Compteur_AppAppareilDist,
a1.ID_AppAirCond,a1.Marque_AirCond,a1.Puissance_AirCondBTU,a1.Type_Gaz,
a2.ID_AppBachEau,a2.Marque_AppBachEau,a2.Puissance_AppBachEau,
a3.ID_AppCuve,a3.Marque_AppCuve,a3.Puissance_AppCuve,
a4.ID_AppGrpElect,a4.Marque_AppGrpElect,a4.Puissance_AppGrpElect,
a5.ID_AppOnduleur,a5.Marque_AppOnduleur,a5.Puissance_AppOnduleur,
a6.ID_AppReseau,a6.Marque_AppReseau,a6.Puissance_AppReseau,
a7.ID_AppSurpresseur,a7.Marque_AppSurpresseur,a7.Puissance_AppSurpresseur,
a8.ID_AppTuyauterie,a8.Marque_AppTuyauterie,a8.Puissance_AppTuyauterie,
cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
cprs_s.ID_SousCorps,cprs_s.Nom_SousCorps,
si.ID_Site,si.NOM_Site,
CONCAT(a.Marque_AppAppareilDist,a1.Marque_AirCond,a2.Marque_AppBachEau,a3.Marque_AppCuve,a4.Marque_AppGrpElect,a5.Marque_AppOnduleur,a6.Marque_AppReseau,a7.Marque_AppSurpresseur,a8.Marque_AppTuyauterie) AS Marque,
CONCAT(a1.Puissance_AirCondBTU,a2.Puissance_AppBachEau,a3.Puissance_AppCuve,a4.Puissance_AppGrpElect,a5.Puissance_AppOnduleur,a6.Puissance_AppReseau,a7.Puissance_AppSurpresseur,a8.Puissance_AppTuyauterie) AS puissance,
CONCAT(a.num_serie,a1.num_serie,a2.num_serie,a3.num_serie,a4.num_serie,a5.num_serie,a6.num_serie,a7.num_serie,a8.num_serie) AS num_serie
FROM T_Tempo_definition_archive td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Client_Archive clr ON  td.ID_Client_archive=clr.ID_Client_archive
INNER JOIN T_Client cl ON  df.ID_Client=cl.ID_Client AND cl.ID_Client=clr.ID_Client 
INNER JOIN T_TVA tva ON tva.ID_TVA=clr.ID_TVA
INNER JOIN T_Contrat_Archive ctr ON df.ID_Definition=ctr.ID_Definition
INNER JOIN T_App app ON ctr.ID_Contrat_Archive=app.ID_Contrat_Archive
LEFT JOIN T_AppAppareilDist a ON a.ID_AppAppareilDist=app.ID_AppAppareilDist
INNER JOIN  T_Site si ON app.ID_Site=si.ID_Site
INNER JOIN T_Pays p ON si.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON si.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_Contrat ct ON ct.ID_Contrat=ctr.ID_Contrat
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=ctr.ID_Utilisateur 
INNER JOIN T_Utilisateur_Archive ua ON ua.ID_Utilisateur=u.ID_Utilisateur
INNER JOIN T_Agent_Archive ar ON ar.ID_Agent_Arch=ua.ID_Agent_Arch
INNER JOIN T_Agent a10 ON a10.ID_Agent=ar.ID_Agent
INNER JOIN T_Contact c ON c.ID_Agent_Arch=ar.ID_Agent_Arch
LEFT JOIN  T_Devise dvs ON clr.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=clr.ID_RS
LEFT JOIN T_AirCondit a1 ON app.ID_AppAirCond=a1.ID_AppAirCond
LEFT JOIN T_AppBachEau a2 ON app.ID_AppBachEau=a2.ID_AppBachEau 
LEFT JOIN T_AppCuve a3 ON app.ID_AppCuve=a3.ID_AppCuve 
LEFT JOIN T_AppGrpElect a4 ON app.ID_AppGrpElect=a4.ID_AppGrpElect
LEFT JOIN T_AppOnduleur a5 ON app.ID_AppOnduleur=a5.ID_AppOnduleur
LEFT JOIN T_AppResauxApp a6 ON  app.ID_AppReseau=a6.ID_AppReseau
LEFT JOIN T_AppSurpresseur a7 ON app.ID_AppSurpresseur=a7.ID_AppSurpresseur
LEFT JOIN T_AppTuyauterie a8  ON app.ID_AppTuyauterie=a8.ID_AppTuyauterie,
T_Corps cprs INNER JOIN T_SousCorps cprs_s ON cprs.ID_Corps=cprs_s.ID_Corps where cprs_s.ID_SousCorps=a.ID_SousCorps OR cprs_s.ID_SousCorps=a1.ID_SousCorps OR cprs_s.ID_SousCorps=a2.ID_SousCorps
 OR cprs_s.ID_SousCorps=a3.ID_SousCorps OR cprs_s.ID_SousCorps=a4.ID_SousCorps OR cprs_s.ID_SousCorps=a5.ID_SousCorps OR cprs_s.ID_SousCorps=a6.ID_SousCorps OR
  cprs_s.ID_SousCorps=a7.ID_SousCorps OR cprs_s.ID_SousCorps=a8.ID_SousCorps;




create view R_Contrat_App(
ID_Client,NomEnSigle_Client,
NomComplet_Client,
Adresse_Client,
ConditionPaiement_Client,
Valider_Client,
ID_Societe,
NomEnSigle_Societe,
NomComplet_Societe,
Adresse_Societe,
Valider_Societe,
ID_Definition,
Valider_Definition,
ID_Contrat,
Preventif,
Curatif,
Valider_Contrat,
ID_App,
ID_AppAppareilDist,Type_AppDist,Marque_AppAppareilDist,Compteur_AppAppareilDist,
ID_AppAirCond,Marque_AirCond,Puissance_AirCondBTU,Type_Gaz,
ID_AppBachEau,Marque_AppBachEau,Puissance_AppBachEau,
ID_AppCuve,Marque_AppCuve,Puissance_AppCuve,
ID_AppGrpElect,Marque_AppGrpElect,Puissance_AppGrpElect,
ID_AppOnduleur,Marque_AppOnduleur,Puissance_AppOnduleur,
ID_AppReseau,Marque_AppReseau,Puissance_AppReseau,
ID_AppSurpresseur,Marque_AppSurpresseur,Puissance_AppSurpresseur,
ID_AppTuyauterie,Marque_AppTuyauterie,Puissance_AppTuyauterie,
ID_Corps,Abreviation_Corps,Nom_Corps,
ID_SousCorps,Nom_SousCorps,
ID_Site,NOM_Site,
ID_Utilisateur,marque
    ) 
as select 
c.ID_Client,
c.NomEnSigle_Client,
c.NomComplet_Client,
c.Adresse_Client,
c.ConditionPaiement_Client,
c.Valider_Client,
s.ID_Societe,
s.NomEnSigle_Societe,
s.NomComplet_Societe,
s.Adresse_Societe,
s.Valider_Societe,
d.ID_Definition,
d.Valider_Definition,
ctr.ID_Contrat,
ctr.Preventif,
ctr.Curatif,
ctr.Valider_Contrat,
app.ID_App,
a.ID_AppAppareilDist,a.Type_AppDist,a.Marque_AppAppareilDist,a.Compteur_AppAppareilDist,
a1.ID_AppAirCond,a1.Marque_AirCond,a1.Puissance_AirCondBTU,a1.Type_Gaz,
a2.ID_AppBachEau,a2.Marque_AppBachEau,a2.Puissance_AppBachEau,
a3.ID_AppCuve,a3.Marque_AppCuve,a3.Puissance_AppCuve,
a4.ID_AppGrpElect,a4.Marque_AppGrpElect,a4.Puissance_AppGrpElect,
a5.ID_AppOnduleur,a5.Marque_AppOnduleur,a5.Puissance_AppOnduleur,
a6.ID_AppReseau,a6.Marque_AppReseau,a6.Puissance_AppReseau,
a7.ID_AppSurpresseur,a7.Marque_AppSurpresseur,a7.Puissance_AppSurpresseur,
a8.ID_AppTuyauterie,a8.Marque_AppTuyauterie,a8.Puissance_AppTuyauterie,
cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
cprs_s.ID_SousCorps,cprs_s.Nom_SousCorps,
si.ID_Site,si.NOM_Site,
u.ID_Utilisateur,CONCAT(a.Marque_AppAppareilDist,a1.Marque_AirCond,a2.Marque_AppBachEau,a3.Marque_AppCuve,a4.Marque_AppGrpElect,a5.Marque_AppOnduleur,a6.Marque_AppReseau,a7.Marque_AppSurpresseur,a8.Marque_AppTuyauterie) AS Marque
 from T_App app LEFT JOIN T_AppAppareilDist a ON 
 app.ID_AppAppareilDist=a.ID_AppAppareilDist 
 LEFT JOIN T_AirCondit a1 ON app.ID_AppAirCond=a1.ID_AppAirCond
 LEFT JOIN T_AppBachEau a2 ON app.ID_AppBachEau=a2.ID_AppBachEau 
 LEFT JOIN T_AppCuve a3 ON app.ID_AppCuve=a3.ID_AppCuve 
 LEFT JOIN T_AppGrpElect a4 ON app.ID_AppGrpElect=a4.ID_AppGrpElect
 LEFT JOIN T_AppOnduleur a5 ON app.ID_AppOnduleur=a5.ID_AppOnduleur
 LEFT JOIN T_AppResauxApp a6 ON  app.ID_AppReseau=a6.ID_AppReseau
 LEFT JOIN T_AppSurpresseur a7 ON app.ID_AppSurpresseur=a7.ID_AppSurpresseur
 LEFT JOIN T_AppTuyauterie a8  ON app.ID_AppTuyauterie=a8.ID_AppTuyauterie
 LEFT JOIN T_Contrat ctr ON app.ID_Contrat=ctr.ID_Contrat
 LEFT JOIN  T_Site si ON app.ID_Site=si.ID_Site
  LEFT JOIN  T_Utilisateur u ON app.ID_Utilisateur=u.ID_Utilisateur
 LEFT JOIN   T_Definition d ON ctr.ID_Definition=d.ID_Definition
 LEFT JOIN  T_Client c ON d.ID_Client=c.ID_Client
 LEFT JOIN  T_Societe s ON  d.ID_Societe=s.ID_Societe,
 T_Corps cprs INNER JOIN T_SousCorps cprs_s ON cprs.ID_Corps=cprs_s.ID_Corps where cprs_s.ID_SousCorps=a.ID_SousCorps OR cprs_s.ID_SousCorps=a1.ID_SousCorps OR cprs_s.ID_SousCorps=a2.ID_SousCorps
 OR cprs_s.ID_SousCorps=a3.ID_SousCorps OR cprs_s.ID_SousCorps=a4.ID_SousCorps OR cprs_s.ID_SousCorps=a5.ID_SousCorps OR cprs_s.ID_SousCorps=a6.ID_SousCorps OR
  cprs_s.ID_SousCorps=a7.ID_SousCorps OR cprs_s.ID_SousCorps=a8.ID_SousCorps;




