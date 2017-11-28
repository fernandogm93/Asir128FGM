#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Dime tu equipo de futbol favorito</h1>
          <form name=\"search\" method=\"get\" >";
   open F, "/home/usuario/equipos.txt";
   while(<F>) {
     chomp;
     @campos=split(",");
     $ar{$campos[0]}=$campos[0];
   }
   print "<select name = \"nombre\">";
   for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
   }
   print "</select>
         <input type=\"submit\" value=\"Search\" />";
}
else {
   @arGet=split("=",$ENV{'QUERY_STRING'});
   $arGet[1]=~ s/%2F/\//g;
   print "Entonces eres del equipo $arGet[1]";
}
