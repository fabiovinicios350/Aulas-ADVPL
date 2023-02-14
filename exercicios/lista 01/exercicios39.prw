//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function SorteiaAluno()
  Local aAluno := {{0,'Daniele'},{1,'Edison'},{2,'Fabio'},{3,'Gabriela'},{4,'Giulliana'},{5,'Gustavo F'},{6,'Gustavo H'},{7,'Henrique'},{8,'Joao'},{9,'Lucas'},{10,'Matheus'},{11,'Natan'},{12,'Ruan'},{13,'Tamiris'},{14,'Vinicius'},{15,'Alexandre Junior'},{16,'André Santos'},{17,'Ighor Lima'},{18,'Gustavo Correia'}}
  Local nSorteio

  FwAlertInfo("Algoritimo para Sortear Aluno","Bem vindo!")

  nSorteio := Randomize( 1, len(aAluno))

  FwAlertSuccess('O Nome sortiado e o: '+aAluno[nSorteio][2],'Resultado!')

Return
