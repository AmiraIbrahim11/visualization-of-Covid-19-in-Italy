#Import Data 
library(readr)
covid_age <- read_csv(file.choose())
covid_disease <- read.csv(file.choose())

#load libraries 
library(ggplot2)
library(tidyr)

## visualization of cases by age
ggplot(covid_age)+
geom_bar(aes(y=total_cases,x=age_classes),stat = "identity",fill=4)+
  labs(title = "Total Cases By Age in Italy",x="Age classes",y="Cases")

##cases by age & sex :
Bar_plot_Data1 <- gather(covid_age,Sex,Cases,c(male_cases,female_cases))
Bar_plot_Data1 <- Bar_plot_Data1 %>% mutate(Sex=ifelse(Sex=="male_cases","male","female"))
ggplot(Bar_plot_Data1)+
  geom_bar(aes(y=Cases,x=age_classes,fill=Sex),stat = "identity",position = "dodge")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(title = "No of cases related to Sex & Age in Italy",y="Cases",x="Age")

##Deaths by age & sex :
Bar_plot_Data2 <- gather(covid_age,sex,Deaths,c(male_deaths,female_deaths))
Bar_plot_Data2 <- Bar_plot_Data2 %>% mutate(sex=ifelse(sex=="male_deaths","male","female"))
ggplot(Bar_plot_Data2)+
  geom_bar(aes(y=Deaths,x=age_classes,fill=sex),stat = "identity",position = "dodge")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(title = "No of deaths related to Sex & Age in Italy",y="Deaths",x="Age")

##Cases by disease and sex  :
Bar_plot_Data <- gather(covid_disease,Sex,Total,c(Men,Women))
ggplot(Bar_plot_Data)+
  geom_bar(aes(y=Total,x=Disease,fill=Sex),stat = "identity",position = "dodge")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(title = "No of cases related to Disease & Sex in Italy",y="Cases")+
  ylim(c(0,600))+
  coord_flip()