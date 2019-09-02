# Este projeto é requisito para finalizar a semana 4 do segundo Curso de Data Science
# R Programming
outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

dados <- outcomes[, c(2,6,7,11,17,23)]
dados[,c(4,5,6)] <-lapply(dados[,c(4,5,6)], as.numeric)
valid.outcome <- c("heartattack", "heartfailure", "pneumonia")
names(dados) <- c("Hospital","City","State", valid.outcome)
resultado <- data.frame()



#dados.selecionados <- dados[dados$State = state]

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  problema.selecionado <- valid.outcome == outcome
  
  if(!any(problema.selecionado)){
    print("Problema selecionado não é válido!!!")
    break
  }
  
  outcome.selecionado <- cbind(dados[,1:3],dados[outcome])
  dados.por.estado <- split(outcome.selecionado,outcome.selecionado$State)
  
  for (estado in dados.por.estado){
    estado.ordenado <- estado[order(estado[outcome],estado["Hospital"]),]
    estado.ordenado.inv <- estado[order(estado[outcome],(estado["Hospital"]),decreasing = TRUE),]
    numlinhas <- nrow(estado)
    print(numlinhas)
    if(num == "best"){
      melhor <- estado.ordenado[1,c("Hospital","State")]
      resultado <- rbind(resultado, melhor)
    } else if( num == "worst"){
      pior <- estado.ordenado[numlinhas,c("Hospital","State")]
      print(pior)
      resultado <- rbind(resultado, pior)
    }else{
      selecao <- estado.ordenado[num,c("Hospital","State")]
      resultado <- rbind(resultado, selecao)
    }
  }
  resultado

    #for(tabela in teste2){print(tabela[,c(4:6)])}
    
  ## For each state, find the hospital of the given rank
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

