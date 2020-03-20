np.comp.f<-function(x,nombre.variables,variable.factor,dunn=F,...){
  x[,variable.factor]<-as.factor(x[,variable.factor])
  temp<-x[c(nombre.variables,variable.factor)]
  rm(x)
  if(dunn==F){
    pvalmatrix<-matrix(NA,2,length(nombre.variables))
    pvalmatrix[1,]<-nombre.variables
    r<-1
    for(w in nombre.variables){
      l<-kruskal.test(temp[,w]~temp[,variable.factor])
      pvalmatrix[2,r]<-l$p.value
      r<-r+1
    }
    pvalmatrix
    }
  else{
    library(FSA)
    lista<-list()
    r<-1
    for(w in nombre.variables){
        q<-dunnTest(temp[,w]~temp[,variable.factor],...)
        lista[[r]]<-q$res
        r<-r+1
        }
    names(lista)<-nombre.variables
    lista
  }
}
