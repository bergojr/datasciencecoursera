# Este projeto é requisito para finalizar a semana 4 do segundo Curso de Data Science
# R Programming
outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

dados <- outcomes[, c(2,6,7,11,17,23)]
dados[,c(4,5,6)] <-lapply(dados[,c(4,5,6)], as.numeric)
valid.outcome <- c("heartattack", "heartfailure", "pneumonia")
names(dados) <- c("Hospital","City","State", valid.outcome)
melhor <- data.frame()
pior<- data.frame()
selecao <- data.frame()
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
  outcome.valido <- complete.cases(outcome.selecionado)
  outcome.valido <- outcome.selecionado[outcome.valido,]
  dados.por.estado <- split(outcome.valido,outcome.valido$State)
  
  for (estado in dados.por.estado){
    estado.ordenado <- estado[order(estado[outcome],estado["Hospital"]),]
    numlinhas <- nrow(estado.ordenado)
    if(num == "best"){
      melhor[1,1] <-(estado.ordenado[1,"Hospital"])
      melhor[1,2] <- estado$State[1]
      resultado <- rbind(resultado, melhor)
      
    } else if( num == "worst"){
      pior[1,1] <-(estado.ordenado[numlinhas,"Hospital"])
      pior[1,2] <- estado$State[1]
      resultado <- rbind(resultado, pior)
    }else{
      selecao[1,1] <-(estado.ordenado[num,"Hospital"])
      selecao[1,2] <- estado$State[1]
      resultado <- rbind(resultado, selecao)
    }
  }
  names(resultado) <- c("hospital","state")
  resultado
  #estado

  ## For each state, find the hospital of the given rank
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

