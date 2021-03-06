(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower Abbrevia
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

{*********************************************************}
{* ABBREVIA: UBASEDLG.PAS                                *}
{*********************************************************}
{* ABBREVIA Example program file                         *}
{*********************************************************}

unit QuBaseDlg;

interface

uses
  {$IFDEF WIN32}
  Windows,
  {$ELSE}
  {$ENDIF}
  SysUtils, Classes, QGraphics, QForms, QStdCtrls, QControls, QButtons,
  QDialogs;

type
  TBaseDirDlg = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    DirLabel: TLabel;
    ActionLabel: TLabel;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    Button3: TButton;
    edtDirectory1: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDirDlg: TBaseDirDlg;

implementation

{$R *.xfm}

uses
  AbUtils,
  QuDemoDlg;

procedure TBaseDirDlg.Button3Click(Sender: TObject);
begin
  DemoDlg := TDemoDlg.Create( Self );
  try
    DemoDlg.Caption := 'Create Subdirectory';
    DemoDlg.Edit1.Text := '';
    DemoDlg.ShowModal;
    if ( DemoDlg.ModalResult = mrOK ) and ( DemoDlg.Edit1.Text <> '' ) then
      AbCreateDirectory(IncludeTrailingPathDelimiter(edtDirectory1.Text) +
                        DemoDlg.Edit1.Text );
  finally
    DemoDlg.Free;
  end;
end;
procedure TBaseDirDlg.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtDirectory1.Text := ExtractFilePath (OpenDialog1.FileName);
end;


end.
