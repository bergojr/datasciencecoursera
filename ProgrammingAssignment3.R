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
  estado.selecionado <- dados$State == state
  
  dados.estado.selecionado <- dados[estado.selecionado,]
  print(dados.estado.selecionado)
  if (!any(estado.selecionado)){
    print("Estado selecionado não existe na base de dados!!!")
    break
  }
  
  problema.selecionado <- valid.outcome == outcome
  
  if(!any(problema.selecionado)){
    print("Problema selecionado não é válido!!!")
    break
  }
  
  dados.estado.selecionado2 <- dados.estado.selecionado[order(outcome),]
  print(dados.estado.selecionado2)
  dados.estado.selecionado2
  
  #hospital.ordenado <- dados.estado.selecionado[order(dados.estado.selecionado$Hospital, dados.estado.selecionado[outcome])]
  #hospital.ordenado
  ##problema.selecionado.estado <- dados.estado.selecionado[outcome]
  ##problema.selecionado.estado
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  #hospital.problema <- c(dados.estado.selecionado$Hospital , problema.selecionado.estado)
  #hospital.problema
}
