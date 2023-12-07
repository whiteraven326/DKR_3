uses Crt;
type
  tfunc = function(x: Real): Real;

function f(x: real): real;
begin
  f:=2*(x**3)+1*(x**2)+(-3)*x+8;
end;

procedure trap(a, b: Real; n: Integer; func: tfunc; var s, pogr:real);
var
  h, x,sum: Real;
  i: Integer;
begin
  h:= (b-a)/n;
  sum := (func(a) + func(b)) / 2;
  x:= a+h;
  for i:=1 to n-1 do begin
    sum := sum + func(x); 
    x := x + h;
  end;
  s := h * sum; 
  pogr := abs(s - (h / 2) * (func(a) + 2 * sum + func(b)));
end;

var
  a, b: Real;
  n: Integer;
  s, pogr: Real;
  ch: char;
  x, y: integer;
  color : Byte;
begin
  repeat
    ClrScr;
    textcolor(Green);
    writeln('1. Вычисление площади фигуры, ограниченной кривой');
    writeln('2. Выход');
    write('Выберите действие: '); 
    ch := ReadKey;
    case ch of
      '1':
      begin
        ClrScr;
        Textcolor(Green);
        writeln('Введите границы интегрирования: ');
        readln(a, b);
        Textcolor(Green);
        writeln('Введите количество делений: ');
        readln(n);
        trap(a, b, n, f, s, pogr);
        Textcolor(LightRed);
        writeln('Площадь фигуры: ', s);
        Textcolor(LightRed);
        writeln('Погрешность: ', pogr);
        readln;
      end;
      '2': halt;
    end;
  until ch = '2';
end.
