use SMP_SMIB_DATABASE02;
CREATE VIEW R_Fournisseur_Definition_true(
ID_Four_Archive,
ID_Four,
ID_Utilisateur,
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
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_fourni,Valider_fo
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
CONCAT(fa.ConditionPaiement_Four,' Jours calendaires fin de mois') as condition_P,
fa.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_fourni,td.Valider_fo
from T_Fournisseur f,T_Fournisseur_Archive fa,T_Societe s , T_Societe_Archive sar,T_Definition df,T_Tempo_definition t,T_Tempo_definition_archive_fourni td,T_Utilisateur u,T_Pays p,T_Ville v,T_Departement dp ,T_TVA tva,T_Devise dvs,T_Raison_social rs
where
 f.ID_Four=fa.ID_Four and
tva.ID_TVA=fa.ID_TVA AND 
fa.ID_RS=rs.ID_RS 
AND fa.ID_Pays=p.ID_Pays 
AND fa.ID_Departement=dp.ID_Dep
 AND dp.ID_Pays=p.ID_Pays AND
  (fa.ID_Devise=dvs.ID_Devise OR fa.ID_Devise=NULL) AND
   u.ID_Utilisateur=f.ID_Utilisateur
AND fa.ID_Ville=v.ID_Ville AND
 v.ID_Dep=dp.ID_Dep AND
  df.ID_Four=f.ID_Four AND 
  df.ID_Societe=s.ID_Societe AND 
  sar.ID_Societe=s.ID_Societe AND 
  td.ID_Definition=df.ID_Definition AND
  td.ID_Four_Archive=fa.ID_Four_Archive AND
  td.ID_temp=t.ID_temp AND 
  t.ID_Societe=s.ID_Societe;


CREATE VIEW R_Fournisseur_Definition_true(
ID_Four_Archive,
ID_Four,
ID_Utilisateur,
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
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_fourni,Valider_fo,valider_archive,codepays_in
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
CONCAT(fa.ConditionPaiement_Four,' Jours calendaires fin de mois') as condition_P,
fa.CAPITAL,
t.ID_temp,
t.status_v,
t.status_vc,td.rev_f,td.ID_temp_fourni,td.Valider_fo,sar.valider_archive,fa.codepays_in
FROM T_Tempo_definition_archive_fourni td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Fournisseur_Archive fa ON td.ID_Four_Archive=fa.ID_Four_Archive
INNER JOIN T_Fournisseur f ON f.ID_Four=fa.ID_Four AND  df.ID_Four=f.ID_Four 
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=f.ID_Utilisateur
INNER JOIN T_Pays p ON fa.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON fa.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_TVA tva ON tva.ID_TVA=fa.ID_TVA 
LEFT JOIN  T_Devise dvs ON fa.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=fa.ID_RS;





CREATE VIEW R_Client_Definition_true(ID_Client,
Valider_Client,
ID_Utilisateur,
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
condition_P,CAPITAL,ID_temp,status_v,status_vc,rev_f,ID_temp_archive,Valider_cl,codepays_in
) as select 
cl.ID_Client,
cl.Valider_Client,
u.ID_Utilisateur,
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
t.status_vc,td.rev_f,td.ID_temp_archive,td.Valider_cl,clr.codepays_in
FROM T_Tempo_definition_archive td INNER JOIN T_Definition df ON td.ID_Definition=df.ID_Definition
INNER JOIN T_Societe s ON df.ID_Societe=s.ID_Societe AND  df.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON  sar.ID_Societe=s.ID_Societe 
INNER JOIN T_Tempo_definition t ON t.ID_Societe=s.ID_Societe AND td.ID_temp=t.ID_temp
INNER JOIN T_Client_Archive clr ON  td.ID_Client_archive=clr.ID_Client_archive
INNER JOIN T_Client cl ON  df.ID_Client=cl.ID_Client 
INNER JOIN T_Utilisateur u ON u.ID_Utilisateur=cl.ID_Utilisateur
INNER JOIN T_Pays p ON clr.ID_Pays=p.ID_Pays 
INNER JOIN T_Departement dp ON dp.ID_Pays=p.ID_Pays
INNER JOIN T_Ville v ON clr.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_TVA tva ON tva.ID_TVA=clr.ID_TVA 
LEFT JOIN  T_Devise dvs ON clr.ID_Devise=dvs.ID_Devise
INNER JOIN T_Raison_social rs ON rs.ID_RS=clr.ID_RS;


create view R_Professionnel_true(
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
  ID_SousCorps,Nom_SousCorps,
  ID_Utilisateur,status_af
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
  scprs.ID_SousCorps,scprs.Nom_SousCorps,users.ID_Utilisateur,ar.status_af
FROM T_Agent a INNER JOIN T_Contact c ON a.ID_Agent=c.ID_Agent
INNER JOIN T_Prof pr ON pr.ID_Contact=c.ID_Contact
INNER JOIN T_Agent_Archive ar ON ar.ID_Agent=a.ID_Agent
INNER JOIN T_Pays p ON ar.ID_Pays=p.ID_Pays
INNER JOIN T_Departement dp ON ar.ID_Pays=dp.ID_Pays AND p.ID_Pays=dp.ID_Pays
INNER JOIN T_Ville v ON ar.ID_Dep=v.ID_Dep AND ar.ID_Ville=v.ID_Ville  AND v.ID_Dep=dp.ID_Dep
INNER JOIN T_Union u ON u.ID_Contact=c.ID_Contact
INNER JOIN T_Definition d ON u.ID_Definition=d.ID_Definition
INNER JOIN T_Societe s ON d.ID_Societe=s.ID_Societe
INNER JOIN T_Societe_Archive sar ON sar.ID_Societe=s.ID_Societe
INNER JOIN T_Corps cprs ON pr.ID_Corps=cprs.ID_Corps
INNER JOIN T_SousCorps scprs ON scprs.ID_Corps=cprs.ID_Corps
INNER JOIN T_Utilisateur users ON ar.ID_Utilisateur=users.ID_Utilisateur AND 
users.ID_Utilisateur=c.ID_Utilisateur AND users.ID_Utilisateur=cprs.ID_Utilisateur AND 
users.ID_Utilisateur=d.ID_Utilisateur and users.ID_Utilisateur=u.ID_Utilisateur
and users.ID_Utilisateur=pr.ID_Utilisateur;




d.ID_Societe=s.ID_Societe and
 u.ID_Definition=d.ID_Definition and
  u.ID_Contact=c.ID_Contact and 
  p.ID_Contact=c.ID_Contact and 
  a.ID_Agent=c.ID_Agent and 
  p.ID_Corps=cp.ID_Corps

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
  ID_Corps,Abreviation_Corps,Nom_Corps,ID_Utilisateur,status_af,codepays_in,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_TEMP_INFO_P_TR,revision_temp,valider_tempo_t,
  ID_TEMP_INFO_P,status_en,status_sup,status_valid
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
  t.ID_TEMP_INFO_P,t.status_en,status_sup,t.status_valid
  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Departement dp,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_TEMP_INFO_PRO t ,T_Ville v,T_Contact c,T_Union u ,T_Definition d,T_Societe s,T_Societe_Archive sar,T_Prof pr,T_Corps cprs,T_Utilisateur users,T_Fonction f WHERE 
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
   f.ID_Corps=cprs.ID_Corps AND
  f.ID_Fonction=t.ID_Fonction AND
   t.ID_Corps=cprs.ID_Corps AND 
   tr.ID_TEMP_INFO_P=t.ID_TEMP_INFO_P AND 
   tr.ID_Agent_Arch=ar.ID_Agent_Arch and
   ar.ID_Utilisateur=users.ID_Utilisateur;


 CREATE VIEW R_Utilisateur_Privileges(
    ID_Agent,Valider_Agent,
  ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,Date_sav,heure_save,dateemb,lieunaissance,revision,
    ID_Pays,codepays,nompays,
  ID_Dep,nomdep,
  ID_Ville,nom_ville,
  ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,
ID_Utilisateur,MotDePasse_Util,Valider_Util,
ID_Privilege,a1,a2,a3,b1,b2,c1,c2,d1,d2,e1,e2,f1,f2,g1,g2,g3
  ) as select 
  a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.Date_sav,ar.heure_save,ar.dateemb,ar.lieunaissance,ar.revision,
  p.ID_Pays,p.codepays,p.nompays,
  dp.ID_Dep,dp.nomdep,
  v.ID_Ville,v.nom_ville,
  c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,
  users.ID_Utilisateur,users.MotDePasse_Util,users.Valider_Util,
  Plg.ID_Privilege,Plg.a1,Plg.a2,Plg.a3,Plg.b1,Plg.b2,Plg.c1,Plg.c2,Plg.d1,Plg.d2,Plg.e1,Plg.e2,Plg.f1,Plg.f2,Plg.g1,Plg.g2,Plg.g3
  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Departement dp ,T_Ville v,T_Contact c,T_Utilisateur users,T_Privileges plg WHERE 
  ar.ID_Agent=a.ID_Agent AND 
  ar.ID_Pays=p.ID_Pays AND 
  ar.ID_Dep=dp.ID_Dep AND 
  dp.ID_Pays=p.ID_Pays AND 
  ar.ID_Ville=v.ID_Ville AND
  v.ID_Dep=dp.ID_Dep AND 
  ar.ID_Agent_Arch=c.ID_Agent_Arch AND 
  users.ID_Agent_Arch=ar.ID_Agent_Arch AND 
  ar.ID_Utilisateur=users.ID_Utilisateur AND
  c.ID_Utilisateur=users.ID_Utilisateur AND
  plg.ID_Utilisateur=users.ID_utilisateur;


  create table T_TEMP_INFO_PRO(
    ID_TEMP_INFO_P int not null identity(1,1) primary key,
    ID_Definition int not null,
    ID_Corps int not null,
    FA varchar(20) null,
    FC varchar(80) null,
    mail varchar(80) null,
    Prestation_temp int not null,
    Salaire_temp int not null,
    dateemb dateTime not null,
    status_en bit default '0',
    status_sup bit default '0',
    status_valid bit default '0',
    valider_temp_pro bit default '1',
    constraint FK_Definition_temp foreign key(ID_Definition) references T_Definition(ID_Definition),
    constraint FK_corps_temp foreign key(ID_Corps) references T_Corps(ID_Corps)
  );

create table TR_TEMPO_INFO_PRO_ARCH_AGENT(
ID_TEMP_INFO_P_TR int not null identity(1,1) primary key,
ID_TEMP_INFO_P int not null,
ID_Agent_Arch int not null,
revision_temp varchar(50) null,
valider_tempo_t bit default 1,
constraint FK_info_temp foreign key(ID_TEMP_INFO_P) references T_TEMP_INFO_PRO(ID_TEMP_INFO_P),
constraint FK_c_temp foreign key(ID_Agent_Arch) references T_Agent_Archive(ID_Agent_Arch)
);
create view R_TEMPO_INFO_PROF02( 
  ID_TEMP_INFO_P,
  FA,
  FC,
  mail,
  Prestation_temp,
  Salaire_temp,
  dateemb,
  status_en,
  status_sup,
  status_valid,
  valider_temp_pro,
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Corps,Abreviation_Corps,
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,revision,Valider_Agent_archive,
  ID_TEMP_INFO_P_TR,revision_temp,valider_tempo_t,
    ID_Fonction,nomfonctionabr,nomfonctioncomplete
  ) as select
  t.ID_TEMP_INFO_P,
  t.FA,
  t.FC,
  t.mail,
  t.Prestation_temp,
  t.Salaire_temp,
  t.dateemb,
  t.status_en,
  t.status_sup,
  t.status_valid,
  t.valider_temp_pro,
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive, sar.NomEnSigle_Societe,sar.valider_archive,
  c.ID_Corps,c.Abreviation_Corps,
  a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.revision,ar.Valider_Agent_archive,
  tr.ID_TEMP_INFO_P_TR,tr.revision_temp,tr.valider_tempo_t,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete
FROM T_TEMP_INFO_PRO t,T_Definition d ,T_Societe s,T_Societe_Archive sar,T_Corps c ,T_Agent a,T_Agent_Archive ar,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_Fonction f
where 
t.ID_Corps=c.ID_Corps AND 
t.ID_Definition=d.ID_Definition AND 
d.ID_Societe=s.ID_Societe AND 
s.ID_Societe=sar.ID_Societe AND
a.ID_Agent=ar.ID_Agent AND 
tr.ID_TEMP_INFO_P=t.ID_TEMP_INFO_P AND 
tr.ID_Agent_Arch=ar.ID_Agent_Arch AND 
f.ID_Corps=c.ID_Corps AND
f.ID_Fonction=t.ID_Fonction AND
 sar.valider_archive=1 ;

create table TR_TEMPO_INFO_PRO_ARCH_AGENT(
ID_TEMP_INFO_P_TR int not null identity(1,1) primary key,
ID_TEMP_INFO_P int not null,
ID_Agent_Arch int not null,
revision_temp varchar(50) null,
valider_tempo_t bit default 1,
constraint FK_info_temp foreign key(ID_TEMP_INFO_P) references T_TEMP_INFO_PRO(ID_TEMP_INFO_P),
constraint FK_c_temp foreign key(ID_Agent_Arch) references T_Agent_Archive(ID_Agent_Arch)
);
create view R_TEMPO_INFO_PROF_INSERT02( 
  ID_TEMP_INFO_P,
  FA,
  FC,
  mail,
  Prestation_temp,
  Salaire_temp,
  dateemb,
  status_en,
  status_sup,
  status_valid,
  valider_temp_pro,
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Corps,Abreviation_Corps,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete
  ) as select
  t.ID_TEMP_INFO_P,
  t.FA,
  t.FC,
  t.mail,
  t.Prestation_temp,
  t.Salaire_temp,
  t.dateemb,
  t.status_en,
  t.status_sup,
  t.status_valid,
  t.valider_temp_pro,
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive, sar.NomEnSigle_Societe,sar.valider_archive,
  c.ID_Corps,c.Abreviation_Corps,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete
FROM T_TEMP_INFO_PRO t,T_Definition d ,T_Societe s,T_Societe_Archive sar,T_Corps c,T_Fonction f
where 
t.ID_Corps=c.ID_Corps AND 
t.ID_Definition=d.ID_Definition AND 
d.ID_Societe=s.ID_Societe AND 
s.ID_Societe=sar.ID_Societe AND
f.ID_Corps=c.ID_Corps AND
f.ID_Fonction=t.ID_Fonction AND
 sar.valider_archive=1;
  

  create view R_Definition_Societe_archivage_true(ID_Societe,NomEnSigle_Societe,NomComplet_Societe,Adresse_Societe,Valider_Societe,ID_Definition,Valider_Definition,
RCCM,NUI,CAPITAL,Tel_1,Tel_2,email_soc,BP,Date,heure,ID_Pays,codepays,Pays,ID_RS,Raison_social,ID_Dep,nomdep,ID_Devise,pays_devise,devise,code,num,ID_Ville,Ville,rev,SocieteID,ID_Societe_archive,dateOP,valider_archive,status_del,logo,ID_Banque,nombanque,numbanque,nomagence,nomvilleb,ID_Compte,numCompte,typ_compte,rib,cl,ID_TR_BS,status_b,status_c,url_file,rev_verif) 
as select 
s.ID_Societe,
sa.NomEnSigle_Societe,
sa.NomComplet_Societe,
sa.Adresse_Societe,
s.Valider_Societe,
d.ID_Definition,
d.Valider_Definition,sa.RCCM,sa.NUI,sa.CAPITAL,sa.Tel_1,sa.Tel_2,sa.email_soc,sa.BP,sa.Date_sav,sa.heure_save,p.ID_Pays,p.codepays,p.nompays,rs.ID_RS,rs.nom_rs,dp.ID_Dep,dp.nomdep,dvs.ID_Devise,dvs.pays,dvs.devise,dvs.code,dvs.num,v.ID_Ville,v.nom_ville,sa.revision,sa.Code_soc,sa.ID_Societe_archive,sa.dateOP,sa.valider_archive,sa.status_del,sa.logo,
 b.ID_Banque,b.nombanque,b.numbanque,b.nomagence,b.nomvilleb,c.ID_Compte,c.numCompte,c.typ_compte,c.rib,c.cl,ID_TR_BS.ID_TR_BS,b.status_b,c.status_c,c.url_file,ID_TR_BS.rev_verif
from T_Societe s,T_Definition d,T_Pays p,T_Banque b,T_Compte c,T_Raison_social rs,T_Departement dp,T_Devise dvs,T_Ville v,T_Societe_Archive sa,TR_Banque_societe ID_TR_BS
where s.ID_Societe=d.ID_Societe AND sa.ID_Pays=p.ID_Pays  AND sa.ID_RS=rs.ID_RS AND dp.ID_Pays=p.ID_Pays AND Sa.ID_Devise=dvs.ID_Devise AND c.ID_Banque=b.ID_Banque AND ID_TR_BS.ID_Societe=s.ID_Societe AND ID_TR_BS.ID_Banque=b.ID_Banque AND  v.ID_Dep=dp.ID_Dep AND sa.ID_Ville=v.ID_Ville AND sa.ID_Departement=dp.ID_Dep AND s.ID_Societe=sa.ID_Societe AND d.ID_Client IS NULL AND d.ID_Four IS NULL   order by ID_Definition desc offset 0 rows;


create view R_Definition_Societe_archivage_original(ID_Societe,NomEnSigle_Societe,NomComplet_Societe,Adresse_Societe,Valider_Societe,ID_Definition,Valider_Definition,
RCCM,NUI,CAPITAL,Tel_1,Tel_2,email_soc,BP,Date,heure,ID_Pays,codepays,Pays,ID_RS,Raison_social,ID_Dep,nomdep,ID_Devise,pays_devise,devise,code,num,ID_Ville,Ville,rev,SocieteID,ID_Societe_archive,dateOP,valider_archive,status_del,logo,ID_Banque,nombanque,numbanque,nomagence,nomvilleb,ID_Compte,numCompte,typ_compte,rib,cl,ID_TR_BS,status_b,status_c,url_file,codepays_in,rev_verif) 
as select 
s.ID_Societe,
sa.NomEnSigle_Societe,
sa.NomComplet_Societe,
sa.Adresse_Societe,
s.Valider_Societe,
d.ID_Definition,
d.Valider_Definition,sa.RCCM,sa.NUI,sa.CAPITAL,sa.Tel_1,sa.Tel_2,sa.email_soc,sa.BP,sa.Date_sav,sa.heure_save,p.ID_Pays,p.codepays,p.nompays,rs.ID_RS,rs.nom_rs,dp.ID_Dep,dp.nomdep,dvs.ID_Devise,dvs.pays,dvs.devise,dvs.code,dvs.num,v.ID_Ville,v.nom_ville,sa.revision,sa.Code_soc,sa.ID_Societe_archive,sa.dateOP,sa.valider_archive,sa.status_del,sa.logo,
 b.ID_Banque,b.nombanque,b.numbanque,b.nomagence,b.nomvilleb,c.ID_Compte,c.numCompte,c.typ_compte,c.rib,c.cl,bc.ID_TR_BS,b.status_b,c.status_c,c.url_file,sa.codepays_in,bc.rev_verif
from T_Societe s,T_Definition d,T_Pays p,T_Banque b,T_Compte c,T_Raison_social rs,T_Departement dp,T_Devise dvs,T_Ville v,T_Societe_Archive sa,TR_Banque_societe bc
where s.ID_Societe=d.ID_Societe AND sa.ID_Pays=p.ID_Pays  AND sa.ID_RS=rs.ID_RS AND dp.ID_Pays=p.ID_Pays AND Sa.ID_Devise=dvs.ID_Devise AND c.ID_Banque=b.ID_Banque AND bc.ID_Societe=s.ID_Societe AND bc.ID_Banque=b.ID_Banque AND  v.ID_Dep=dp.ID_Dep AND sa.ID_Ville=v.ID_Ville AND sa.ID_Departement=dp.ID_Dep AND s.ID_Societe=sa.ID_Societe AND d.ID_Client IS NULL AND d.ID_Four IS NULL   order by ID_Definition desc offset 0 rows;


create view R_Banque_Compte(ID_Banque,nombanque,numbanque,nomagence,nomvilleb,ID_Compte,numCompte,typ_compte,rib,cl,status_b,status_c,url_file)
 as select 
 b.ID_Banque,b.nombanque,b.numbanque,b.nomagence,b.nomvilleb,c.ID_Compte,c.numCompte,c.typ_compte,c.rib,c.cl,b.status_b,c.status_c,c.url_file
 from T_Banque b,T_Compte c where c.ID_Banque=b.ID_Banque;


 create table T_Nationalite(
  ID_Nationalite int not null identity(1,1) primary key,
  nomnationalite varchar(100) not null
 );
 create table T_Fonction(
 ID_Fonction int not null identity(1,1) primary key,
 nomfonctionabr varchar(50) null,
 nomfonctioncomplete varchar(200) not null,
 ID_Corps int null,
 constraint pk_cprs foreign KEY(ID_Corps) references T_Corps(ID_Corps)
 );

 CREATE VIEW R_FONCTION_CORPS(
   ID_Fonction,nomfonctionabr, nomfonctioncomplete,
   ID_Corps,Abreviation_Corps,Nom_Corps
 ) as select 
   f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
   c.ID_Corps,c.Abreviation_Corps,c.Nom_Corps
   from T_Fonction f,T_Corps c
   where 
   c.ID_Corps=f.ID_Corps;

   ALTER TABLE T_Agent_Archive add ID_Fonction int null constraint fk_fonct FOREIGN KEY(ID_Fonction) REFERENCES T_Fonction(ID_Fonction);

   ALTER TABLE T_TEMP_INFO_PRO add ID_Fonction int null constraint fk_fonct_tempo FOREIGN KEY(ID_Fonction) REFERENCES T_Fonction(ID_Fonction);
   CREATE TABLE T_TITRE(
    ID_Titre int not null identity(1,1) primary key,
    nom_titre varchar(50) not null
   );

   CREATE TABLE TR_CORPS_TITRE(
    ID_TR_CORPS_TITRE int not null identity(1,1) primary key,
    ID_Titre int not null,
    ID_Corps int not null,
   constraint fk_t foreign key(ID_Titre) references T_TITRE(ID_Titre),
   constraint fk_c foreign key(ID_Corps) references T_Corps(ID_Corps)
   );
 ALTER TABLE T_Corps ADD ID_Titre int constraint fk_t foreign key(ID_Titre) references T_TITRE(ID_Titre);
 ALTER TABLE T_Fonction ADD ID_TR_CORPS_TITRE int int constraint fk_tr foreign key(ID_TR_CORPS_TITRE) references TR_CORPS_TITRE(ID_TR_CORPS_TITRE);
  CREATE VIEW R_FONCTION_CORPS_TITRE0(
   ID_Corps,Abreviation_Corps,Nom_Corps,
   ID_Titre,nom_titre,
   ID_TR_CORPS_TITRE
 ) as select 
   c.ID_Corps,c.Abreviation_Corps,c.Nom_Corps,
   t.ID_Titre,t.nom_titre,
   tr.ID_TR_CORPS_TITRE
   from T_Corps c,T_TITRE t,TR_CORPS_TITRE tr
   where 
  tr.ID_Corps=c.ID_Corps AND
  tr.ID_Titre=t.ID_Titre;

  CREATE VIEW R_CORPS_TITRE_original(
   ID_Corps,Abreviation_Corps,Nom_Corps,
   ID_Titre,nom_titre,
   ID_TR_CORPS_TITRE
 ) as select 
   f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
   c.ID_Corps,c.Abreviation_Corps,c.Nom_Corps,
   t.ID_Titre,t.nom_titre,
   tr.ID_TR_CORPS_TITRE
   from T_Corps c,T_TITRE t,TR_CORPS_TITRE tr
   where 
  tr.ID_Corps=c.ID_Corps AND
  tr.ID_Titre=t.ID_Titre;

   create view R_TEMPO_INFO_PROF_INSERT_original( 
  ID_TEMP_INFO_P,
  FA,
  FC,
  mail,
  Prestation_temp,
  Salaire_temp,
  dateemb,
  status_en,
  status_sup,
  status_valid,
  valider_temp_pro,
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Corps,Abreviation_Corps,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE
  ) as select
  t.ID_TEMP_INFO_P,
  t.FA,
  t.FC,
  t.mail,
  t.Prestation_temp,
  t.Salaire_temp,
  t.dateemb,
  t.status_en,
  t.status_sup,
  t.status_valid,
  t.valider_temp_pro,
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive, sar.NomEnSigle_Societe,sar.valider_archive,
  c.ID_Corps,c.Abreviation_Corps,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  ti.ID_Titre,ti.nom_titre,
  tr.ID_TR_CORPS_TITRE
FROM T_TEMP_INFO_PRO t,T_Definition d ,T_Societe s,T_Societe_Archive sar,T_Corps c,T_Fonction f,T_TITRE ti,TR_CORPS_TITRE tr
where 
t.ID_Corps=c.ID_Corps AND 
t.ID_Fonction=f.ID_Fonction AND
t.ID_Definition=d.ID_Definition AND 
d.ID_Societe=s.ID_Societe AND 
s.ID_Societe=sar.ID_Societe AND
f.ID_TR_CORPS_TITRE=tr.ID_TR_CORPS_TITRE AND
c.ID_Corps=tr.ID_Corps AND
ti.ID_Titre=tr.ID_Titre AND 
 sar.valider_archive=1;


 
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
  ID_TR_CORPS_TITRE,lieuaffecta
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
  tri.ID_TR_CORPS_TITRE,pr.lieuaffecta
  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Departement dp,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_TITRE ti,TR_CORPS_TITRE tri,T_TEMP_INFO_PRO t ,T_Ville v,T_Contact c,T_Union u ,T_Definition d,T_Societe s,T_Societe_Archive sar,T_Prof pr,T_Corps cprs,T_Utilisateur users,T_Fonction f
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
   f.ID_Corps=cprs.ID_Corps AND
  f.ID_Fonction=t.ID_Fonction AND
   t.ID_Corps=cprs.ID_Corps AND 
   tr.ID_TEMP_INFO_P=t.ID_TEMP_INFO_P AND 
   tr.ID_Agent_Arch=ar.ID_Agent_Arch and
   f.ID_TR_CORPS_TITRE=tri.ID_TR_CORPS_TITRE AND
   cprs.ID_Corps=tri.ID_Corps AND
   ti.ID_Titre=tri.ID_Titre AND 
   ar.ID_Utilisateur=users.ID_Utilisateur;


  create view R_TEMPO_INFO_PROF02( 
  ID_TEMP_INFO_P,
  FA,
  FC,
  mail,
  Prestation_temp,
  Salaire_temp,
  dateemb,
  status_en,
  status_sup,
  status_valid,
  valider_temp_pro,
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Corps,Abreviation_Corps,Nom_Corps
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,revision,Valider_Agent_archive,
  ID_TEMP_INFO_P_TR,revision_temp,valider_tempo_t,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE
  ) as select
  t.ID_TEMP_INFO_P,
  t.FA,
  t.FC,
  t.mail,
  t.Prestation_temp,
  t.Salaire_temp,
  t.dateemb,
  t.status_en,
  t.status_sup,
  t.status_valid,
  t.valider_temp_pro,
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive, sar.NomEnSigle_Societe,sar.valider_archive,
  c.ID_Corps,c.Abreviation_Corps,c.Nom_Corps,
  a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.revision,ar.Valider_Agent_archive,
  tr.ID_TEMP_INFO_P_TR,tr.revision_temp,tr.valider_tempo_t,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  ti.ID_Titre,ti.nom_titre,
   tri.ID_TR_CORPS_TITRE
FROM T_TEMP_INFO_PRO t,T_Definition d ,T_Societe s,T_Societe_Archive sar,T_Corps c ,T_Agent a,T_Agent_Archive ar,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_Fonction f
where 
t.ID_Corps=c.ID_Corps AND 
t.ID_Definition=d.ID_Definition AND 
d.ID_Societe=s.ID_Societe AND 
s.ID_Societe=sar.ID_Societe AND
a.ID_Agent=ar.ID_Agent AND 
tr.ID_TEMP_INFO_P=t.ID_TEMP_INFO_P AND 
tr.ID_Agent_Arch=ar.ID_Agent_Arch AND 
f.ID_Fonction=t.ID_Fonction AND

 sar.valider_archive=1 ;

 CREATE TABLE T_Contact_Four_Client(
  ID_Contact_four_client int not null identity(1,1) primary key,
  Valider_contact_four bit default 1
 );
 CREATE TABLE T_Contact_Four_Client_Archive(
  ID_Contact_four_client_archive int not null identity(1,1) primary key,
  ID_Contact_four_client int not null,
  ID_Fonction int not null,
  Valider_contact_four_archive bit default 1,
  nom_c_f varchar(80) not null,
  prenom_c_f varchar(80) not null,
  civilite_c_f varchar(80) not null,
  email_f_c_one varchar(80) not null,
  email_f_c_two varchar(80)  null,
  tel_one_f_c varchar(80) not null,
  tel_two_f_c varchar(80) null,
  revision_f_c varchar(50) null,
  code_contact_f_c varchar(50) null,
  constraint fk_contact_f foreign key(ID_Contact_four_client) references T_Contact_Four_Client(ID_Contact_four_client),
  constraint fk_fonct_f_c foreign key(ID_Fonction) references T_Fonction(ID_Fonction)
 );

 alter table T_Contact_Four_Client add ID_Utilisateur int  constraint fk_user foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur);
alter table T_Contact_Four_Client_Archive add ID_Utilisateur int  constraint fk_user_archi foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur);

alter table T_Contact_Four_Client_Archive add Date dateTime default GETDATE();
alter table T_Contact_Four_Client_Archive add Heure dateTime default GETDATE();

CREATE VIEW R_CONTACT_CLIENT(
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Union,Valider_unition,revision_union
  ID_Contact_four_client,Valider_contact_four,
  ID_Contact_four_client_archive,Valider_contact_four_archive,nom_c_f,prenom_c_f,civilite_c_f,email_f_c_one,email_f_c_two,tel_one_f_c,tel_two_f_c,revision_f_c,code_contact_f_c,Date,Heure,
  ID_Utilisateur,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Client,Valider_Client,
  ID_Client_archive,NomEnSigle_Client,Valider_archive_client,NomComplet_Client
) as select 
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.NomEnSigle_Societe,sar.valider_archive,
  u.ID_Union,u.Valider_unition,u.revision_union,
  c.ID_Contact_four_client,c.Valider_contact_four,
  car.ID_Contact_four_client_archive,car.Valider_contact_four_archive,car.nom_c_f,car.prenom_c_f,car.civilite_c_f,car.email_f_c_one,car.email_f_c_two,car.tel_one_f_c,car.tel_two_f_c,car.revision_f_c,car.code_contact_f_c,car.Date,car.Heure,
  users.ID_Utilisateur,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  t.ID_Titre,t.nom_titre,
  tr.ID_TR_CORPS_TITRE,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
  cl.ID_Client,cl.Valider_Client,
  clr.ID_Client_archive,clr.NomEnSigle_Client,clr.Valider_archive_client,clr.NomComplet_Client
  FROM T_Definition d,T_Societe s,T_Client cl,T_Client_Archive clr,T_Societe_Archive sar,T_Union u,T_Contact_Four_Client c,T_Contact_Four_Client_Archive car,T_Utilisateur users,T_Fonction f,T_TITRE t,TR_CORPS_TITRE tr,T_Corps cprs
  where 
  d.ID_Definition=u.ID_Definition AND 
  d.ID_Client=cl.ID_Client AND
  clr.ID_Client=cl.ID_Client AND 
  d.ID_Societe=s.ID_Societe AND 
  sar.ID_Societe=s.ID_Societe AND 
  u.ID_Contact_four_client_archive=car.ID_Contact_four_client_archive AND
  c.ID_Contact_four_client=car.ID_Contact_four_client AND
  f.ID_TR_CORPS_TITRE=tr.ID_TR_CORPS_TITRE AND 
  f.ID_Fonction=car.ID_Fonction AND 
  tr.ID_Titre=t.ID_Titre AND 
  tr.ID_Corps=cprs.ID_Corps AND
  valider_archive=1 and Valider_archive_client=1 AND 
  users.ID_Utilisateur=cprs.ID_Utilisateur AND 
  users.ID_Utilisateur=car.ID_Utilisateur AND 
 users.ID_Utilisateur=d.ID_Utilisateur AND 
  users.ID_Utilisateur=u.ID_Utilisateur AND 
   users.ID_Utilisateur=cl.ID_Utilisateur;

ALTER TABLE T_Union ADD constraint pk_c_c_f FOREIGN key(ID_Contact_four_client_archive) references T_Union(ID_Contact_four_client_archive);


   
CREATE VIEW R_CONTACT_FOURNISSEUR00(
  ID_Definition,Valider_Definition,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,NomEnSigle_Societe,valider_archive,
  ID_Union,Valider_unition,revision_union,
  ID_Contact_four_client,Valider_contact_four,
  ID_Contact_four_client_archive,Valider_contact_four_archive,nom_c_f,prenom_c_f,civilite_c_f,email_f_c_one,email_f_c_two,tel_one_f_c,tel_two_f_c,revision_f_c,code_contact_f_c,Date,Heure,
  ID_Utilisateur,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Four,Valider_Four,
  ID_Four_Archive,NomEnSigle_Four,Valider_f_archive,NomComplet_Four

) as select 
  d.ID_Definition,d.Valider_Definition,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.NomEnSigle_Societe,sar.valider_archive,
  u.ID_Union,u.Valider_unition,u.revision_union,
  c.ID_Contact_four_client,c.Valider_contact_four,
  car.ID_Contact_four_client_archive,car.Valider_contact_four_archive,car.nom_c_f,car.prenom_c_f,car.civilite_c_f,car.email_f_c_one,car.email_f_c_two,car.tel_one_f_c,car.tel_two_f_c,car.revision_f_c,car.code_contact_f_c,car.Date,car.Heure,
  users.ID_Utilisateur,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  t.ID_Titre,t.nom_titre,
  tr.ID_TR_CORPS_TITRE,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
   fo.ID_Four,fo.Valider_Four,
   forn.ID_Four_Archive,forn.NomEnSigle_Four,forn.Valider_f_archive,forn.NomComplet_Four
  FROM T_Definition d,T_Societe s,T_Fournisseur fo,T_Fournisseur_Archive forn,T_Societe_Archive sar,T_Union u,T_Contact_Four_Client c,T_Contact_Four_Client_Archive car,T_Utilisateur users,T_Fonction f,T_TITRE t,TR_CORPS_TITRE tr,T_Corps cprs
  where 
  d.ID_Definition=u.ID_Definition AND 
  d.ID_Four=fo.ID_Four AND
  fo.ID_Four=forn.ID_Four AND 
  d.ID_Societe=s.ID_Societe AND 
  sar.ID_Societe=s.ID_Societe AND 
  u.ID_Contact_four_client_archive=car.ID_Contact_four_client_archive AND
  c.ID_Contact_four_client=car.ID_Contact_four_client AND
  f.ID_TR_CORPS_TITRE=tr.ID_TR_CORPS_TITRE AND 
  f.ID_Fonction=car.ID_Fonction AND 
  tr.ID_Titre=t.ID_Titre AND 
    valider_archive=1 and Valider_f_archive=1 AND 
  tr.ID_Corps=cprs.ID_Corps AND
  users.ID_Utilisateur=cprs.ID_Utilisateur AND 
  users.ID_Utilisateur=car.ID_Utilisateur AND 
 users.ID_Utilisateur=d.ID_Utilisateur AND 
  users.ID_Utilisateur=u.ID_Utilisateur AND 
   users.ID_Utilisateur=fo.ID_Utilisateur;

   alter table T_Union ADD Valider_unition bit default 1 null;
   alter table T_Union ADD revision_union varchar(80) null;

   CREATE TABLE T_Contrat(
    ID_Contrat int not null identity(1,1) primary key,
    valider_contrat bit default '1'
   );

   
   CREATE TABLE T_Contrat_Archive(
    ID_Contrat_archive int not null identity(1,1) primary key,
    ID_Contrat int not null,
    valider_contrat_archive bit default '1',
    Date dateTime default GETDATE() not null,
    Heure time default GETDATE() not null,
    ID_Definition int not null,
    titre_contrat varchar(80) null,
    Preventif bit null,
    Curatif bit null,
    ID_utilisateur int not null,
    constraint fk_contrat foreign key(ID_Contrat) references T_Contrat(ID_Contrat),
    constraint fk_user_c foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur),
    constraint fk_c_df foreign key(ID_Definition) references T_Definition(ID_Definition)
   );
   alter table T_App add constraint fk_contrat_arc foreign key(ID_Contrat_archive) references T_Contrat_Archive(ID_Contrat_archive);

