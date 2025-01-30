unit PokeDelphi.Helpers.ArrayLista;

interface

uses
  System.SysUtils;

type
  THelperArrayLista = class abstract
  public
    class procedure LiberarTodos(var pArray: TArray<TObject>);
  end;

implementation

{ THelperArrayLista }

class procedure THelperArrayLista.LiberarTodos(var pArray: TArray<TObject>);
begin
  for var lItem in pArray do
  begin
    if not Assigned(lItem) then
    begin
      Continue;
    end;

    FreeAndNil(lItem);
  end;
end;

end.
