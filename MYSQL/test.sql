create procedure getsum(in n int,out sum int)
begin
declare i int default 0;
set sum=0;
while i<=n do
	set sum=sum+i;
	set i=i+1;
end while;
end$