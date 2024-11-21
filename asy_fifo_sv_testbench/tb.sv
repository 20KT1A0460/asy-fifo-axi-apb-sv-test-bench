program tb(interf in);
env e;
initial begin
e=new(in);
e.eprocess1();
e.print();
end

endprogram
