unit uItemsComponents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Samples.Spin,
  uCollectionBaseNEW,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmComponents = class(TfrmCollectionBaseNEW)
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    txtName: TEdit;
    txtDescription: TEdit;
    lstFlags: TCheckListBox;
    seExtraDiskSpaceRequired: TSpinEdit;
    Label1: TLabel;
    txtTypes: TMemo;
    Label2: TLabel;
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
  frmComponents: TfrmComponents;

implementation

{$R *.dfm}

{ TfrmComponents }

constructor TfrmComponents.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmComponents.PrepareColumns(AColumns: TListColumns);
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
  AC('Component Name', 200);
  AC('Description', 200);
  AC('Extra Disk Space Required', 120);
  AC('Types', 250);
  AC('Flags', 250);
end;

procedure TfrmComponents.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISComponent;
begin
  inherited;
  I:= TJDISComponent(AItem);
  AListItem.Caption:= I.Name;
  AListItem.SubItems.Add(I.Description);
  AListItem.SubItems.Add(IntToStr(I.ExtraDiskSpaceRequired));
  AListItem.SubItems.Add(I.TypesStr);
  AListItem.SubItems.Add(I.FlagsStr);
end;

function TfrmComponents.IsValid: Boolean;
begin
  Result:= (txtName.Text <> '') and (txtDescription.Text <> '');
end;

procedure TfrmComponents.ClearDetail;
begin
  inherited;
  txtName.Text:= '';
  txtDescription.Text:= '';
  seExtraDiskSpaceRequired.Value:= 0;
  txtTypes.Lines.Clear;
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
end;

procedure TfrmComponents.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISComponent;
  F: TJDISComponentFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISComponent(AItem);
    txtName.Text:= I.Name;
    txtDescription.Text:= I.Description;
    seExtraDiskSpaceRequired.Value:= I.ExtraDiskSpaceRequired;
    txtTypes.Lines.Assign(I.Types);
    for F:= Low(TJDISComponentFlag) to High(TJDISComponentFlag) do begin
      if F in I.Flags then begin
        lstFlags.Checked[Integer(F)]:= True;
      end;
    end;
  end;
end;

procedure TfrmComponents.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISComponent;
  F: TJDISComponentFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISComponent(AItem);
    I.Name:= txtName.Text;
    I.Description:= txtDescription.Text;
    I.ExtraDiskSpaceRequired:= seExtraDiskSpaceRequired.Value;
    I.Types.Assign(txtTypes.Lines);
    I.Flags:= [];
    for F:= Low(TJDISComponentFlag) to High(TJDISComponentFlag) do begin
      if lstFlags.Checked[Integer(F)] then begin
        I.Flags:= I.Flags + [F];
      end;
    end;
  end;
end;

procedure TfrmComponents.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtName.ReadOnly:= not AEditing;
  txtDescription.ReadOnly:= not AEditing;
  seExtraDiskSpaceRequired.ReadOnly:= not AEditing;
  txtTypes.ReadOnly:= not AEditing;
  lstFlags.Enabled:= AEditing; //TODO
end;

end.
