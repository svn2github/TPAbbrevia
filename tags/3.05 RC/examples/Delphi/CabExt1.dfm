�
 TFORM1 0�  TPF0TForm1Form1Left�Top)Width�Height}CaptionCabinet Extractor
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnClose	FormClosePixelsPerInch`
TextHeight TLabelLabel1Left� Top;WidthPHeightCaptionArchive Progress  TAbMeterAbMeter1LeftxTopHWidth� HeightOrientationmoHorizontalUnusedColor	clBtnFace	UsedColorclNavy  TButtonButton1Left5Top
WidthEHeightCaption&Extract...TabOrder OnClickButton1Click  TMemoMemo1Left
TopWidth Height-BorderStylebsNoneCtl3DLines.Strings7This example simply extracts all files from a Cabinet. 4Click the Extract button and choose a CAB file. The @contents of the file will be extracted to the current directory. ParentColor	ParentCtl3DReadOnly	TabOrder  TButtonButton2Left5Top*WidthEHeightCaptionAbortTabOrderOnClickButton2Click  TOpenDialogOpenDialog1
DefaultExtcabFilterCabinet Archives (*.cab)|*CABLeftTop8  TAbCabExtractorAbCabExtractor1ArchiveProgressMeterAbVCLMeterLink1OnConfirmProcessItem!AbCabExtractor1ConfirmProcessItemSetID Left0Top8  TAbVCLMeterLinkAbVCLMeterLink1MeterAbMeter1Left\Top<   