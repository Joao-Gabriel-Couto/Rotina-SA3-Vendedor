#include "topconn.ch"
#include "totvs.ch"
#include "tbiconn.ch"

user function jVenddClass()
    RPCSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"
          
	    u_uVenddClass()

	RESET ENVIRONMENT

return
user function uVenddClass()
    local oExeVendd
    
          oExeVendd := TestVendd():new()
 
          oExeVendd:TstdadosVendd()  
    
         
return

class TestVendd

    data oDadoVendd

    method new() constructor
    method TstdadosVendd() 
    method get_dadosVendd()
endclass


method new() class TestVendd
    ::oDadoVendd := VendedorClass():new_vendedor()
return
method TstdadosVendd() class TestVendd

     if ::get_dadosVendd()

     endif
return 
method get_dadosVendd() class TestVendd

    ::oDadoVendd:cFilVendd     := ""
    ::oDadoVendd:cCodVendd     := "000003"
    ::oDadoVendd:cNome         := "ALTERADO TEST TESTANDO"
    ::oDadoVendd:cNomeRedz     := "TESTANDO"
    ::oDadoVendd:cCep          := "00000"
    ::oDadoVendd:cDDD          := "19"
    ::oDadoVendd:cTell         := "987546231"
    ::oDadoVendd:cCGC          := "16584424073"
    ::oDadoVendd:cEmail        := "test@gmail.com"
    ::oDadoVendd:cGerente      := ""
    ::oDadoVendd:cSupervisor   := ""
    
    ::oDadoVendd:nOpc          := 4 
    ::oDadoVendd:exe_rotinaVendd()
return 
