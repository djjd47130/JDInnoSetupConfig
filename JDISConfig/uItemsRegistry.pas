unit uItemsRegistry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBase, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  JD.InnoSetup, JD.InnoSetup.Common, Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit,
  Vcl.CheckLst;

type
  TfrmRegistry = class(TfrmCollectionBase)
    cboRoot: TComboBox;
    Label3: TLabel;
    txtSubkey: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    cboValueType: TComboBox;
    Label2: TLabel;
    txtValueName: TEdit;
    Label4: TLabel;
    txtValueData: TEdit;
    lstPermissions: TValueListEditor;
    Label10: TLabel;
    lstFlags: TCheckListBox;
    Label11: TLabel;
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
  frmRegistry: TfrmRegistry;

implementation

{$R *.dfm}

{ TfrmRegistry }

constructor TfrmRegistry.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmRegistry.PrepareColumns(AColumns: TListColumns);
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
  AC('Root', 150);
  AC('Subkey', 200);
  AC('Value Type', 80);
  AC('Value Name', 120);
  AC('Value Data', 200);
  AC('Permissions', 150);
  AC('Flags', 200);
end;

procedure TfrmRegistry.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISRegistryItem;
begin
  inherited;
  I:= TJDISRegistryItem(AItem);
  AListItem.SubItems.Clear;
  AListItem.Caption:= RegRootToStr(I.Root);
  AListItem.SubItems.Add(I.Subkey);
  AListItem.SubItems.Add(RegTypeToStr(I.ValueType));
  AListItem.SubItems.Add(I.ValueName);
  AListItem.SubItems.Add(I.ValueData);
  AListItem.SubItems.Add(I.Permissions.GetFullText);
  AListItem.SubItems.Add(I.FlagsStr);
end;

function TfrmRegistry.IsValid: Boolean;
begin
  Result:= (cboRoot.ItemIndex >= 0) and (txtSubkey.Text <> '');
end;

procedure TfrmRegistry.ClearDetail;
begin
  inherited;
  cboRoot.ItemIndex:= 0;
  txtSubKey.Text:= '';
  cboValueType.ItemIndex:= 0;
  txtValueName.Text:= '';
  txtValueData.Text:= '';
  //TODO: Permissions
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);

end;

procedure TfrmRegistry.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISRegistryItem;
  F: TJDISRegFlag;
begin
  inherited;
  I:= TJDISRegistryItem(AItem);
  cboRoot.ItemIndex:= Integer(I.Root);
  txtSubkey.Text:= I.Subkey;
  cboValueType.ItemIndex:= Integer(I.ValueType);
  txtValueName.Text:= I.ValueName;
  txtValueData.Text:= I.ValueData;
  //TODO: Permissions
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
  for F:= Low(TJDISRegFlag) to High(TJDISRegFlag) do begin
    if F in I.Flags then begin
      lstFlags.Checked[Integer(F)]:= True;
    end;
  end;


end;

procedure TfrmRegistry.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISRegistryItem;
  F: TJDISRegFlag;
begin
  inherited;
  I:= TJDISRegistryItem(AItem);
  I.Root:= TJDISRegRoot(cboRoot.ItemIndex);
  I.Subkey:= txtSubkey.Text;
  I.ValueType:= TJDISRegType(cboValueType.ItemIndex);
  I.ValueName:= txtValueName.Text;
  I.ValueData:= txtValueData.Text;
  //TODO: Permissions
  I.Flags:= [];
  for F:= Low(TJDISRegFlag) to High(TJDISRegFlag) do begin
    if lstFlags.Checked[Integer(F)] then begin
      I.Flags:= I.Flags + [F];
    end;
  end;

end;

procedure TfrmRegistry.SetEditState(const AEditing: Boolean);
begin
  inherited;
  cboRoot.Enabled:= AEditing;
  txtSubkey.ReadOnly:= not AEditing;
  cboValueType.Enabled:= AEditing;
  txtValueName.ReadOnly:= not AEditing;
  txtValueData.ReadOnly:= not AEditing;
  lstPermissions.Enabled:= AEditing;
  lstFlags.Enabled:= AEditing;
end;

end.
