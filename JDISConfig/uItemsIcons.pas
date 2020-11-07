unit uItemsIcons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBase, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  JD.InnoSetup, JD.InnoSetup.Common, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.CheckLst;

type
  TfrmIcons = class(TfrmCollectionBase)
    txtName: TEdit;
    Label9: TLabel;
    txtFilename: TEdit;
    Label1: TLabel;
    txtParameters: TEdit;
    Label2: TLabel;
    txtWorkingDir: TEdit;
    Label3: TLabel;
    txtHotKey: TEdit;
    Label4: TLabel;
    txtComment: TEdit;
    Label5: TLabel;
    txtIconFilename: TEdit;
    Label6: TLabel;
    Label16: TLabel;
    seIconIndex: TSpinEdit;
    txtAppUserModelID: TEdit;
    Label7: TLabel;
    lstFlags: TCheckListBox;
    Label8: TLabel;
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
  frmIcons: TfrmIcons;

implementation

{$R *.dfm}

{ TfrmIcons }

constructor TfrmIcons.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmIcons.PrepareColumns(AColumns: TListColumns);
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
  AC('Name', 250);
  AC('Filename', 250);
  AC('Parameters', 120);
  AC('WorkingDir', 200);
  AC('Hot Key', 150);
  AC('Comment', 150);
  AC('Icon Filename', 200);
  AC('Icon Idx', 60);
  AC('App User Model ID', 120);
  AC('Flags', 200);
end;

procedure TfrmIcons.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISIcon;
begin
  inherited;
  I:= TJDISIcon(AItem);
  AListItem.Caption:= I.Name;
  AListItem.SubItems.Add(I.Filename);
  AListItem.SubItems.Add(I.Parameters);
  AListItem.SubItems.Add(I.WorkingDir);
  AListItem.SubItems.Add(I.HotKey);
  AListItem.SubItems.Add(I.Comment);
  AListItem.SubItems.Add(I.IconFilename);
  AListItem.SubItems.Add(IntToStr(I.IconIndex));
  AListItem.SubItems.Add(I.AppUserModelID);
  AListItem.SubItems.Add(I.FlagsStr);
end;

function TfrmIcons.IsValid: Boolean;
begin
  Result:= (txtName.Text <> '') and (txtFilename.Text <> '');
end;

procedure TfrmIcons.ClearDetail;
begin
  inherited;
  txtName.Text:= '';
  txtFilename.Text:= '';
  txtParameters.Text:= '';
  txtWorkingDir.Text:= '';
  txtHotKey.Text:= '';
  txtComment.Text:= '';
  txtIconFilename.Text:= '';
  seIconIndex.Value:= 0;
  txtAppUserModelID.Text:= '';
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
end;

procedure TfrmIcons.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISIcon;
  F: TJDISIconFlag;
begin
  inherited;
  I:= TJDISIcon(AItem);
  txtName.Text:= I.Name;
  txtFilename.Text:= I.Filename;
  txtParameters.Text:= I.Parameters;
  txtWorkingDir.Text:= I.WorkingDir;
  txtHotKey.Text:= I.HotKey;
  txtComment.Text:= I.Comment;
  txtIconFilename.Text:= I.IconFilename;
  seIconIndex.Value:= I.IconIndex;
  txtAppUserModelID.Text:= I.AppUserModelID;
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
  for F:= Low(TJDISIconFlag) to High(TJDISIconFlag) do begin
    if F in I.Flags then begin
      lstFlags.Checked[Integer(F)]:= True;
    end;
  end;

end;

procedure TfrmIcons.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISIcon;
  F: TJDISIconFlag;
begin
  inherited;
  I:= TJDISIcon(AItem);
  I.Name:= txtName.Text;
  I.Filename:= txtFilename.Text;
  I.Parameters:= txtParameters.Text;
  I.WorkingDir:= txtWorkingDir.Text;
  I.HotKey:= txtHotKey.Text;
  I.Comment:= txtComment.Text;
  I.IconFilename:= txtIconFilename.Text;
  I.IconIndex:= seIconIndex.Value;
  I.AppUserModelID:= txtAppUserModelID.Text;
  for F:= Low(TJDISIconFlag) to High(TJDISIconFlag) do begin
    if lstFlags.Checked[Integer(F)] then begin
      I.Flags:= I.Flags + [F];
    end;
  end;

end;

procedure TfrmIcons.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtName.ReadOnly:= not AEditing;
  txtFilename.ReadOnly:= not AEditing;
  txtParameters.ReadOnly:= not AEditing;
  txtWorkingDir.ReadOnly:= not AEditing;
  txtHotKey.ReadOnly:= not AEditing;
  txtComment.ReadOnly:= not AEditing;
  txtIconFilename.ReadOnly:= not AEditing;
  seIconIndex.ReadOnly:= not AEditing;
  txtAppUserModelID.ReadOnly:= not AEditing;
  lstFlags.Enabled:= AEditing;
end;

end.
