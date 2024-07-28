#include "topconn.ch"
#include "totvs.ch"
#include "tbiconn.ch"

/*/{Protheus.doc} VendedorClass
Classe generica vendedor.
@author João Couto
@since 24/07/2024
/*/
class VendedorClass
    
    data cFilVendd
    data cCodVendd
    data cNome
    data cNomeRedz
    data cCep
    data cDDD
    data cTell
    data cCGC
    data cEmail
    data cGerente 
    data cSupervisor

    data aValA3 

    data cError

    data OPC_INCLUIR
    data OPC_ALTERAR
    data OPC_EXCLUIR
    data nOpc

    method new_vendedor() constructor
    method getById()
    method setValByAlias()
    method prepDados_Vendd()
    method exe_rotinaVendd()    
    method manRegis_Vendd()
endclass 
/*/{Protheus.doc} VendedorClass
método construtor 
@author João Couto
@since 24/07/2024
/*/
method new_vendedor() class VendedorClass

    ::cError          := ""
    ::aValA3        := {}

    ::OPC_INCLUIR	:= 3
	::OPC_ALTERAR	:= 4
	::OPC_EXCLUIR	:= 5

return
/*/{Protheus.doc} VendedorClass
execução do métodos em sequecia da rotina.
@author João Couto
@since 24/07/2024
/*/
method exe_rotinaVendd() class VendedorClass

    if( Empty(::cError) )
        ::prepDados_Vendd()
    endIf

    if( Empty(::cError) )
        ::manRegis_Vendd()
    endIf

return
/*/{Protheus.doc} VendedorClass
Busca os dados pela chave principal da tabela
@author João Couto
@since 24/07/2024
/*/
method getById(lSeta) class VendedorClass
	local lRet := .T.
	
	default lSeta := .T.
		
	SA3->(DbSetOrder(1))
	if(SA3->(DbSeek(	PadR(::cFilVendd	    ,TamSx3("A3_FILIAL")[1])+ ;
						PadR(::cCodVendd		,TamSx3("A3_COD")   [1]))))
		if(lSeta)				
			::setValByAlias()
		endIf	
	else
		lRet := .F.
	endIf

return lRet
/*/{Protheus.doc} VendedorClass
Carrega os dados do vendedor.
@author João Couto
@since 24/07/2024
/*/
method setValByAlias() class VendedorClass

    ::cFilVendd        := SA3->A3_FILIAL
    ::cCodVendd        := SA3->A3_COD
    ::cNome            := SA3->A3_NOME
    ::cNomeRedz        := SA3->A3_NREDUZ
    ::cCep             := SA3->A3_CEP
    ::cDDD             := SA3->A3_DDDTEL
    ::cTell            := SA3->A3_TEL
    ::cCGC             := SA3->A3_CGC
    ::cEmail           := SA3->A3_EMAIL
    ::cGerente         := SA3->A3_GEREN
    ::cSupervisor      := SA3->A3_SUPER 
return

/*/{Protheus.doc} VendedorClass
Prepara os dados do vendedor para as operações.
@author João Couto
@since 24/07/2024
/*/
method prepDados_Vendd() class VendedorClass

    if ::nOpc == ::OPC_ALTERAR
        ::getById(.F.)
    endif

	if(!Empty(::cFilVendd))
		AAdd(::aValA3,{"A3_FILIAL" , PadR(::cFilVendd,TamSx3("A3_FILIAL")[1])	, nil})
	endIf

    if(!Empty(::cCodVendd))
		AAdd(::aValA3,{"A3_COD" , PadR(::cCodVendd,TamSx3("A3_COD")[1])	, nil})
	endIf

    if(!Empty(::cNome))
		AAdd(::aValA3,{"A3_NOME" , PadR(::cNome,TamSx3("A3_NOME")[1])	, nil})
	endIf
    
    if(!Empty(::cNomeRedz))
		AAdd(::aValA3,{"A3_NREDUZ" , PadR(::cNomeRedz,TamSx3("A3_NREDUZ")[1])	, nil})
	endIf
    
    if(!Empty(::cCep))
		AAdd(::aValA3,{"A3_CEP" , PadR(::cCep,TamSx3("A3_CEP")[1])	, nil})
	endIf

    if(!Empty(::cDDD))
		AAdd(::aValA3,{"A3_DDDTEL" , PadR(::cDDD,TamSx3("A3_DDDTEL")[1])	, nil})
	endIf
    
    if(!Empty(::cTell))
		AAdd(::aValA3,{"A3_TEL" , PadR(::cTell,TamSx3("A3_TEL")[1])	, nil})
	endIf

    if(!Empty(::cCGC))
		AAdd(::aValA3,{"A3_CGC" , PadR(::cCGC,TamSx3("A3_CGC")[1])	, nil})
	endIf

    if(!Empty(::cEmail))
		AAdd(::aValA3,{"A3_EMAIL" , PadR(::cEmail,TamSx3("A3_EMAIL")[1])	, nil})
	endIf

    if(!Empty(::cGerente))
		AAdd(::aValA3,{"A3_GEREN" , PadR(::cGerente,TamSx3("A3_GEREN")[1])	, nil})
	endIf

    if(!Empty(::cSupervisor))
		AAdd(::aValA3,{"A3_SUPER" , PadR(::cSupervisor,TamSx3("A3_SUPER")[1])	, nil})
	endIf

    if( ::nOpc == ::OPC_EXCLUIR)
	    DbSelectArea("SA3")  
		SA3->( DbSetOrder(1) )
		
		SA3->(DbSeek( xFilial("SA3") + 	PadR(::cFilVendd	, TamSx3("A3_FILIAL"	)[1]) +; 
										PadR(::cCodVendd 	, TamSx3("A3_COD   "	)[1]) +;
                                        PadR(::cNome 	    , TamSx3("A3_NOME  "	)[1]) +;
                                        PadR(::cNomeRedz 	, TamSx3("A3_NREDUZ"	)[1]) +;
                                        PadR(::cCep  	    , TamSx3("A3_CEP   "    )[1]) +;
                                        PadR(::cDDD      	, TamSx3("A3_DDDTEL"	)[1]) +;
                                        PadR(::cTell 	    , TamSx3("A3_TEL   "	)[1]) +;
                                        PadR(::cCGC 	    , TamSx3("A3_CGC   "	)[1]) +;
                                        PadR(::cEmail 	    , TamSx3("A3_EMAIL "	)[1]) +;
                                        PadR(::cGerente 	, TamSx3("A3_GEREN "	)[1]) +;
                                        PadR(::cSupervisor 	, TamSx3("A3_SUPER "	)[1])  ) ) 
	endif
    

return
/*/{Protheus.doc} VendedorClass
execução das operções via MsExecAuto.
@author João Couto
@since 24/07/2024
/*/
method manRegis_Vendd(nOpc) class VendedorClass

    local   cResult     := ""
	private lMsErroAuto := .F.
    private lMsHelpAuto := .T.
	default ::nOpc        := ::OPC_INCLUIR


    MsExecAuto({ |x, y| MATA040(x, y) }, ::aValA3, ::nOpc )

        if(lMsErroAuto)
            ::cError := Alltrim( u_MsgErroAuto() )

            Conout("ERRO MSExecAuto MATA040")
            
            cResult := "ERRO MSExecAuto MATA040"
        else
            cResult := "Sucesso MSExecAuto MATA040 "

			Conout("Sucesso MSExecAuto MATA040 ")
		endIf

return