alter table T_Utilisateur_Archive add constraint fk_ag_arch foreign key(ID_Agent_Arch) references T_Agent_Archive(ID_Agent_Arch);

CREATE TABLE T_Privileges(
 ID_Privilege int not null identity(1,1) primary key,
 ID_Utilisateur_Archive int not null ,
 a1 bit null default 0, 
 a2 bit null default 0, 
 a3 bit null default 0, 
a4 bit null default 0, 
 a5 bit null default 0,
  a6 bit null default 0, 
   a7 bit null default 0, 
    a8 bit null default 0,
     a9 bit null default 0, 
      a10 bit null default 0,
       b1 bit null default 0,
        b2 bit null default 0,
         b3 bit null default 0, 
          b4 bit null default 0,
           b5 bit null default 0,
            b6 bit null default 0, 
             b7 bit null default 0,
              b8 bit null default 0,
               b9 bit null default 0, 
        c1 bit null default 0,
        c2 bit null default 0,
         c3 bit null default 0, 
          c4 bit null default 0,
           c5 bit null default 0,
            c6 bit null default 0, 
             c7 bit null default 0,
              c8 bit null default 0,
               c9 bit null default 0, 
        d1 bit null default 0,
        d2 bit null default 0,
         d3 bit null default 0, 
          d4 bit null default 0,
           d5 bit null default 0,
            d6 bit null default 0, 
             d7 bit null default 0,
              d8 bit null default 0,
               d9 bit null default 0, 
        e1 bit null default 0,
        e2 bit null default 0,
         e3 bit null default 0, 
          e4 bit null default 0,
           e5 bit null default 0,
            e6 bit null default 0, 
             e7 bit null default 0,
              e8 bit null default 0,
               e9 bit null default 0,
        f1 bit null default 0,
        f2 bit null default 0,
         f3 bit null default 0, 
          f4 bit null default 0,
           f5 bit null default 0,
            f6 bit null default 0, 
             f7 bit null default 0,
              f8 bit null default 0,
               f9 bit null default 0,
        g1 bit null default 0,
        g2 bit null default 0,
         g3 bit null default 0, 
          g4 bit null default 0,
           g5 bit null default 0,
            g6 bit null default 0, 
             g7 bit null default 0,
              g8 bit null default 0,
               g9 bit null default 0,
        h1 bit null default 0,
        h2 bit null default 0,
         h3 bit null default 0, 
          h4 bit null default 0,
           h5 bit null default 0,
            h6 bit null default 0, 
             h7 bit null default 0,
              h8 bit null default 0,
               h9 bit null default 0,
        i1 bit null default 0,
        i2 bit null default 0,
         i3 bit null default 0, 
          i4 bit null default 0,
           i5 bit null default 0,
            i6 bit null default 0, 
             i7 bit null default 0,
      constraint fk_use_archi_prive foreign key(ID_Utilisateur_Archive) references T_Utilisateur_Archive(ID_Utilisateur_Archive)
);

