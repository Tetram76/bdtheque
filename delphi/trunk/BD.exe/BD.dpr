program BD;

{$INCLUDE FastMM4Options.inc}

{$R *.dres}
{$R *.RES}

uses
  FastMM4,
  Windows,
  SysUtils,
  Forms,
  Controls,
  Dialogs,
  SyncObjs,
  Divers,
  DateUtils,
  UfrmFond in 'UfrmFond.pas' {frmFond},
  UdmPrinc in 'UdmPrinc.pas' {dmPrinc: TDataModule},
  UfrmRepertoire in 'Consultation\UfrmRepertoire.pas' {frmRepertoire},
  UfrmConsultationAuteur in 'Consultation\UfrmConsultationAuteur.pas' {frmConsultationAuteur},
  UfrmConsultationSerie in 'Consultation\UfrmConsultationSerie.pas' {frmConsultationSerie},
  UfrmConsultationParaBD in 'Consultation\UfrmConsultationParaBD.pas' {frmConsultationParaBD},
  UfrmZoomCouverture in 'Consultation\UfrmZoomCouverture.pas' {frmZoomCouverture},
  UfrmRecherche in 'Consultation\UfrmRecherche.pas' {frmRecherche},
  UfrmEditCritereTri in 'Consultation\UfrmEditCritereTri.pas' {frmEditCritereTri},
  UfrmStatsGeneral in 'Consultation\UfrmStatsGeneral.pas' {frmStatsGenerales},
  UfrmStatsAlbums in 'Consultation\UfrmStatsAlbums.pas' {frmStatsAlbums},
  UdmCommun in 'UdmCommun.pas' {dmCommun: TDataModule},
  Editions in 'Gestion\Editions.pas',
  Proc_Gestions in 'Gestion\Proc_Gestions.pas',
  UfrmGestion in 'Gestion\UfrmGestion.pas' {frmGestions},
  UfrmEditAlbum in 'Gestion\UfrmEditAlbum.pas' {frmEditAlbum},
  UfrmEditAchatAlbum in 'Gestion\UfrmEditAchatAlbum.pas' {frmEditAchatAlbum},
  UfrmEditEditeur in 'Gestion\UfrmEditEditeur.pas' {frmEditEditeur},
  UfrmEditSerie in 'Gestion\UfrmEditSerie.pas' {frmEditSerie},
  UfrmEditCollection in 'Gestion\UfrmEditCollection.pas' {frmEditCollection},
  UfrmEditAuteur in 'Gestion\UfrmEditAuteur.pas' {frmEditAuteur},
  UfrmEditParaBD in 'Gestion\UfrmEditParaBD.pas' {frmEditParaBD},
  Impression in 'Consultation\Impression.pas',
  UfrmOptions in 'UfrmOptions.pas' {frmOptions},
  UfrmCustomize in 'UfrmCustomize.pas' {frmCustomize},
  UfrmChoix in 'UfrmChoix.pas' {frmChoix},
  UfrmChoixDetail in 'UfrmChoixDetail.pas' {frmChoixDetail},
  UfrmConvertisseur in 'UfrmConvertisseur.pas' {FrmConvers},
  UframConvertisseur in 'UframConvertisseur.pas' {framConvertisseur: TFrame},
  UframRechercheRapide in 'UframRechercheRapide.pas' {framRechercheRapide: TFrame},
  MAJ in 'Consultation\MAJ.pas',
  UfrmPreview in 'Consultation\UfrmPreview.pas' {frmPreview},
  UHistorique in 'UHistorique.pas',
  UfrmEntretien in 'UfrmEntretien.pas' {frmEntretien},
  UfrmExportation in 'Gestion\UfrmExportation.pas' {frmExportation},
  UfrmPrevisionsSorties in 'Consultation\UfrmPrevisionsSorties.pas' {frmPrevisionsSorties},
  UfrmSeriesIncompletes in 'Consultation\UfrmSeriesIncompletes.pas' {frmSeriesIncompletes},
  UfrmPrevisionAchats in 'Consultation\UfrmPrevisionAchats.pas' {frmPrevisionsAchats},
  Updates in 'mises_a_jour\Updates.pas',
  UfrmWizardImport in 'Gestion\UfrmWizardImport.pas' {frmWizardImport},
  UImportXML in 'Gestion\UImportXML.pas',
  ProceduresBDtk in 'ProceduresBDtk.pas',
  UfrmChoixDetailSerie in 'UfrmChoixDetailSerie.pas' {frmChoixDetailSerie},
  UMAJODS in 'mises_a_jour\UMAJODS.pas',
  UfrmEditCritere in 'Consultation\UfrmEditCritere.pas' {frmEditCritere},
  UChampsRecherche in 'Consultation\UChampsRecherche.pas',
  UfrmPublier in 'Web\UfrmPublier.pas' {frmPublier},
  UMySQLMAJ1_0_0_1 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_1.pas',
  UMySQLMAJ1_0_0_0 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_0.pas',
  UMySQLMAJ1_0_0_2 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_2.pas',
  UfrmControlImport in 'Gestion\UfrmControlImport.pas' {frmControlImport},
  UVirtualTreeEdit in 'UVirtualTreeEdit.pas',
  UframVTEdit in 'UframVTEdit.pas' {framVTEdit: TFrame},
  UMAJ2_1_1_7 in 'mises_a_jour\UMAJ2_1_1_7.pas',
  UMAJ0_0_0_6 in 'mises_a_jour\UMAJ0_0_0_6.pas',
  UMAJ0_0_0_8 in 'mises_a_jour\UMAJ0_0_0_8.pas',
  UMAJ0_0_0_9 in 'mises_a_jour\UMAJ0_0_0_9.pas',
  UMAJ0_0_1_2 in 'mises_a_jour\UMAJ0_0_1_2.pas',
  UMAJ0_0_1_7 in 'mises_a_jour\UMAJ0_0_1_7.pas',
  UMAJ0_0_2_2 in 'mises_a_jour\UMAJ0_0_2_2.pas',
  UMAJ0_0_2_3 in 'mises_a_jour\UMAJ0_0_2_3.pas',
  UMAJ0_0_2_5 in 'mises_a_jour\UMAJ0_0_2_5.pas',
  UMAJ0_0_2_7 in 'mises_a_jour\UMAJ0_0_2_7.pas',
  UMAJ0_0_2_19 in 'mises_a_jour\UMAJ0_0_2_19.pas',
  UMAJ0_0_2_23 in 'mises_a_jour\UMAJ0_0_2_23.pas',
  UMAJ0_0_3_01 in 'mises_a_jour\UMAJ0_0_3_01.pas',
  UMAJ0_0_3_02 in 'mises_a_jour\UMAJ0_0_3_02.pas',
  UMAJ0_0_3_07 in 'mises_a_jour\UMAJ0_0_3_07.pas',
  UMAJ0_0_3_14 in 'mises_a_jour\UMAJ0_0_3_14.pas',
  UMAJ0_0_3_16 in 'mises_a_jour\UMAJ0_0_3_16.pas',
  UMAJ0_0_3_19 in 'mises_a_jour\UMAJ0_0_3_19.pas',
  UMAJ0_0_3_21 in 'mises_a_jour\UMAJ0_0_3_21.pas',
  UMAJ0_0_3_22 in 'mises_a_jour\UMAJ0_0_3_22.pas',
  UMAJ0_0_3_23 in 'mises_a_jour\UMAJ0_0_3_23.pas',
  UMAJ0_0_3_24 in 'mises_a_jour\UMAJ0_0_3_24.pas',
  UMAJ0_0_3_25 in 'mises_a_jour\UMAJ0_0_3_25.pas',
  UMAJ0_0_3_27 in 'mises_a_jour\UMAJ0_0_3_27.pas',
  UMAJ1_0_0_0 in 'mises_a_jour\UMAJ1_0_0_0.pas',
  UMAJ1_0_0_2 in 'mises_a_jour\UMAJ1_0_0_2.pas',
  UMAJ1_0_0_3 in 'mises_a_jour\UMAJ1_0_0_3.pas',
  UMAJ1_1_0_0 in 'mises_a_jour\UMAJ1_1_0_0.pas',
  UMAJ1_2_0_0 in 'mises_a_jour\UMAJ1_2_0_0.pas',
  UMAJ1_2_0_8 in 'mises_a_jour\UMAJ1_2_0_8.pas',
  UMAJ1_2_1_0 in 'mises_a_jour\UMAJ1_2_1_0.pas',
  UMAJ1_2_2_0 in 'mises_a_jour\UMAJ1_2_2_0.pas',
  UMAJ1_2_3_3 in 'mises_a_jour\UMAJ1_2_3_3.pas',
  UMAJ1_2_3_14 in 'mises_a_jour\UMAJ1_2_3_14.pas',
  UMAJ1_2_3_20 in 'mises_a_jour\UMAJ1_2_3_20.pas',
  UMAJ1_2_3_22 in 'mises_a_jour\UMAJ1_2_3_22.pas',
  UMAJ1_2_3_25 in 'mises_a_jour\UMAJ1_2_3_25.pas',
  UMAJ1_2_3_26 in 'mises_a_jour\UMAJ1_2_3_26.pas',
  UMAJ2_0_0_5 in 'mises_a_jour\UMAJ2_0_0_5.pas',
  UMAJ2_0_1_0 in 'mises_a_jour\UMAJ2_0_1_0.pas',
  UMAJ2_1_0_0 in 'mises_a_jour\UMAJ2_1_0_0.pas',
  UMAJ2_1_0_16 in 'mises_a_jour\UMAJ2_1_0_16.pas',
  UMAJ2_1_0_22 in 'mises_a_jour\UMAJ2_1_0_22.pas',
  UMAJ2_1_0_72 in 'mises_a_jour\UMAJ2_1_0_72.pas',
  UMAJ2_1_1_2 in 'mises_a_jour\UMAJ2_1_1_2.pas',
  UfrmFusionEditions in 'Gestion\UfrmFusionEditions.pas' {frmFusionEditions},
  UMAJ2_1_1_4 in 'mises_a_jour\UMAJ2_1_1_4.pas',
  UMAJ2_1_1_8 in 'mises_a_jour\UMAJ2_1_1_8.pas',
  UfrmGallerie in 'Consultation\UfrmGallerie.pas' {frmGallerie},
  VirtualTreeBdtk in 'VirtualTreeBdtk.pas',
  UMAJ2_1_1_10 in 'mises_a_jour\UMAJ2_1_1_10.pas',
  UMAJ2_1_1_17 in 'mises_a_jour\UMAJ2_1_1_17.pas',
  UMAJ2_1_1_155 in 'mises_a_jour\UMAJ2_1_1_155.pas',
  UfrmConsultationAlbum in 'Consultation\UfrmConsultationAlbum.pas' {frmConsultationAlbum},
  UMAJ2_2_2_233 in 'mises_a_jour\UMAJ2_2_2_233.pas',
  UMAJ2_2_3_13 in 'mises_a_jour\UMAJ2_2_3_13.pas',
  UfrmConsultationUnivers in 'Consultation\UfrmConsultationUnivers.pas' {frmConsultationUnivers},
  UfrmEditUnivers in 'Gestion\UfrmEditUnivers.pas' {frmEditUnivers},
  UMAJ2_2_3_16 in 'mises_a_jour\UMAJ2_2_3_16.pas',
  UMAJ2_2_3_17 in 'mises_a_jour\UMAJ2_2_3_17.pas',
  UMAJ2_2_3_19 in 'mises_a_jour\UMAJ2_2_3_19.pas',
  UMAJ2_2_3_21 in 'mises_a_jour\UMAJ2_2_3_21.pas',
  UMySQLMAJ1_0_0_3 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_3.pas',
  UMAJ2_2_3_22 in 'mises_a_jour\UMAJ2_2_3_22.pas',
  UMAJ2_2_3_23 in 'mises_a_jour\UMAJ2_2_3_23.pas',
  CommonConst in '..\Commun\CommonConst.pas',
  Commun in '..\Commun\Commun.pas',
  Textes in '..\Commun\Textes.pas',
  UBdtForms in '..\Commun\UBdtForms.pas' {bdtForm},
  UframBoutons in '..\Commun\UframBoutons.pas' {framBoutons: TFrame},
  UfrmAboutBox in '..\Commun\UfrmAboutBox.pas' {frmAboutBox},
  UfrmConsole in '..\Commun\UfrmConsole.pas' {frmConsole},
  UfrmProgression in '..\Commun\UfrmProgression.pas' {frmProgression},
  UfrmSplash in '..\Commun\UfrmSplash.pas' {frmSplash},
  UfrmVerbose in '..\Commun\UfrmVerbose.pas' {frmVerbose},
  UMetadata in '..\Commun\UMetadata.pas',
  Procedures in '..\Commun\Procedures.pas',
  UNet in '..\Commun\UNet.pas',
  VirtualTree in '..\Commun\VirtualTree.pas',
  Entities.DaoFull in 'Entities\Entities.DaoFull.pas',
  Entities.DaoLite in 'Entities\Entities.DaoLite.pas',
  DaoRecherche in 'Entities\DaoRecherche.pas',
  DaoStats in 'Entities\DaoStats.pas',
  EntitiesRecherche in 'Entities\EntitiesRecherche.pas',
  EntitiesStats in 'Entities\EntitiesStats.pas',
  LoadCompletImport in 'Entities\LoadCompletImport.pas',
  Entities.Deserializer in '..\Commun\Entities\Entities.Deserializer.pas',
  Entities.Full in '..\Commun\Entities\Entities.Full.pas',
  Entities.Lite in '..\Commun\Entities\Entities.Lite.pas',
  Entities.Serializer in '..\Commun\Entities\Entities.Serializer.pas',
  JsonDeserializer in '..\Commun\Entities\JsonDeserializer.pas',
  JsonSerializer in '..\Commun\Entities\JsonSerializer.pas',
  BdtkRegEx in '..\Commun\BdtkRegEx.pas',
  UScriptList in '..\Commun\Scripts\UScriptList.pas',
  UfrmValidationImport in 'Scripts\UfrmValidationImport.pas' {frmValidationImport},
  Entities.DaoCommon in 'Entities\Entities.DaoCommon.pas',
  Entities.Common in '..\Commun\Entities\Entities.Common.pas',
  Entities.FactoriesCommon in '..\Commun\Entities\Entities.FactoriesCommon.pas',
  Entities.FactoriesLite in '..\Commun\Entities\Entities.FactoriesLite.pas',
  Entities.FactoriesFull in '..\Commun\Entities\Entities.FactoriesFull.pas',
  Entities.DaoLambda in '..\Commun\Entities\Entities.DaoLambda.pas',
  Entities.DaoLambdaDB in 'Entities\Entities.DaoLambdaDB.pas',
  UfrmChoixScript in 'Scripts\UfrmChoixScript.pas' {frmChoixScript},
  UfrmScriptOption in '..\Commun\Scripts\UfrmScriptOption.pas' {frmScriptOption};

begin
  Application.Title := 'BDth�que';
  Application.MainFormOnTaskbar := True;
  Application.Initialize;
  Application.Run;
end.

