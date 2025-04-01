library(stm)
library(quanteda)

dfm <- ZA7731_sA_open_ended_v1_0_0 %>%
  corpus(text_field = "kp25_840s") %>% 
  tokens() %>% 
  tokens_tolower() %>% 
  dfm()

dfm

stm <- dfm %>% 
  convert(to = "stm")

## Filtering out infrequent terms
out <- prepDocuments(stm$documents, stm$vocab, stm$meta, lower.thresh=10)

docs <- out$documents
vocab <- out$vocab
meta <- out$meta

#Process the data for analysis.
temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
meta<-temp$meta
vocab<-temp$vocab
docs<-temp$documents
out <- prepDocuments(docs, vocab, meta)
docs<-out$documents
vocab<-out$vocab
meta <-out$meta

stm_13 <- stm(documents = out$documents,
              vocab = out$vocab,
              K = 3,
              seed = 832,
              #prevalence =~ party,
              max.em.its = 25, # maximum number of EM iterations
              data = out$meta,
              init.type = "Spectral",
              verbose = TRUE # change to FALSE to prevent console messages
)

labelTopics(stm_13)

plot(stm_13)

summary(stm_13)

head(gadarian)
