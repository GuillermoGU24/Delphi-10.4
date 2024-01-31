unit UCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ControlPages: TPageControl;
    pagina1: TTabSheet;
    pagina2: TTabSheet;
    DatatestConnection: TFDConnection;
    ClienteTable: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    Panel1: TPanel;
    Button1: TButton;
    LabeledEditApellido: TLabeledEdit;
    LabeledEditNombre: TLabeledEdit;
    LabeledEditTelefono: TLabeledEdit;
    BindingsList1: TBindingsList;
    Registrar: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    Genero: TLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    FDQueryDelete: TFDQuery;
    FDQueryUpdate: TFDQuery;
    ListView1: TListView;
    LinkListControlToField2: TLinkListControlToField;
    ComboBoxGenero: TComboBox;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure RegistrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  if ClienteTable.State in [dsEdit, dsInsert] then
    ClienteTable.Cancel;

  ControlPages.ActivePage := pagina1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClienteTable.Append;
  ControlPages.ActivePage := pagina2;
end;


procedure TForm1.RegistrarClick(Sender: TObject);
begin
  if ClienteTable.State in [dsEdit, dsInsert] then
    ClienteTable.Post;
  ControlPages.ActivePage := pagina1;
end;

end.