ALTER TABLE T_Privileges add i8 bit null default 0;
ALTER TABLE T_Privileges add j1 bit null default 0;
ALTER TABLE T_Privileges add j2 bit null default 0;
ALTER TABLE T_Privileges add j3 bit null default 0;
ALTER TABLE T_Privileges add j4 bit null default 0;
ALTER TABLE T_Privileges add j5 bit null default 0;
ALTER TABLE T_Privileges add j6 bit null default 0;
ALTER TABLE T_Privileges add j7 bit null default 0;
i8,j1,j2,j3,j4,j5,j6,j7

 CREATE VIEW R_Utilisateur_Privileges(
  ID_Agent,Valider_Agent,
  ID_Agent_Arch,Piece_Ident1,Piece_Ident2,Nationalite_Agent,Valider_Agent_archive,codeAgent,DateNaissance_Agent,Adresse_Agent,BP_Agent,DateExpirationPce_Agent,photo,Date_sav,heure_save,dateemb,lieunaissance,revision,
  ID_Pays,codepays,nompays,
  ID_Dep,nomdep,
  ID_Ville,nom_ville,
  ID_Contact,Civilite_Contact,FonctionComplet_Contact,FonctionAbreviation_Contact,Nom_Contact,Prenom_Contact,Email1_Contact,Email2_Contact,Tel1_Contact,Tel2_Contact,Valider_Contact,
  ID_Utilisateur,Valider_Util,
  ID_Privilege,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,b1,b2,b3,b4,b5,b6,b7,b8,b9,c1,c2,c3,c4,c5,c6,c7,c8,c9,d1,d2,d3,d4,d5,d6,d7,d8,d9,e1,e2,e3,e4,e5,e6,e7,e8,e9,f1,f2,f3,f4,f5,f6,f7,f8,f9,g1,g2,g3,g4,g5,g6,g7,g8,g9,h1,h2,h3,h4,h5,h6,h7,h8,h9,i1,i2,i3,i4,i5,i6,i7,
  ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,Date,Heure,
  ID_Societe,Valider_Societe,
  ID_Societe_archive,valider_archive,NomEnSigle_Societe,NomComplet_Societe,status_del,logo
  ) as select 
  a.ID_Agent,a.Valider_Agent,
  ar.ID_Agent_Arch,ar.Piece_Ident1,ar.Piece_Ident2,ar.Nationalite_Agent,ar.Valider_Agent_archive,ar.codeAgent,ar.DateNaissance_Agent,ar.Adresse_Agent,ar.BP_Agent,ar.DateExpirationPce_Agent,ar.photo,ar.Date_sav,ar.heure_save,ar.dateemb,ar.lieunaissance,ar.revision,
  p.ID_Pays,p.codepays,p.nompays,
  dp.ID_Dep,dp.nomdep,
  v.ID_Ville,v.nom_ville,
  c.ID_Contact,c.Civilite_Contact,c.FonctionComplet_Contact,c.FonctionAbreviation_Contact,c.Nom_Contact,c.Prenom_Contact,c.Email1_Contact,c.Email2_Contact,c.Tel1_Contact,c.Tel2_Contact,c.Valider_Contact,
  users.ID_Utilisateur,users.Valider_Util,
  Plg.ID_Privilege,plg.a1,plg.a2,plg.a3,plg.a4,plg.a5,plg.a6,plg.a7,plg.a8,plg.a9,plg.a10,plg.b1,plg.b2,plg.b3,plg.b4,plg.b5,plg.b6,plg.b7,plg.b8,plg.b9,plg.c1,plg.c2,plg.c3,plg.c4,plg.c5,plg.c6,plg.c7,plg.c8,plg.c9,plg.d1,plg.d2,plg.d3,plg.d4,plg.d5,plg.d6,plg.d7,plg.d8,plg.d9,plg.e1,plg.e2,plg.e3,plg.e4,plg.e5,plg.e6,plg.e7,plg.e8,plg.e9,plg.f1,plg.f2,plg.f3,plg.f4,plg.f5,plg.f6,plg.f7,plg.f8,plg.f9,plg.g1,plg.g2,plg.g3,plg.g4,plg.g5,plg.g6,plg.g7,plg.g8,plg.g9,plg.h1,plg.h2,plg.h3,plg.h4,plg.h5,plg.h6,plg.h7,plg.h8,plg.h9,plg.i1,plg.i2,plg.i3,plg.i4,plg.i5,plg.i6,plg.i7,
  user_ar.ID_Utilisateur_Archive,user_ar.revision_user,user_ar.MotDePasse_Util,user_ar.Valider_Util_archive,user_ar.codeuser,user_ar.Date,user_ar.Heure,
  s.ID_Societe,s.Valider_Societe,
  sar.ID_Societe_archive,sar.valider_archive,sar.NomEnSigle_Societe,sar.NomComplet_Societe,sar.status_del,logo,

  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Departement dp ,T_Ville v,T_Contact c,T_Utilisateur users,T_Privileges plg,T_Utilisateur_Archive user_ar WHERE 
  ar.ID_Agent=a.ID_Agent AND 
  ar.ID_Pays=p.ID_Pays AND 
  ar.ID_Dep=dp.ID_Dep AND 
  dp.ID_Pays=p.ID_Pays AND 
  ar.ID_Ville=v.ID_Ville AND
  v.ID_Dep=dp.ID_Dep AND 
  ar.ID_Agent_Arch=c.ID_Agent_Arch AND 
  user_ar.ID_Agent_Arch=ar.ID_Agent_Arch AND 
  users.ID_Utilisateur=user_ar.ID_Utilisateur AND 
  plg.ID_Utilisateur_Archive=user_ar.ID_Utilisateur_Archive;


   CREATE  VIEW R_Professionnel_original_login(
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
  ID_Pro,Prestation,Salaire,lieuaffecta
  ID_Corps,Abreviation_Corps,Nom_Corps,
  ID_Utilisateur,Valider_Util,status_af,codepays_in,
  ID_Fonction,nomfonctionabr,nomfonctioncomplete,
  ID_TEMP_INFO_P_TR,revision_temp,valider_tempo_t,
  ID_TEMP_INFO_P,status_en,status_sup,status_valid,
  ID_Titre,nom_titre,
  ID_TR_CORPS_TITRE,
  ID_Privilege,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,b1,b2,b3,b4,b5,b6,b7,b8,b9,c1,c2,c3,c4,c5,c6,c7,c8,c9,d1,d2,d3,d4,d5,d6,d7,d8,d9,e1,e2,e3,e4,e5,e6,e7,e8,e9,f1,f2,f3,f4,f5,f6,f7,f8,f9,g1,g2,g3,g4,g5,g6,g7,g8,g9,h1,h2,h3,h4,h5,h6,h7,h8,h9,i1,i2,i3,i4,i5,i6,i7,i8,j1,j2,j3,j4,j5,j6,j7,
  ID_Utilisateur_Archive,revision_user,MotDePasse_Util,Valider_Util_archive,codeuser,Date,Heure
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
  pr.ID_Pro,pr.Prestation,pr.Salaire,pr.lieuaffecta,
  cprs.ID_Corps,cprs.Abreviation_Corps,cprs.Nom_Corps,
  users.ID_Utilisateur,users.Valider_Util,ar.status_af,ar.codepays_in,
  f.ID_Fonction,f.nomfonctionabr,f.nomfonctioncomplete,
  tr.ID_TEMP_INFO_P_TR,tr.revision_temp,tr.valider_tempo_t,
  t.ID_TEMP_INFO_P,t.status_en,status_sup,t.status_valid,
  ti.ID_Titre,ti.nom_titre,
  tri.ID_TR_CORPS_TITRE,
  Plg.ID_Privilege,plg.a1,plg.a2,plg.a3,plg.a4,plg.a5,plg.a6,plg.a7,plg.a8,plg.a9,plg.a10,plg.b1,plg.b2,plg.b3,plg.b4,plg.b5,plg.b6,plg.b7,plg.b8,plg.b9,plg.c1,plg.c2,plg.c3,plg.c4,plg.c5,plg.c6,plg.c7,plg.c8,plg.c9,plg.d1,plg.d2,plg.d3,plg.d4,plg.d5,plg.d6,plg.d7,plg.d8,plg.d9,plg.e1,plg.e2,plg.e3,plg.e4,plg.e5,plg.e6,plg.e7,plg.e8,plg.e9,plg.f1,plg.f2,plg.f3,plg.f4,plg.f5,plg.f6,plg.f7,plg.f8,plg.f9,plg.g1,plg.g2,plg.g3,plg.g4,plg.g5,plg.g6,plg.g7,plg.g8,plg.g9,plg.h1,plg.h2,plg.h3,plg.h4,plg.h5,plg.h6,plg.h7,plg.h8,plg.h9,plg.i1,plg.i2,plg.i3,plg.i4,plg.i5,plg.i6,plg.i7,plg.i8,plg.j1,plg.j2,plg.j3,plg.j4,plg.j5,plg.j6,plg.j7,
  user_ar.ID_Utilisateur_Archive,user_ar.revision_user,user_ar.MotDePasse_Util,user_ar.Valider_Util_archive,user_ar.codeuser,user_ar.Date,user_ar.Heure
  FROM T_Agent a ,T_Agent_Archive ar,T_Pays p,T_Privileges plg,T_Utilisateur_Archive user_ar,T_Departement dp,TR_TEMPO_INFO_PRO_ARCH_AGENT  tr,T_TITRE ti,TR_CORPS_TITRE tri,T_TEMP_INFO_PRO t ,T_Ville v,T_Contact c,T_Union u ,T_Definition d,T_Societe s,T_Societe_Archive sar,T_Prof pr,T_Corps cprs,T_Utilisateur users,T_Fonction f
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
   user_ar.ID_Agent_Arch=ar.ID_Agent_Arch AND 
   users.ID_Utilisateur=user_ar.ID_Utilisateur AND 
    plg.ID_Utilisateur_Archive=user_ar.ID_Utilisateur_Archive AND sar.valider_archive=1;


    CREATE VIEW R_CORPS_SOUS_CORPS(
      ID_Corps,Abreviation_Corps,Nom_Corps,
      ID_SousCorps,Nom_SousCorps,
      ID_Utilisateur
    ) as select 
      c.ID_Corps,c.Abreviation_Corps,c.Nom_Corps,
      sc.ID_SousCorps,sc.Nom_SousCorps,
      u.ID_Utilisateur
      FROM T_Corps c,T_SousCorps sc ,T_Utilisateur u WHERE c.ID_Corps=sc.ID_Corps AND u.ID_Utilisateur=c.ID_Utilisateur and u.ID_Utilisateur=sc.ID_Utilisateur;


    alter table T_Utilisateur_Archive ADD statusLog bit default 0;
    alter table T_Utilisateur_Archive ADD username varchar(80) null;
    ALTER TABLE T_TEMP_INFO_PRO ADD lieuaffecta varchar(80) null;
    ALTER TABLE T_Societe_Archive Add ID_Utilisateur int null constraint fk_user_soc foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur);
    ALTER TABLE T_Client_Archive Add ID_Utilisateur int null constraint fk_user_client foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur);
     ALTER TABLE T_Fournisseur_Archive Add ID_Utilisateur int null constraint fk_user_fourni foreign key(ID_Utilisateur) references T_Utilisateur(ID_Utilisateur);

       ALTER TABLE T_Contrat_Archive Add ID_Corps int null constraint fk_corp_c foreign key(ID_Corps) references T_Corps(ID_Corps);

  CREATE VIEW R_CONTRAT(
    ID_Contrat,valider_contrat,
    ID_Contrat_archive,valider_contrat_archive,Date,Heure,titre_contrat,Preventif,Curatif,codecontrat,revision_contrat,
    ID_Definition,
    ID_Client,Valider_Client,
    ID_Client_archive,dateOP,NomEnSigle_Client,NomComplet_Client,Adresse_Client,ConditionPaiement_Client,RCCM,NUI,Tel_1,Tel_2,email_client,BP,
  )
    



    
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



 ALTER TABLE T_Site Add ID_Pays int null constraint fk_country foreign key(ID_Pays) references T_Pays(ID_Pays);
  ALTER TABLE T_Site Add ID_Ville int null constraint fk_city foreign key(ID_Ville) references T_Ville(ID_Ville);
  ALTER TABLE Temp_Site_table Add ID_Site int null constraint fk_ss foreign key(ID_Site) references T_Departement(ID_Dep);
