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
  CommonConst in 'CommonConst.pas',
  Commun in 'Commun.pas',
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
  Textes in 'Textes.pas',
  Impression in 'Consultation\Impression.pas',
  UframBoutons in 'UframBoutons.pas' {framBoutons: TFrame},
  UfrmOptions in 'UfrmOptions.pas' {frmOptions},
  UfrmCustomize in 'UfrmCustomize.pas' {frmCustomize},
  UfrmSplash in 'UfrmSplash.pas' {frmSplash},
  UfrmAboutBox in 'UfrmAboutBox.pas' {frmAboutBox},
  UfrmChoix in 'UfrmChoix.pas' {frmChoix},
  UfrmChoixDetail in 'UfrmChoixDetail.pas' {frmChoixDetail},
  UfrmConvertisseur in 'UfrmConvertisseur.pas' {FrmConvers},
  UframConvertisseur in 'UframConvertisseur.pas' {framConvertisseur: TFrame},
  UframRechercheRapide in 'UframRechercheRapide.pas' {framRechercheRapide: TFrame},
  MAJ in 'Consultation\MAJ.pas',
  VirtualTree in 'VirtualTree.pas',
  UfrmPreview in 'Consultation\UfrmPreview.pas' {frmPreview},
  Procedures in 'Procedures.pas',
  UHistorique in 'UHistorique.pas',
  UfrmVerbose in 'UfrmVerbose.pas' {frmVerbose},
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
  UBdtForms in 'UBdtForms.pas',
  UfrmPublier in 'Web\UfrmPublier.pas' {frmPublier},
  UNet in 'Web\UNet.pas',
  UMySQLMAJ1_0_0_1 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_1.pas',
  UMySQLMAJ1_0_0_0 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_0.pas',
  UMySQLMAJ1_0_0_2 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_2.pas',
  UfrmScripts in 'Scripts\UfrmScripts.pas' {frmScripts},
  UfrmScriptSearch in 'Scripts\UfrmScriptSearch.pas' {frmScriptSearch},
  IDHashMap in 'Scripts\IDHashMap.pas',
  uPSC_BdtkObjects in 'Scripts\PascalScript\uPSC_BdtkObjects.pas',
  uPSI_BdtkObjects in 'Scripts\PascalScript\uPSI_BdtkObjects.pas',
  uPSR_BdtkObjects in 'Scripts\PascalScript\uPSR_BdtkObjects.pas',
  UScriptsFonctions in 'Scripts\UScriptsFonctions.pas',
  UScriptUtils in 'Scripts\UScriptUtils.pas',
  uPSC_BdtkRegEx in 'Scripts\PascalScript\uPSC_BdtkRegEx.pas',
  uPSI_BdtkRegEx in 'Scripts\PascalScript\uPSI_BdtkRegEx.pas',
  uPSR_BdtkRegEx in 'Scripts\PascalScript\uPSR_BdtkRegEx.pas',
  BdtkRegEx in 'Scripts\BdtkRegEx.pas',
  UMetadata in 'UMetadata.pas',
  UfrmControlImport in 'Gestion\UfrmControlImport.pas' {frmControlImport},
  UVirtualTreeEdit in 'UVirtualTreeEdit.pas',
  UframVTEdit in 'UframVTEdit.pas' {framVTEdit: TFrame},
  UfrmValidationImport in 'Scripts\UfrmValidationImport.pas' {frmValidationImport},
  UfrmScriptChoix in 'Scripts\UfrmScriptChoix.pas' {frmScriptChoix},
  UScriptsHTMLFunctions in 'Scripts\UScriptsHTMLFunctions.pas',
  UfrmScriptEditOption in 'Scripts\UfrmScriptEditOption.pas' {frmScriptEditOption},
  UfrmScriptOption in 'Scripts\UfrmScriptOption.pas' {frmScriptOption},
  UScriptList in 'Scripts\UScriptList.pas',
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
  UdmPascalScript in 'Scripts\PascalScript\UdmPascalScript.pas' {dmPascalScript: TDataModule},
  UfrmFusionEditions in 'Gestion\UfrmFusionEditions.pas' {frmFusionEditions},
  UMAJ2_1_1_4 in 'mises_a_jour\UMAJ2_1_1_4.pas',
  UMAJ2_1_1_8 in 'mises_a_jour\UMAJ2_1_1_8.pas',
  UfrmGallerie in 'Consultation\UfrmGallerie.pas' {frmGallerie},
  UfrmScriptsUpdate in 'Scripts\UfrmScriptsUpdate.pas' {frmScriptsUpdate},
  VirtualTreeBdtk in 'VirtualTreeBdtk.pas',
  UMAJ2_1_1_10 in 'mises_a_jour\UMAJ2_1_1_10.pas',
  UMAJ2_1_1_17 in 'mises_a_jour\UMAJ2_1_1_17.pas',
  UfrmProgression in 'UfrmProgression.pas' {frmProgression},
  UMAJ2_1_1_155 in 'mises_a_jour\UMAJ2_1_1_155.pas',
  UfrmConsultationAlbum in 'Consultation\UfrmConsultationAlbum.pas' {frmConsultationAlbum},
  uPSR_superobject in 'Scripts\PascalScript\uPSR_superobject.pas',
  uPSC_superobject in 'Scripts\PascalScript\uPSC_superobject.pas',
  uPSI_superobject in 'Scripts\PascalScript\uPSI_superobject.pas',
  UMAJ2_2_2_233 in 'mises_a_jour\UMAJ2_2_2_233.pas',
  UMAJ2_2_3_13 in 'mises_a_jour\UMAJ2_2_3_13.pas',
  UMasterEngine in 'Scripts\UMasterEngine.pas' {dmScripts: TDataModule},
  UPascalScriptEditor in 'Scripts\PascalScript\UPascalScriptEditor.pas',
  UScriptEditor in 'Scripts\UScriptEditor.pas',
  UDWScriptEditor in 'Scripts\DWScript\UDWScriptEditor.pas',
  UdmDWScript in 'Scripts\DWScript\UdmDWScript.pas',
  UDW_CommonFunctions in 'Scripts\DWScript\UDW_CommonFunctions.pas',
  UDW_BdtkRegEx in 'Scripts\DWScript\UDW_BdtkRegEx.pas',
  UDW_BdtkObjects in 'Scripts\DWScript\UDW_BdtkObjects.pas',
  UDWUnit in 'Scripts\DWScript\UDWUnit.pas',
  UfrmConsultationUnivers in 'Consultation\UfrmConsultationUnivers.pas' {frmConsultationUnivers},
  UfrmEditUnivers in 'Gestion\UfrmEditUnivers.pas' {frmEditUnivers},
  UMAJ2_2_3_16 in 'mises_a_jour\UMAJ2_2_3_16.pas',
  UframWatches in 'Scripts\UframWatches.pas' {framWatches: TFrame},
  UframBreakpoints in 'Scripts\UframBreakpoints.pas' {framBreakpoints: TFrame},
  UframMessages in 'Scripts\UframMessages.pas' {framMessages: TFrame},
  UframScriptInfos in 'Scripts\UframScriptInfos.pas' {framScriptInfos: TFrame},
  UfrmScriptGotoLine in 'Scripts\UfrmScriptGotoLine.pas' {frmScriptGotoLine},
  UScriptEngineIntf in 'Scripts\UScriptEngineIntf.pas',
  UMAJ2_2_3_17 in 'mises_a_jour\UMAJ2_2_3_17.pas',
  UMAJ2_2_3_19 in 'mises_a_jour\UMAJ2_2_3_19.pas',
  UMAJ2_2_3_21 in 'mises_a_jour\UMAJ2_2_3_21.pas',
  UMySQLMAJ1_0_0_3 in 'Web\mises_a_jour\UMySQLMAJ1_0_0_3.pas',
  UMAJ2_2_3_22 in 'mises_a_jour\UMAJ2_2_3_22.pas',
  UScriptEditorPage in 'Scripts\UScriptEditorPage.pas',
  UfrmConsole in 'UfrmConsole.pas' {frmConsole},
  EntitiesFull in 'DBObjets\EntitiesFull.pas',
  LoadCompletImport in 'DBObjets\LoadCompletImport.pas',
  EntitiesLite in 'DBObjets\EntitiesLite.pas',
  EntitiesStats in 'DBObjets\EntitiesStats.pas',
  EntitiesRecherche in 'DBObjets\EntitiesRecherche.pas',
  DaoLite in 'DBObjets\DaoLite.pas',
  DaoFull in 'DBObjets\DaoFull.pas',
  DaoStats in 'DBObjets\DaoStats.pas',
  DaoRecherche in 'DBObjets\DaoRecherche.pas',
  DaoLambda in 'DBObjets\DaoLambda.pas';

begin
  Application.Title := 'BDth�que';
  Application.MainFormOnTaskbar := True;
  Application.Initialize;
  Application.Run;
end.
