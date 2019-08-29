# Este projeto é requisito para finalizar a semana 4 do segundo Curso de Data Science
# R Programming
outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#grep("Heart.Failure", nome.colunas) # função que retorna um vetor contendo as posições
                                    # onde a substring foi encontrada

dados <- outcomes[, c(2,6,7,11,17,23)]
dados[,c(4,5,6)] <-lapply(dados[,c(4,5,6)], as.numeric)
valid.outcome <- c("heartattack", "heartfailure", "pneumonia")
names(dados) <- c("Hospital","City","State", valid.outcome)

#dados.selecionados <- dados[dados$State = state]
best <- function(state, outcome){
  ## Read outcome data
  # dados disponibilizados um nível acima para facilitar exercício
  
  ## Check that state and outcome are valid
  
  #a função validestateoutcome vai receber o estado e o problema (outcome) selecionado
  # verifica se são válidos ambos e caso positivo retorna uma lista com todos os 
  #hospitais e problemas do estado.
  
  dados.estado.selecionado <- validatestateoutcome(state,outcome)
  
  # a função stateoutcomefilter recebe o problema (outcome) e a lista de hospitais 
  # do estado selecionado, devolvendo uma lista de casos completos (sem NA) dos 
  # hospitais do estado selecionado
  
  dados.filtrados <- stateoutcomefilter(outcome,dados.estado.selecionado)
  
  dados.filtrados.ordenados <- dados.filtrados[order(dados.filtrados[outcome],dados.filtrados["Hospital"]),]
  dados.filtrados.ordenados[1,"Hospital"]  # Saída correta
  #dados.filtrados.ordenados #saida para teste

}

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  # dados disponibilizados um nível acima para facilitar exercício
  
  ## Check that state and outcome are valid
  dados.estado.selecionado <- validatestateoutcome(state,outcome)
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  dados.filtrados <- stateoutcomefilter(outcome, dados.estado.selecionado)
  dados.filtrados.ordenados <- dados.filtrados[order(dados.filtrados[outcome],dados.filtrados["Hospital"]),]
  numlinhas <- nrow(dados.filtrados)
  
  rankeamento <- 1:numlinhas
  dados.rankeados <- cbind(dados.filtrados.ordenados,rankeamento)
  names(dados.rankeados) <- c("Hospital.name", "Rate","Rank")
  melhorhospital <- min(dados.rankeados$Rank)
  piorhospital <- max(dados.rankeados$Rank)
  
  if (num == "best"){
    return(dados.rankeados[1,1])
  } else if (num == "worst"){
    return(dados.rankeados[numlinhas,1])
  } else if (num < melhorhospital || num > piorhospital ){
    return(NA)
  } else{
    return(dados.rankeados[num,1])
  }

}



validatestateoutcome <- function(state, outcome){
  estado.selecionado <- dados$State == state
  
  dados.estado.selecionado <- dados[estado.selecionado,]
  
  if (!any(estado.selecionado)){
    print("Estado selecionado não existe na base de dados!!!")
    break
  }
  
  problema.selecionado <- valid.outcome == outcome
  
  if(!any(problema.selecionado)){
    print("Problema selecionado não é válido!!!")
    break
  }
  return(dados.estado.selecionado)
}



stateoutcomefilter <- function(outcome, dados.estado.selecionado ){
  
  hospital.outcome <- dados.estado.selecionado[,names(dados.estado.selecionado)%in% c("Hospital", outcome)]
  
  hospital.outcome.validos <- complete.cases(hospital.outcome)
  dados.filtrados<- hospital.outcome[hospital.outcome.validos, c("Hospital", outcome)]
  
  return(dados.filtrados)
}
  
