program dates; 

var 
months: array [1..12] of integer = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
wins: array[1..12, 1..31] of integer; 
i, j: integer; 

function win(day, month, p1, p2: integer): integer; 
begin 
if (day = 31) and (month = 12) then 
win := p1 
else 
begin 
if (wins[month, day] <> 0) then 

begin 
if wins[month, day] = 1 then 
win := p1; 
if wins[month, day] = 2 then 
win := p2; 
end 
else 
begin 
if (months[month] >= day + 1) and (win(day + 1, month, p2, p1) = p1) then 
begin 
win := p1; 
wins[month, day] := 1; 
end; 
if (months[month] >= day + 2) and (win(day + 2, month, p2, p1) = p1) then 
begin 
win := p1; 
wins[month, day] := 1; 
end; 
if (month + 1 < 13) and (months[month + 1] >= day) and (win(day, month + 1, p2, p1) = p1) then 
begin 
win := p1; 
wins[month, day] := 1; 
end; 
if (month + 2 < 13) and (months[month + 2] >= day) and (win(day, month + 2, p2, p1) = p1) then 
begin 
win := p1; 
wins[month, day] := 1; 
end; 
if wins[month, day] = 0 then 
begin 
wins[month, day] := 2; 
win := p2; 
end; 
end; 
end; 
end; 

begin 
for i := 1 to 12 do 
for j := 1 to months[i] do 
wins[i, j] := 0; 
read(i, j); 
writeln(win(i, j, 1, 2)); 
end.