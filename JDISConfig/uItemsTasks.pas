unit uItemsTasks;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBaseNEW, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmTasks = class(TfrmCollectionBaseNEW)
    Label9: TLabel;
    Label10: TLabel;
    txtName: TEdit;
    txtDescription: TEdit;
    Label1: TLabel;
    txtGroupDescription: TEdit;
    txtComponents: TMemo;
    Label2: TLabel;
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
  frmTasks: TfrmTasks;

implementation

{$R *.dfm}

{ TfrmTasks }

constructor TfrmTasks.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmTasks.PrepareColumns(AColumns: TListColumns);
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
  AC('Task Name', 200);
  AC('Description', 200);
  AC('Group Description', 200);
  AC('Components', 250);
  AC('Flags', 250);
end;

procedure TfrmTasks.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISTask;
begin
  inherited;
  I:= TJDISTask(AItem);
  AListItem.Caption:= I.Name;
  AListItem.SubItems.Add(I.Description);
  AListItem.SubItems.Add(I.GroupDescription);
  AListItem.SubItems.Add(GetSpacedList(I.Components));
  AListItem.SubItems.Add(I.FlagsStr);
end;

procedure TfrmTasks.ClearDetail;
begin
  inherited;
  txtName.Text:= '';
  txtDescription.Text:= '';
  txtGroupDescription.Text:= '';
  txtComponents.Lines.Clear;
  lstFlags.CheckAll(TCheckBoxState.cbUnchecked);
end;

function TfrmTasks.IsValid: Boolean;
begin
  Result:= (txtName.Text <> '') and (txtDescription.Text <> '');
end;

procedure TfrmTasks.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISTask;
  F: TJDISTaskFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISTask(AItem);
    txtName.Text:= I.Name;
    txtDescription.Text:= I.Description;
    txtGroupDescription.Text:= I.GroupDescription;
    txtComponents.Lines.Assign(I.Components);
    for F:= Low(TJDISTaskFlag) to High(TJDISTaskFlag) do begin
      if F in I.Flags then begin
        lstFlags.Checked[Integer(F)]:= True;
      end;
    end;
  end;
end;

procedure TfrmTasks.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISTask;
  F: TJDISTaskFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISTask(AItem);
    I.Name:= txtName.Text;
    I.Description:= txtDescription.Text;
    I.GroupDescription:= txtGroupDescription.Text;
    I.Components.Assign(txtComponents.Lines);
    I.Flags:= [];
    for F:= Low(TJDISTaskFlag) to High(TJDISTaskFlag) do begin
      if lstFlags.Checked[Integer(F)] then begin
        I.Flags:= I.Flags + [F];
      end;
    end;
  end;
end;

procedure TfrmTasks.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtName.ReadOnly:= not AEditing;
  txtDescription.ReadOnly:= not AEditing;
  txtGroupDescription.ReadOnly:= not AEditing;
  txtComponents.ReadOnly:= not AEditing;
  lstFlags.Enabled:= AEditing;
end;

end.
