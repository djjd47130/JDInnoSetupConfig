unit uItemsDirs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBase, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Grids, Vcl.ValEdit,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmDirs = class(TfrmCollectionBase)
    Label9: TLabel;
    txtName: TEdit;
    lstAttribs: TCheckListBox;
    Label6: TLabel;
    lstPermissions: TValueListEditor;
    Label10: TLabel;
    lstFlags: TCheckListBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript;
      ACollection: TJDISBaseCollection); override;
    procedure PrepareColumns(AColumns: TListColumns); override;
    procedure ClearDetail; override;
    procedure SetEditState(const AEditing: Boolean); override;
    procedure GetListItemDetails(AItem: TJDISBaseCollectionItem;
      AListItem: TListItem); override;
    function IsValid: Boolean; override;
    procedure LoadItemDetail(AItem: TJDISBaseCollectionItem); override;
    procedure SaveItemDetail(AItem: TJDISBaseCollectionItem); override;
  end;

var
  frmDirs: TfrmDirs;

implementation

{$R *.dfm}

{ TfrmDirs }

constructor TfrmDirs.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmDirs.PrepareColumns(AColumns: TListColumns);
  procedure AC(const ACaption: String; AWidth: Integer);
  var
    C: TListColumn;
  begin
    C:= AColumns.Add;
    C.Caption:= ACaption;
    C.Width:= AWidth;
  end;
begin
  AColumns.Clear;
  AC('Directory Name', 200);
  AC('Attribs', 200);
  AC('Permissions', 200);
  AC('Flags', 200);
end;

procedure TfrmDirs.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISDir;
  F: TJDISDirFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISDir(AItem);
    AListItem.Caption:= I.Name;
    AListItem.SubItems.Add(I.AttribsStr);
    AListItem.SubItems.Add(I.Permissions.GetFullText);
    AListItem.SubItems.Add(I.FlagsStr);
  end;
end;

function TfrmDirs.IsValid: Boolean;
begin
  Result:= (txtName.Text <> '');
end;

procedure TfrmDirs.ClearDetail;
begin
  inherited;
  txtName.Text:= '';
  lstAttribs.CheckAll(TCheckBoxState.cbUnchecked);
  //TODO: Permissions
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
    //TODO: Components
    //TODO: Tasks
end;

procedure TfrmDirs.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISDir;
  A: TJDISAttrib;
  F: TJDISDirFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISDir(AItem);
    txtName.Text:= I.Name;
    for A:= Low(TJDISAttrib) to High(TJDISAttrib) do begin
      if A in I.Attribs then begin
        lstAttribs.Checked[Integer(A)]:= True;
      end;
    end;
    //TODO: Permissions
    for F:= Low(TJDISDirFlag) to High(TJDISDirFlag) do begin
      if F in I.Flags then begin
        lstFlags.Checked[Integer(F)]:= True;
      end;
    end;
    //TODO: Components
    //TODO: Tasks
  end;
end;

procedure TfrmDirs.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISDir;
  A: TJDISAttrib;
  F: TJDISDirFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISDir(AItem);
    I.Name:= txtName.Text;
    for A:= Low(TJDISAttrib) to High(TJDISAttrib) do begin
      if lstAttribs.Checked[Integer(A)] then begin
        I.Attribs:= I.Attribs + [A];
      end;
    end;
    //TODO: Permissions
    for F:= Low(TJDISDirFlag) to High(TJDISDirFlag) do begin
      if lstFlags.Checked[Integer(F)] then begin
        I.Flags:= I.Flags + [F];
      end;
    end;
    //TODO: Components
    //TODO: Tasks
  end;
end;

procedure TfrmDirs.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtName.ReadOnly:= not AEditing;
  lstAttribs.Enabled:= AEditing;
  lstPermissions.Enabled:= AEditing;
  lstFlags.Enabled:= AEditing;
end;

end.