ALTER TABLE T_App_temp ADD ID_Site constraint fk_s foreign key(ID_Site) references Temp_Site_table(ID_Site);
  create table Temp_Site_table(
    ID_temp_site int not null identity(1,1) primary key,
    nom_site varchar(50) not null,
    etat_val bit default 0,
    etat_en  bit default 0
  );
alter table T_Site add  etat_en bit default 0;

  ALTER TABLE T_App Add ID_Contrat_archive int null constraint fk_cotr foreign key(ID_Contrat_archive) references T_Contrat_Archive(ID_Contrat_archive);


  ALTER TABLE Temp_Site_table Add ID_Pays int null constraint fk_country_temp foreign key(ID_Pays) references T_Pays(ID_Pays);
  ALTER TABLE Temp_Site_table Add ID_Ville int null constraint fk_city_temp foreign key(ID_Ville) references T_Ville(ID_Ville);
  ALTER TABLE Temp_Site_table Add ID_Dep int null constraint fk_depart_temp foreign key(ID_Dep) references T_Departement(ID_Dep);

CREATE VIEW R_SITE_VILLE_PAYS_DEPARTEMENT_TEMPO(
  ID_Site,NOM_Site,etat_val,etat_en,
   ID_Pays,codepays,nompays,
   ID_Dep,nomdep,
   ID_Ville,nom_ville,etat_val
) as select 
   s.ID_Site,s.NOM_Site,s.etat_val,s.etat_en,
   p.ID_Pays, p.codepays, p.nompays,
   d.ID_Dep,d.nomdep,
   v.ID_Ville,v.nom_ville,v.etat_val
   from T_Pays p, T_Departement d,T_Ville v,Temp_Site_table s
   where s.ID_Pays=p.ID_Pays AND s.ID_Ville=v.ID_Ville AND d.ID_Pays=p.ID_Pays AND v.ID_Dep=d.ID_Dep;