�
 TFRMMDREL 0�  TPF0	TFrmMdRelFrmMdRelLeftToprBorderIconsbiSystemMenu Caption   Modelo Relatório do CadastroClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPosition	poDefaultScaledVisible	OnCreate
FormCreatePixelsPerInch`
TextHeight 	TQuickRepQRMdRelLeft TopWidth0Height Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.ContinuousPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.OutputBinAutoPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage "PrinterSettings.UseStandardprinter PrinterSettings.UseCustomBinCodePrinterSettings.CustomBinCode PrinterSettings.ExtendedDuplex "PrinterSettings.UseCustomPaperCodePrinterSettings.CustomPaperCode PrinterSettings.PrintMetaFilePrinterSettings.PrintQuality PrinterSettings.Collate PrinterSettings.ColorOption PrintIfEmpty	
SnapToGrid	UnitsMMZoomdPrevFormStylefsNormalPreviewInitialStatewsMaximizedPrevInitialZoomqrZoomToWidthPreviewDefaultSaveTypestQRPPreviewLeft 
PreviewTop  TQRBandQRB1Left&Top&Width�Height-AlignToBottomColorclWhiteTransparentBandForceNewColumnForceNewPageSize.Values�������@UUUUUU��	@ PreCaluculateBandHeightKeepOnOnePageBandTyperbPageHeader TQRLabelQRLblEmpresaLeftTopWidthsHeightSize.Values     @�@UUUUUUU� @UUUUUUU� @������"�@ XLColumn 	AlignmenttaLeftJustifyAlignToBandCaptionNome da EmpresaColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTransparentExportAsexptText	WrapStyleBreakOnSpacesFontSize
  
TQRSysData
QRSysData1Left�TopWidth:HeightSize.ValuesUUUUUU�@��������	@UUUUUUU� @UUUUUUu�@ XLColumn 	AlignmenttaLeftJustifyAlignToBandColorclWhiteDataqrsPageNumberFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontText    TransparentExportAsexptTextFontSize  TQRLabelQRLblProgramaLeft TopWidth]HeightSize.Values��������@               @�@      �@ XLColumn 	AlignmenttaLeftJustifyAlignToBandCaptionSaef - v 2.7->ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTransparentExportAsexptText	WrapStyleBreakOnSpacesFontSize
  TQRLabelQRLblTituloLeftqTopWidthHHeightSize.Values��������@UUUUUU}�@     @�@      ��@ XLColumn 	AlignmenttaLeftJustifyAlignToBandCaptionQRLblTituloColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTransparentExportAsexptText	WrapStyleBreakOnSpacesFontSize
  
TQRSysData
QRSysData2Left�TopWidthTHeightSize.ValuesUUUUUU�@TUUUUU��	@     @�@     @�@ XLColumn 	AlignmenttaLeftJustifyAlignToBandColorclWhiteDataqrsDateTimeFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontText    TransparentExportAsexptTextFontSize  TQRShapeQRShape1Left Top)Width�HeightSize.ValuesUUUUUUU�@          UUUUUU��@VUUUUU��	@ XLColumn ShapeqrsRectangle
VertAdjust   TQRLabelQRLblPaginaLeft�TopWidth7HeightSize.ValuesUUUUUU�@��������	@UUUUUUU� @UUUUUU��@ XLColumn 	AlignmenttaLeftJustifyAlignToBandCaption   Página:ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentExportAsexptText	WrapStyleBreakOnSpacesFontSize    	TADOQueryADOQryConfig
ConnectionDModulo.Conexao
CursorTypectStatic
Parameters SQL.Strings>Select dsMenPromocional,nmEmpresa,dsPrazoOrcamento,dsEndereco,%           dsCgc,dsInscricao,dsCidadeFrom Configuracao Left� Top TStringFieldADOQryConfigdsMenPromocional	FieldNamedsMenPromocionalSize2  TStringFieldADOQryConfignmEmpresa	FieldName	nmEmpresaSize(  TStringFieldADOQryConfigdsPrazoOrcamento	FieldNamedsPrazoOrcamentoSize
  TStringFieldADOQryConfigdsEndereco	FieldName
dsEnderecoSizeA  TStringFieldADOQryConfigdsCgc	FieldNamedsCgc  TStringFieldADOQryConfigdsInscricao	FieldNamedsInscricaoSize  TStringFieldADOQryConfigdsCidade	FieldNamedsCidade   	TADOQueryADOQryRelDados
ConnectionDModulo.Conexao
Parameters Left� Top  TQRExcelFilterQRExcelFilter1TextEncodingDefaultEncodingUseXLColumnsLeft(Top  TQRPDFFilterQRPDFFilter1CompressionOnTextEncodingAnsiEncodingCodepage1252Left(Top�   TQRRTFFilterQRRTFFilter1TextEncodingDefaultEncodingLeft(Top�    