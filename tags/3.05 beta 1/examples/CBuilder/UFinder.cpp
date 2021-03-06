// ***** BEGIN LICENSE BLOCK *****
// * Version: MPL 1.1
// *
// * The contents of this file are subject to the Mozilla Public License Version
// * 1.1 (the "License"); you may not use this file except in compliance with
// * the License. You may obtain a copy of the License at
// * http://www.mozilla.org/MPL/
// *
// * Software distributed under the License is distributed on an "AS IS" basis,
// * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
// * for the specific language governing rights and limitations under the
// * License.
// *
// * The Original Code is TurboPower Abbrevia
// *
// * The Initial Developer of the Original Code is
// * TurboPower Software
// *
// * Portions created by the Initial Developer are Copyright (C) 1997-2002
// * the Initial Developer. All Rights Reserved.
// *
// * Contributor(s):
// *
// * ***** END LICENSE BLOCK *****
/*********************************************************/
/*                      UFinder.cpp                      */
/*********************************************************/
//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "UFinder.h"
//---------------------------------------------------------------------------
#pragma link "AbZBrows"
#pragma link "AbArcTyp"
#pragma link "AbBase"
#pragma link "AbBrowse"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
  Aborted = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Edit1Change(TObject *Sender)
{
  Button1->Enabled = Edit1->Text.Length() > 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  Button1->Enabled = false;
  Memo1->Clear();
  try {
    Button2->Enabled = true;
    Aborted = false;
    // look in the file list box for the file
    for (int i=0;i<FileListBox1->Items->Count;i++) {
      Application->ProcessMessages();
      if (Aborted) break;
      if (CompareText( Edit1->Text, FileListBox1->Items->Strings[i] ) == 0) {
        Memo1->Lines->Add( "Found in " + FileListBox1->Directory );
        break;
      }
      // now add search of zip and self extracting files
      String CurFile = UpperCase( FileListBox1->Items->Strings[i] );
      if (( CurFile.Pos( ".ZIP" ) > 0 ) ||
         ( CurFile.Pos( ".EXE" ) > 0 )) {
        try {
          AbZipBrowser1->FileName = FileListBox1->Items->Strings[i];
        }
        catch(...) {
        }
        if (AbZipBrowser1->Count > 0) {
          for (int j=0;j<AbZipBrowser1->Count;j++) {
            if (Aborted) break;
            if (AbZipBrowser1->Items[j]->MatchesStoredName(Edit1->Text)) {
                Memo1->Lines->Add( "Found in " + FileListBox1->Items->Strings[i] );
              break;
            }
          }
        }
      }
    }
  }
  catch (...) {
    Memo1->Lines->Add( "Done!" );
    Edit1->Enabled = true;
    Button1->Enabled = true;
    Button2->Enabled = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
  Aborted = true;
}
//---------------------------------------------------------------------------

